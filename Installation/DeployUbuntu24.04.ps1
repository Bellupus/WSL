function Test-Admin {
    if (-not (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
        Write-Host '[ERREUR] DOIT être exécuté en mode administrateur.' -ForegroundColor Red
        Read-Host 'Appuyez sur Entrée pour relancer en mode admin...'
        Start-Process pwsh -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
        exit
    } else {
        Write-Host "`n[ADMIN] Le script est lancé en mode administrateur." -ForegroundColor Green
    }
}
function Ask-YesNo($question) {
    do {
        $rep = Read-Host "$question (o/n)"
    } until ($rep -match '^[onON]$')
    return ($rep.ToLower() -eq 'o')
}

function Ask-Choice($question, $choices) {
    Write-Host $question -ForegroundColor Cyan
    for ($i=0; $i -lt $choices.Count; $i++) {
        Write-Host "$($i+1). $($choices[$i])"
    }
    do {
        $rep = Read-Host "Ton choix (1-$($choices.Count))"
    } until ($rep -match "^[1-$($choices.Count)]$")
    return $choices[$rep-1]
}

function Ask-Directory($question, $default) {
    $rep = Read-Host "$question (défaut : $default)"
    if ([string]::IsNullOrWhiteSpace($rep)) { return $default }
    else { return $rep }
}

function Progress-Bar($step, $total) {
    $percent = [math]::Round(($step / $total) * 100)
    Write-Host "Progression : [$step/$total] ($percent`%)`n" -ForegroundColor Green
}

function Run-Command($cmd, $desc) {
    Write-Host "`n--- $desc ---" -ForegroundColor Yellow
    Write-Host "Commande : $cmd" -ForegroundColor Gray
    Invoke-Expression $cmd
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Erreur. Arrêt du script." -ForegroundColor Red
        Read-Host "Appuie sur [Entrée] pour fermer le terminal."
        exit 1
    }
}

# 1. Reglage des préférences de WSL
Write-Host "=== Configuration WSL ===" -ForegroundColor Magenta

# Mapping des noms affichés <-> noms WSL
$distroMap = @{
    "Ubuntu 22.04 (Défaut)" = "Ubuntu-22.04"
    "Ubuntu 24.04" = "Ubuntu-24.04"
    "Kali" = "kali-linux"
    "Archlinux" = "Arch"
    "Debian" = "Debian"
}
$distros = $distroMap.Keys

$distroDisplay = Ask-Choice "Quelle distribution ?" $distros
$distro = $distroMap[$distroDisplay]

# Définir la distribution par défaut ?
$setDefault = Ask-YesNo "Veux-tu définir $distroDisplay comme distribution WSL par défaut ?"

# Répertoire
$customDir = Ask-YesNo "Veux-tu choisir un répertoire personnalisé pour la distribution $distroDisplay ?"
if ($customDir) {
    # Répertoire par défaut WSL (AppData\Local\Packages)
    $defaultWSLDir = "$env:LOCALAPPDATA\Packages"
    $targetDir = Ask-Directory "Indique le chemin complet du répertoire" $defaultWSLDir
} else {
    $targetDir = ""
}

# Mise à jour pré-release WSL
$updatePre = Ask-YesNo "Mettre à jour WSL en version pré-release ?"


# --- Récapitulatif ---

Write-Host "`n=== Récapitulatif de tes choix ===" -ForegroundColor Cyan
Write-Host "Distribution      : $distroDisplay"
if ($customDir) {
    Write-Host "Répertoire cible  : $targetDir"
} else {
    Write-Host "Répertoire cible  : Par défaut (AppData)"
}
Write-Host "Par défaut WSL    : $setDefault"
Write-Host ""
Read-Host "Appuie sur [Entrée] pour lancer l'installation..."

# Calcul dynamique du nombre d'étapes
$totalSteps = 3 # WSL2, Installation, Paquets essentiels
if ($updatePre) { $totalSteps++ } # Mise à jour pré-release
if ($setDefault) { $totalSteps++ } # Définir par défaut
if ($customDir) { $totalSteps++ } # Export/import custom

$step = 1

# 1. Définir WSL 2 comme version par défaut (toujours)
Run-Command "wsl --set-default-version 2" "Définir WSL 2 comme version par défaut"
Progress-Bar $step $totalSteps
$step++

# 2. Mettre à jour WSL (pré-release) si demandé
if ($updatePre) {
    Run-Command "wsl --update --pre-release" "Mise à jour WSL (pré-release)"
    Progress-Bar $step $totalSteps
    $step++
}

# 3. Installation + placement
if ($customDir) {
    # Installation directe pour export/import
    Run-Command "wsl --install -d $distro --root" "Installation de $distroDisplay"
    Run-Command "wsl --export $distro $targetDir\$distro-backup.tar" "Export de $distroDisplay vers $targetDir"
    Run-Command "wsl --unregister $distro" "Suppression de $distroDisplay pour déplacement"
    Run-Command "wsl --import $distro $targetDir $targetDir\$distro-backup.tar --version 2" "Import de $distroDisplay dans $targetDir"
    Progress-Bar $step $totalSteps
    $step++
} else {
    Run-Command "wsl --install -d $distro" "Installation de $distroDisplay"
    Progress-Bar $step $totalSteps
    $step++
}

# 4. Définir la distribution par défaut si demandé
if ($setDefault) {
    Run-Command "wsl --set-default $distro" "Définir $distroDisplay par défaut"
    Progress-Bar $step $totalSteps
    $step++
}

# 5. Mise à jour et installation des paquets essentiels
$updateCmd = "sudo apt update && sudo apt upgrade -y"
$installCmd = "sudo apt install git curl build-essential unzip wget -y"
Run-Command "wsl -d $distro -- $updateCmd" "Mise à jour des paquets"
Run-Command "wsl -d $distro -- $installCmd" "Installation des outils essentiels"
Progress-Bar $step $totalSteps

Write-Host "`nConfiguration terminée avec succès !" -ForegroundColor Green
Read-Host "Appuie sur [Entrée] pour fermer le terminal."
