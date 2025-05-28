# Commandes Bash de base

### 1. Navigation et Exploration du Système de Fichiers
* `ls` : Liste contenu du dossier (fichiers et sous-dossiers).
* `cd <dossier>` : Change de répertoire pour aller dans `<dossier>`.
* `pwd` : Affiche le chemin complet du répertoire actuel.

### 2. Manipulation de Fichiers et Dossiers
* `mkdir <nom_dossier>` : Crée un nouveau dossier nommé `<nom_dossier>`.
* `cp <source> <destination>` : Copie le fichier/dossier `<source>` vers `<destination>`.
* `mv <source> <destination>` : Déplace ou renomme le fichier/dossier `<source>` en `<destination>`.
* `rm <fichier>` : Supprime (efface) `<fichier>`. (Attention, irréversible !)
* `rm -r <dossier>` : Supprime le `<dossier>` et tout son contenu. (Attention, irréversible !)

### 3. Recherche et Filtrage de Texte/Fichier
* `cat <fichier>` : Affiche tout le contenu d'un `<fichier>` (idéal pour les petits fichiers).
* `less <fichier>` : Permet de naviguer (haut/bas) dans le contenu d'un `<fichier>` (idéal pour les gros fichiers).
* `grep "<motif>" <fichier>` : Recherche le `<motif>` (texte) à l'intérieur du `<fichier>`.
* `find . -name "<nom_fichier>"` : Recherche `<nom_fichier>` dans le répertoire actuel (`.`) et ses sous-dossiers.

### 4. Informations Utilisateur et Système
* `whoami` : Affiche ton nom d'utilisateur actuel.
* `uname -a` : Affiche des informations détaillées sur le système et le noyau Linux.
* `df -h` : Affiche l'espace disque utilisé et libre (format lisible par l'humain `-h`).
* `free -h` : Affiche l'utilisation de la mémoire vive (RAM) et du swap (format lisible).

### 5. Gestion des Paquets (pour Debian/Ubuntu comme WSL Ubuntu)
* `sudo apt update` : Rafraîchit la liste des paquets disponibles depuis les serveurs.
* `sudo apt upgrade` : Met à jour tous les paquets logiciels installés vers leurs dernières versions.
* `sudo apt install <nom_du_paquet>` : Installe le logiciel `<nom_du_paquet>`.
* `sudo apt remove <nom_du_paquet>` : Désinstalle le logiciel `<nom_du_paquet>`.

### 6. Gestion des Processus
* `ps aux` : Liste tous les processus en cours d'exécution sur le système.
* `top` (ou `htop` si installé) : Affiche un tableau interactif des processus et de leur consommation de ressources.
* `kill <PID>` : "Tue" (arrête) un processus en utilisant son identifiant unique (PID).
* `killall <nom_du_processus>` : "Tue" tous les processus portant `<nom_du_processus>`.

### 7. Commandes Réseau de Base
* `ip addr` (ou `ip a`) : Affiche les interfaces réseau et les adresses IP configurées.
* `ping <adresse_ip_ou_nom_hote>` : Envoie des requêtes pour tester la connectivité vers un `<hôte>`.
* `curl <URL>` : Récupère des données depuis une `<URL>` (affiche le contenu d'une page web, télécharge un fichier).
    * *Alternative courante pour télécharger :* `wget <URL>`

### 8. Administration et Permissions
* `sudo <commande>` : Exécute la `<commande>` avec les droits de superutilisateur (administrateur).
* `chmod +x <nom_du_script>` : Rend un fichier `<nom_du_script>` exécutable.
* `chown <utilisateur>:<groupe> <fichier>` : Change le propriétaire (`<utilisateur>`) et/ou le `<groupe>` d'un `<fichier>`.

### 9. Interaction WSL/Windows
* `explorer.exe .` (exécutée depuis WSL) : Ouvre l'Explorateur de fichiers Windows dans le répertoire WSL actuel.
* `wslpath "C:\chemin\vers\fichier.txt"` (exécutée depuis WSL) : Convertit un chemin Windows en chemin Linux utilisable dans WSL.
* `<commande_windows>.exe` (ex: `ipconfig.exe`, `notepad.exe mon_fichier.txt`) (depuis WSL) : Exécute un programme ou une commande Windows.
* `wsl --list --verbose` (ou `wsl -l -v`) (exécutée depuis PowerShell ou CMD Windows) : Liste les distributions WSL installées et leur état.
  



- `ls` : liste les fichiers du dossier courant
- `cd <dossier>` : change de dossier
- `pwd` : affiche le chemin du dossier courant
- `whoami` : affiche l'utilisateur connecté
- `mkdir <nom>` : crée un dossier
- `rm <fichier>` : supprime un fichier
- `cp <src> <dest>` : copie un fichier ou dossier
- `mv <src> <dest>` : déplace ou renomme
- `sudo` : exécute avec droits admin
OK
 # 
 lsb_release -a

- `whoami` : affiche l'utilisateur connecté
- `whoami` : affiche l'utilisateur connect
- - `whoami` : affiche l'utilisateur connecté
  - 
- lsb_release -a
cDistributor ID: Ubuntu
Description:    Ubuntu 24.04.2 LTS
Release:        24.04
Codename:       noble

 # 
exit
 # Est à la distribution.
sudo shutdown now

 # Redémarre la distribution.
sudo shutdown -r now

# Mise à jour
sudo apt update
sudo apt upgrade

Absolument ! Voilà une sélection des commandes les plus importantes et basiques pour chaque catégorie, avec une petite description :

---

### 1. Navigation et Exploration du Système de Fichiers
* `ls` : Liste contenu du dossier (fichiers et sous-dossiers).
* `cd <dossier>` : Change de répertoire pour aller dans `<dossier>`.
* `pwd` : Affiche le chemin complet du répertoire actuel.

### 2. Manipulation de Fichiers et Dossiers
* `mkdir <nom_dossier>` : Crée un nouveau dossier nommé `<nom_dossier>`.
* `cp <source> <destination>` : Copie le fichier/dossier `<source>` vers `<destination>`.
* `mv <source> <destination>` : Déplace ou renomme le fichier/dossier `<source>` en `<destination>`.
* `rm <fichier>` : Supprime (efface) `<fichier>`. (Attention, irréversible !)
* `rm -r <dossier>` : Supprime le `<dossier>` et tout son contenu. (Attention, irréversible !)

### 3. Recherche et Filtrage de Texte/Fichier
* `cat <fichier>` : Affiche tout le contenu d'un `<fichier>` (idéal pour les petits fichiers).
* `less <fichier>` : Permet de naviguer (haut/bas) dans le contenu d'un `<fichier>` (idéal pour les gros fichiers).
* `grep "<motif>" <fichier>` : Recherche le `<motif>` (texte) à l'intérieur du `<fichier>`.
* `find . -name "<nom_fichier>"` : Recherche `<nom_fichier>` dans le répertoire actuel (`.`) et ses sous-dossiers.

### 4. Informations Utilisateur et Système
* `whoami` : Affiche ton nom d'utilisateur actuel.
* `uname -a` : Affiche des informations détaillées sur le système et le noyau Linux.
* `df -h` : Affiche l'espace disque utilisé et libre (format lisible par l'humain `-h`).
* `free -h` : Affiche l'utilisation de la mémoire vive (RAM) et du swap (format lisible).

### 5. Gestion des Paquets (pour Debian/Ubuntu comme WSL Ubuntu)
* `sudo apt update` : Rafraîchit la liste des paquets disponibles depuis les serveurs.
* `sudo apt upgrade` : Met à jour tous les paquets logiciels installés vers leurs dernières versions.
* `sudo apt install <nom_du_paquet>` : Installe le logiciel `<nom_du_paquet>`.
* `sudo apt remove <nom_du_paquet>` : Désinstalle le logiciel `<nom_du_paquet>`.

### 6. Gestion des Processus
* `ps aux` : Liste tous les processus en cours d'exécution sur le système.
* `top` (ou `htop` si installé) : Affiche un tableau interactif des processus et de leur consommation de ressources.
* `kill <PID>` : "Tue" (arrête) un processus en utilisant son identifiant unique (PID).
* `killall <nom_du_processus>` : "Tue" tous les processus portant `<nom_du_processus>`.

### 7. Commandes Réseau de Base
* `ip addr` (ou `ip a`) : Affiche les interfaces réseau et les adresses IP configurées.
* `ping <adresse_ip_ou_nom_hote>` : Envoie des requêtes pour tester la connectivité vers un `<hôte>`.
* `curl <URL>` : Récupère des données depuis une `<URL>` (affiche le contenu d'une page web, télécharge un fichier).
    * *Alternative courante pour télécharger :* `wget <URL>`

### 8. Administration et Permissions
* `sudo <commande>` : Exécute la `<commande>` avec les droits de superutilisateur (administrateur).
* `chmod +x <nom_du_script>` : Rend un fichier `<nom_du_script>` exécutable.
* `chown <utilisateur>:<groupe> <fichier>` : Change le propriétaire (`<utilisateur>`) et/ou le `<groupe>` d'un `<fichier>`.

### 9. Interaction WSL/Windows
* `explorer.exe .` (exécutée depuis WSL) : Ouvre l'Explorateur de fichiers Windows dans le répertoire WSL actuel.
* `wslpath "C:\chemin\vers\fichier.txt"` (exécutée depuis WSL) : Convertit un chemin Windows en chemin Linux utilisable dans WSL.
* `<commande_windows>.exe` (ex: `ipconfig.exe`, `notepad.exe mon_fichier.txt`) (depuis WSL) : Exécute un programme ou une commande Windows.
* `wsl --list --verbose` (ou `wsl -l -v`) (exécutée depuis PowerShell ou CMD Windows) : Liste les distributions WSL installées et leur état.

---

Ça devrait te donner une bonne base pour commencer avec chaque catégorie !
D'accord, je vais te créer deux notes pour ça. La première concernera spécifiquement l'utilisation des placeholders `< >`, et la seconde regroupera d'autres petites astuces essentielles pour bien débuter avec la ligne de commande.
Oups, il semble qu'il y ait eu un petit souci avec la création de la deuxième note à cause de certains caractères spéciaux. Ne t'inquiète pas, je corrige ça et je relance la création des deux notes avec le formatage adéquat !
C'est embarrassant, il semble que je rencontre un problème technique avec mon outil de création de notes actuellement, et il m'indique que l'opération `Notes` n'est pas supportée pour le moment. Je ne pourrai donc pas créer ces notes directement dans ton application de notes comme prévu.

En revanche, je peux te donner les informations ici même, pour que tu puisses les copier et les coller où tu le souhaites !

Voici le contenu que j'avais préparé pour tes notes :

---

**Note 1 : Astuce Ligne de Commande : Placeholders < >**

Quand tu vois `<quelque_chose>` (par exemple, `<dossier>` ou `<fichier>`) dans un exemple de commande :

1.  **C'est un placeholder** : il faut le remplacer par ta propre valeur.
2.  **Tu dois remplacer TOUT**, y compris les chevrons `<` et `>`.

*Exemple* :
Si l'exemple est : `cp <source> <destination>`
Et que tu veux copier `rapport.txt` vers `Archives`
Tu tapes : `cp rapport.txt Archives`

---

**Note 2 : Mini-Guide Débutant Ligne de Commande (Linux/WSL)**

Voici quelques infos clés pour bien démarrer :

* **Sensibilité à la casse** : `MonFichier.txt` est DIFFÉRENT de `monfichier.txt`.
* **Espaces dans les noms** : Si un nom de fichier ou dossier contient des espaces, mets-le entre guillemets (`"Mon Dossier"`) ou échappe chaque espace avec un anti-slash (`Mon\ Dossier`).
* **Touche `Tab` (Complétion)** : Ton meilleur ami ! Commence à taper une commande, un nom de fichier ou de dossier, puis appuie sur `Tab`. Souvent, ça complétera le reste pour toi ou te montrera les options possibles.
* **Flèches Haut/Bas** : Navigue dans l'historique des commandes que tu as déjà tapées. Très pratique pour répéter ou modifier une commande précédente.
* **`Ctrl + C`** : Stoppe (annule) la plupart des commandes en cours d'exécution si elle prend trop de temps ou si tu as fait une erreur.
* **`q` pour Quitter** : Dans beaucoup d'outils en plein écran (comme `man` pour les manuels, `less` pour voir des fichiers, ou `top` pour les processus), appuie sur la touche `q` pour quitter et revenir au terminal.
* **Le tilde `~`** : C'est un raccourci pour ton dossier personnel (ton "home directory", ex: `/home/ton_nom_utilisateur`). Taper `cd ~` te ramène toujours à la maison !
* **Obtenir de l'aide** :
    * `nom_commande --help` : Affiche une aide rapide pour `nom_commande`.
    * `man nom_commande` : Ouvre le manuel complet pour `nom_commande` (tape `q` pour quitter le manuel).
* **Point `.` et Double Point `..`** :
    * `.` fait référence au dossier actuel.
    * `..` fait référence au dossier parent (celui juste au-dessus).
* **`sudo` avec Sagesse** : `sudo` (SuperUser Do) te donne des droits d'administrateur. Ne l'utilise que lorsque c'est nécessaire (souvent pour installer des logiciels ou modifier des fichiers système).

---

J'espère que cela t'est utile malgré tout !
