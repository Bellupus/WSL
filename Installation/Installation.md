# Installation de WSL

## Lister les distributions disponibles en ligne

Pour lister les distributions disponibles, utilisez la commande :
`wsl --list --online`

Quelques distributions courantes que vous pouvez installer :
* Ubuntu 22.04 LTS (Version par défaut installée)
* Ubuntu 24.04 LTS (La toute dernière version)
* Debian 12 (bookworm)
* Kali Linux 2024.2

## Installer une distribution Linux

Pour installer une distribution spécifique, utilisez la commande suivante :
`wsl --install -d <NomDeLaDistribution>`

Si vous ne spécifiez pas de distribution, Ubuntu 22.04 LTS sera installée par défaut :
`wsl --install`

Exemple pour installer Ubuntu 24.04 :
`wsl --install -d Ubuntu-24.04`

## Déplacer une distribution vers un autre répertoire 
1. `wsl --export <NomDeLaDistribution> <Repertoire>\<NomDeLaDistribution>-backup.tar` Exporte la distribution <NomDeLaDistribution> dans le fichier <Repertoire>\<NomDeLaDistribution>-backup.tar
2. `wsl --unregister <NomDeLaDistribution>` Désinstalle <NomDeLaDistribution> de WSL
3. `wsl --import <NomDeLaDistribution> <RacineDeLaDistribution>\<NomDeLaDistribution> <Repertoire>\<NomDeLaDistribution>-backup.tar --version 2` Installe <NomDeLaDistribution> dans <RacineDeLaDistribution>\<NomDeLaDistribution>
4. `wsl -d <NomDeLaDistribution>` Ouvre une session dans <NomDeLaDistribution>
5. `sudo apt update && sudo apt upgrade -y` Met à jour la liste des paquets et installe les dernières versions
6. `sudo apt install git curl build-essential unzip wget -y` Installer les logiciels de base

## Voici quelques commandes utiles après l'installation de WSL :
* `wsl --list --verbose` : Affiche la liste des distributions installées avec leurs détails (nom, version WSL, état, si elle est la distribution par défaut).
* `wsl --set-default-version <Version>` : Définit la version par défaut de WSL (1 ou 2).
* `wsl --set-default <NomDeLaDistribution>` : Choisit la distribution par défaut (celle qui est lancée lorsque vous exécutez la commande `wsl`).
* `wsl -d <NomDeLaDistribution>` : Lance une distribution WSL spécifique. Remplacez `<NomDeLaDistribution>` par son nom exact.
* `wsl [commande]` : Exécute une commande Linux spécifiée directement depuis PowerShell ou CMD, sans ouvrir un shell WSL interactif.
* `wsl.exe` : Lance WSL en ligne de commande. `wsl.exe` est l'exécutable, fonctionnellement équivalent à la commande `wsl`.
* `wsl pwd` : Affiche le répertoire courant dans l'environnement Linux de la distribution WSL par défaut.
* `get-date` : (Commande PowerShell) Affiche la date et l'heure actuelles depuis PowerShell.
* `wsl date` : Affiche la date et l'heure actuelles dans l'environnement Linux via WSL (exécute la commande `date` de Linux).
* `wsl --update --pre-release` : Met à jour WSL vers une version préliminaire (préversion).
