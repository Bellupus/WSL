# Commandes Bash de base

### 1. Navigation et Exploration du Système de Fichiers
* `ls` : Liste le contenu du dossier (fichiers et sous-dossiers).
* `cd <dossier>` : Change de répertoire pour aller dans `<dossier>`.
* `pwd` : Affiche le chemin complet du répertoire actuel.
* `history` : Affiche l'historique des commandes que vous avez précédemment tapées.
* `clear` : Nettoie l'écran du terminal, offrant un espace de travail propre.
* `tree` : Affiche l'arborescence des dossiers et fichiers à partir du répertoire courant (peut nécessiter une installation via `sudo apt install tree`).
* `exit` : Quitte le shell actuel ou la session de terminal.

### 2. Manipulation de Fichiers et Dossiers
* `mkdir <nom_dossier>` : Crée un nouveau dossier nommé `<nom_dossier>`.
* `touch <fichier>` : Crée un fichier vide s'il n'existe pas, ou met à jour sa date de modification s'il existe.
* `cp <source> <destination>` : Copie le fichier/dossier `<source>` vers `<destination>`.
* `mv <source> <destination>` : Déplace ou renomme le fichier/dossier `<source>` en `<destination>`.
* `rm <fichier>` : Supprime (efface) `<fichier>`. (Attention, irréversible !)
* `rm -r <dossier>` : Supprime le `<dossier>` et tout son contenu. (Attention, irréversible !)
* `head <fichier>` : Affiche les premières lignes (10 par défaut) d'un `<fichier>`.
* `tail <fichier>` : Affiche les dernières lignes (10 par défaut) d'un `<fichier>`.
    * *Astuce :* `tail -f <fichier_log>` est très utile pour suivre en temps réel les ajouts à un fichier journal (`Ctrl+C` pour arrêter).
* `diff <fichier1> <fichier2>` : Compare deux fichiers ligne par ligne et affiche leurs différences.

### 3. Recherche et Filtrage de Texte/Fichier
* `cat <fichier>` : Affiche tout le contenu d'un `<fichier>` (idéal pour les petits fichiers).
* `less <fichier>` : Permet de naviguer (haut/bas) dans le contenu d'un `<fichier>` (idéal pour les gros fichiers, utilisez `q` pour quitter).
* `grep "<motif>" <fichier>` : Recherche le `<motif>` (texte) à l'intérieur du `<fichier>`.
* `find . -name "<nom_fichier>"` : Recherche `<nom_fichier>` dans le répertoire actuel (`.`) et ses sous-dossiers.
* `wc <fichier>` : Compte le nombre de lignes, de mots et d'octets dans un `<fichier>` (Word Count).

### 4. Informations Utilisateur et Système
* `whoami` : Affiche votre nom d'utilisateur actuel.
* `id <utilisateur>` : Affiche les identifiants numériques de l'utilisateur (UID), du groupe principal (GID) et des groupes auxquels il appartient. Si `<utilisateur>` est omis, affiche les informations pour l'utilisateur courant.
* `hostname` : Affiche le nom d'hôte du système.
* `uname -a` : Affiche des informations détaillées sur le système et le noyau Linux.
* `lsb_release -a` : Affiche les informations détaillées de la distribution Linux (version, nom de code, etc.).
* `date` : Affiche la date et l'heure actuelles du système.
* `uptime` : Indique depuis combien de temps le système est en fonctionnement, ainsi que la charge moyenne.
* `df -h` : Affiche l'espace disque utilisé et libre (format lisible par l'humain `-h`).
* `free -h` : Affiche l'utilisation de la mémoire vive (RAM) et du swap (format lisible `-h`).

### 5. Gestion des Paquets (pour Debian/Ubuntu comme WSL Ubuntu)
* `sudo apt update` : Rafraîchit la liste des paquets disponibles depuis les serveurs.
* `sudo apt upgrade` : Met à jour tous les paquets logiciels installés vers leurs dernières versions.
* `sudo apt install <nom_du_paquet>` : Installe le logiciel `<nom_du_paquet>`.
* `sudo apt remove <nom_du_paquet>` : Désinstalle le logiciel `<nom_du_paquet>`.
* `sudo apt autoremove` : Supprime les paquets qui ont été installés automatiquement comme dépendances et qui ne sont plus nécessaires.
* `sudo apt search <terme_recherche>` : Recherche des paquets disponibles contenant le `<terme_recherche>`.
* `sudo apt show <nom_du_paquet>` : Affiche des informations détaillées sur un `<nom_du_paquet>` spécifique.

### 6. Gestion des Processus
* `ps aux` : Liste tous les processus en cours d'exécution sur le système.
* `top` (ou `htop` si installé) : Affiche un tableau interactif des processus et de leur consommation de ressources (utilisez `q` pour quitter).
* `pgrep <nom_processus>` : Recherche et affiche les identifiants (PID) des processus dont le nom correspond à `<nom_processus>`.
* `kill <PID>` : "Tue" (arrête) un processus en utilisant son identifiant unique (PID).
* `killall <nom_du_processus>` : "Tue" tous les processus portant `<nom_du_processus>`.
* `Ctrl+Z` (raccourci clavier) : Suspend le processus en cours d'exécution au premier plan. Vous pouvez ensuite utiliser `jobs` pour lister les tâches suspendues, `fg %<num_job>` pour reprendre une tâche au premier plan, ou `bg %<num_job>` pour la reprendre en arrière-plan.

### 7. Commandes Réseau de Base
* `ip addr` (ou `ip a`) : Affiche les interfaces réseau et les adresses IP configurées.
* `ping <adresse_ip_ou_nom_hote>` : Envoie des requêtes pour tester la connectivité vers un `<hôte>`.
* `curl <URL>` : Récupère des données depuis une `<URL>` (affiche le contenu d'une page web, télécharge un fichier).
    * *Alternative courante pour télécharger :* `wget <URL>`
* `ssh <utilisateur>@<hote>` : Permet de se connecter de manière sécurisée à une machine distante (`<hote>`) en tant que `<utilisateur>`.
* `ss -tulnp` : Affiche les sockets réseau (connexions TCP/UDP en écoute, programmes associés). (Remplace souvent l'ancienne commande `netstat`).

### 8. Administration et Permissions
* `sudo <commande>` : Exécute la `<commande>` avec les droits de superutilisateur (administrateur).
* `passwd` : Permet de changer le mot de passe de l'utilisateur courant.
* `chmod +x <nom_du_script>` : Rend un fichier `<nom_du_script>` exécutable.
* `chown <utilisateur>:<groupe> <fichier>` : Change le propriétaire (`<utilisateur>`) et/ou le `<groupe>` d'un `<fichier>`.
* `sudo shutdown now` : Éteint le système immédiatement.
* `sudo shutdown -r now` : Redémarre le système immédiatement.

### 9. Interaction WSL/Windows
* `explorer.exe .` (exécutée depuis WSL) : Ouvre l'Explorateur de fichiers Windows dans le répertoire WSL actuel.
* `wslpath "<chemin_windows>"` : Convertit un `<chemin_windows>` (ex: `"C:\Utilisateurs\VotreNom\document.txt"`) en son équivalent Linux utilisable dans WSL.
* `<commande_windows>.exe` (ex: `ipconfig.exe`, `notepad.exe <mon_fichier.txt>`) (depuis WSL) : Exécute un programme ou une commande Windows.
* `wsl --list --verbose` (ou `wsl -l -v`) (exécutée depuis PowerShell ou CMD Windows) : Liste les distributions WSL installées et leur état.
* `wsl --shutdown` (exécutée depuis PowerShell ou CMD Windows) : Arrête immédiatement toutes les distributions WSL en cours d'exécution.

### 10. Obtenir de l'Aide
* `<commande> --help` : Affiche une aide concise et les options principales pour une `<commande>`.
* `man <commande>` : Affiche la page de manuel détaillée pour une `<commande>` (utilisez les flèches pour naviguer, `q` pour quitter).
* `apropos <mot_cle>` (ou `man -k <mot_cle>`) : Recherche les pages de manuel dont la description contient le `<mot_cle>`.

### 11. Archivage et Compression
* `tar -czvf <archive.tar.gz> <fichier_ou_dossier_a_archiver...>` : Crée une archive Tar (`.tar`) et la compresse avec Gzip (`.gz`).
* `tar -xzvf <archive.tar.gz>` : Extrait le contenu d'une archive `.tar.gz`.
* `zip <archive.zip> <fichier_ou_dossier_a_zipper...>` : Crée une archive Zip.
* `unzip <archive.zip>` : Extrait le contenu d'une archive Zip.
