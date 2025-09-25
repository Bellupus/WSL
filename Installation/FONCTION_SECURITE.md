# Fonction de Vérification d'Informations Sensibles

## Description

La fonction `Test-SensitiveInfo` a été ajoutée au script `DeployUbuntu24.04.ps1` pour détecter automatiquement les informations potentiellement sensibles dans les entrées utilisateur et les variables du script.

## Fonctionnalités

Cette fonction analyse le contenu pour détecter :

### 1. Chemins personnels utilisateur
- Chemins contenant `\Users\[username]`
- Répertoires `AppData` 
- Variables d'environnement utilisateur (`$env:USERNAME`, `$env:USERPROFILE`)

### 2. Informations de credential potentielles
- Motifs contenant : `password`, `pwd`, `pass`, `secret`, `key`, `token`
- Détection insensible à la casse

### 3. Données encodées suspectes
- Chaînes en Base64 potentielles (20+ caractères alphanumériques avec padding)

### 4. Références réseau locales
- Adresses `localhost` ou `127.0.0.1`

## Utilisation dans le script

La fonction est automatiquement appelée lors de l'exécution du script pour vérifier :
- Le répertoire personnalisé choisi par l'utilisateur
- Le nom de distribution sélectionné

## Exemple de sortie

```
=== Vérification des informations sensibles ===

Avertissements de sécurité détectés :
  [SENSIBLE] Chemin utilisateur personnel détectée dans la variable 'targetDir' : 'C:\Users\John\AppData\Local\WSL'
  [SENSIBLE] Répertoire de données d'application utilisateur détectée dans la variable 'targetDir' : 'C:\Users\John\AppData\Local\WSL'

Continuer malgré ces avertissements ? (o/n)
```

## Sécurité

La fonction aide à :
- Identifier les informations personnelles qui pourraient être exposées
- Alerter sur les chemins contenant des données utilisateur sensibles  
- Détecter les motifs de mots de passe ou clés dans les entrées
- Permettre à l'utilisateur de prendre une décision éclairée avant de continuer

## Tests

La fonction a été testée avec différents types d'entrées pour valider sa capacité à détecter correctement les informations sensibles tout en évitant les faux positifs sur du texte normal.