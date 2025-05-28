# Guide Complet du Débutant pour la Ligne de Commande (Linux/WSL)

Bienvenue dans le monde de la ligne de commande. Ce guide est conçu pour vous aider à démarrer.

## ⚠️ Commandes et Situations Exigeant une Attention Particulière ⚠️
Avant de plonger dans les détails, il est crucial de connaître certaines commandes très puissantes qui peuvent causer des dommages irréversibles si elles sont mal utilisées, ainsi que quelques bonnes pratiques.

* **🚨 `rm -rf <chemin>` (LA COMMANDE LA PLUS DANGEREUSE !) 🚨**
    * **Ce qu'elle fait** : `rm` supprime des fichiers. L'option `-r` (récursif) supprime les dossiers et leur contenu. L'option `-f` (force) supprime tout sans demander de confirmation et ignore les erreurs si un fichier n'existe pas.
    * **Le Danger** : Combinées, `rm -rf` peut effacer instantanément et **DÉFINITIVEMENT** des portions entières de votre système de fichiers si le `<chemin>` est incorrect (par exemple, `rm -rf /` effacerait TOUT votre système Linux !). **IL N'Y A PAS DE CORBEILLE SOUS LINUX POUR `rm` !**
    * **Précautions ABSOLUES** :
        1.  Vérifiez TROIS FOIS le `<chemin>` avant d'appuyer sur `Entrée`.
        2.  Assurez-vous de savoir exactement ce que vous supprimez.
        3.  Si possible, utilisez `rm -rI <chemin>` (I majuscule) qui demandera une confirmation globale avant de tout supprimer, ou `rm -ri <chemin>` (i minuscule) qui demandera confirmation pour chaque fichier (peut être long mais plus sûr pour les débuts).
        4.  Évitez `sudo rm -rf <chemin>` autant que possible. Si vous devez absolument l'utiliser, soyez encore plus vigilant.
* **Mises à Jour des Paquets (Logiciels)** :
    * **Quand ?** Idéalement, faites-le régulièrement (une fois par semaine, ou avant d'installer de nouveaux logiciels importants).
    * **Comment ?**
        1.  Mettre à jour la liste des paquets :
            ```bash
            sudo apt update
            ```
            Met à jour la liste des paquets disponibles depuis les dépôts (serveurs). C'est comme vérifier le catalogue avant de faire les courses.
        2.  Mettre à jour les paquets installés :
            ```bash
            sudo apt upgrade
            ```
            Met à jour tous les paquets actuellement installés vers leurs dernières versions disponibles.
        * Vous pouvez combiner les deux :
            ```bash
            sudo apt update && sudo apt upgrade -y
            ```
            (le `-y` répond "oui" automatiquement aux confirmations, à utiliser si vous êtes sûr).
    * **Pourquoi ?** Pour bénéficier des dernières fonctionnalités, des corrections de bugs et surtout des **mises à jour de sécurité**.
* **Recharger la Configuration du Shell** :
    * **Quand ?** Si vous modifiez des fichiers de configuration de votre shell (comme `~/.bashrc` ou `~/.zshrc` si vous utilisez Zsh) pour ajouter des alias, modifier votre `PATH` (la liste des dossiers où le shell cherche les commandes), ou personnaliser votre invite de commande.
    * **Comment ?**
        1.  Fermez et rouvrez votre terminal. C'est la méthode la plus simple et la plus sûre.
        2.  Ou, pour le shell Bash :
            ```bash
            source ~/.bashrc
            ```
        3.  Ou, pour le shell Zsh :
            ```bash
            source ~/.zshrc
            ```
        * La commande `source` (ou son alias `.`, un simple point) lit et exécute les commandes du fichier spécifié dans la session actuelle du shell.
    * **Pourquoi ?** Les modifications ne sont pas prises en compte automatiquement. Il faut dire au shell de relire sa configuration.
* **Installer de Nouveaux Logiciels** :
    * **Bonne Pratique** : Faites toujours un `sudo apt update` avant un `sudo apt install <nom_du_paquet>` pour vous assurer que vous installez la version la plus récente disponible dans les dépôts et que vos listes de paquets sont à jour.

## 📖 Mini-Lexique du Débutant en Ligne de Commande
Pour bien comprendre les tutoriels et la documentation, voici quelques termes fondamentaux :

* **Shell (et Bash)** :
    * *Définition* : Le Shell est le programme avec lequel vous utilisez votre système Linux en tapant des commandes.
    * *Les plus courants* : `bash`, `sh`, `zsh` ou encore `ksh`. Par défaut avec WSL2, ce sera Bash.
    * *Pour savoir quel shell vous utilisez* :
        ```bash
        echo $SHELL
        ```
        ou
        ```bash
        ps -p $$
        ```
* **Noyau (Kernel)** :
    * *Définition* : C'est le cœur du système d'exploitation (Linux dans notre cas). Il gère les ressources matérielles de l'ordinateur (processeur, mémoire, disques) et permet aux logiciels de fonctionner. Le shell communique avec le noyau.
* **Distribution Linux (Distro)** :
    * *Définition* : Un système d'exploitation complet construit autour du noyau Linux. Il inclut le noyau, des outils système (souvent du projet GNU), un gestionnaire de paquets, et souvent un environnement de bureau graphique (bien que dans WSL, on se concentre sur la ligne de commande).
    * *Debian* : Une distribution Linux très respectée, connue pour sa stabilité et son engagement envers les logiciels libres. Elle sert de base à de nombreuses autres distributions.
    * *Ubuntu* : Une distribution populaire et conviviale basée sur Debian. C'est celle qui est généralement installée par défaut avec WSL.
* **GNU (GNU's Not Unix!)** :
    * *Définition* : Un vaste projet collaboratif de logiciels libres initié par Richard Stallman. L'objectif était de créer un système d'exploitation de type Unix entièrement libre.
    * *Importance* : De nombreux outils essentiels que vous utilisez en ligne de commande (comme `bash` lui-même, `ls`, `cp`, `mv`, `gcc` le compilateur C, etc.) sont des logiciels GNU. C'est pourquoi on parle souvent de système "GNU/Linux".
* **Paquet (Package)** :
    * *Définition* : Une archive (un fichier compressé) contenant un logiciel (ou une bibliothèque) prêt à être installé, ainsi que des métadonnées (nom, version, dépendances, scripts d'installation).
    * *Gestionnaire de paquets (`apt`)* : Sur Debian/Ubuntu, `apt` (Advanced Package Tool) est l'outil principal pour installer, mettre à jour et supprimer des paquets.
* **Dépôt (Repository)** :
    * *Définition* : Un serveur distant qui héberge une collection de paquets logiciels. Quand vous faites `sudo apt update`, votre système contacte les dépôts configurés pour obtenir la liste des paquets disponibles et leurs versions.
* **`tar` (Tape ARchiver)** :
    * *Définition* : Un utilitaire standard pour créer et manipuler des fichiers d'archive (souvent appelés "tarballs"). `tar` regroupe plusieurs fichiers et dossiers en un seul fichier.
    * *Compression* : `tar` seul n'effectue pas de compression. Il est très souvent utilisé en combinaison avec des outils de compression comme :
        * `gzip` (donnant des fichiers `.tar.gz` ou `.tgz`)
        * `bzip2` (donnant des fichiers `.tar.bz2`)
        * `xz` (donnant des fichiers `.tar.xz`)
    * *Exemples courants* :
        * Créer une archive compressée :
            ```bash
            tar -czvf <mon_archive.tar.gz> <mon_dossier_ou_fichier_a_archiver>/
            ```
        * Extraire une archive compressée :
            ```bash
            tar -xzvf <mon_archive.tar.gz>
            ```
        * (c : créer, x : extraire, z : gzip, v : verbeux (affiche les fichiers), f : spécifie le nom du fichier d'archive)
* **Permissions (Droits d'accès)** :
    * *Définition* : Contrôlent qui peut lire (`r`), écrire (`w`), et exécuter (`x`) un fichier ou un dossier. Chaque fichier a des permissions pour son propriétaire, pour un groupe d'utilisateurs, et pour tous les autres.
    * *Visualisation* : La commande `ls -l` affiche les permissions (ex: `drwxr-xr-x`).
* **Root (Superutilisateur)** :
    * *Définition* : L'utilisateur administrateur du système, qui a tous les droits et peut tout faire. Son nom d'utilisateur est "root".
    * *`sudo`* : La commande `sudo` (SuperUser DO) vous permet d'exécuter une commande spécifique en tant que root (ou un autre utilisateur), après avoir entré votre propre mot de passe.
* **PATH (Variable d'environnement)** :
    * *Définition* : Une variable spéciale du shell qui contient une liste de répertoires. Quand vous tapez une commande (comme `ls`), le shell cherche l'exécutable de cette commande dans les répertoires listés dans le `PATH`.
    * *Importance* : Si un programme n'est pas dans un répertoire du `PATH`, vous devez taper son chemin complet pour l'exécuter (ex: `/opt/mon_programme/run.sh` ou `./mon_script_local` si vous êtes dans le même dossier).

## 1. Comprendre les Commandes, les Tutoriels et la Documentation
Lorsqu'on débute, lire des exemples de commandes ou la documentation peut être un peu déroutant. Voici quelques clés :

* **⭐ Placeholders `< >` (TRÈS IMPORTANT !) ⭐** : Quand vous voyez `<quelque_chose>` (par exemple, `<dossier>` ou `<fichier>`) dans un exemple :
    1.  C'est un **substitut** : il faut le remplacer par votre propre valeur (le nom réel de votre dossier, de votre fichier, etc.).
    2.  Vous devez **remplacer TOUT**, y compris les chevrons `<` et `>`.
    * *Exemple Concret* :
        Si un tutoriel indique : `mkdir <nom_du_nouveau_dossier>`
        Et que vous voulez créer un dossier nommé `MesProjets`
        Vous tapez dans le terminal :
        ```bash
        mkdir MesProjets
        ```
        (Et **NON PAS** `mkdir <MesProjets>`)
* **La Commande de Base** : C'est le premier mot que vous tapez, l'action que vous voulez effectuer (ex: `ls`, `cd`, `mkdir`). C'est le "verbe" de votre phrase.
* **Les Options (ou "Flags")** : Ce sont des modificateurs qui changent le comportement d'une commande. Elles commencent souvent par un tiret `-` (pour les options courtes, ex: `ls -l`) ou deux tirets `--` (pour les options longues, ex: `ls --all`). Plusieurs options courtes peuvent souvent être groupées (ex: `ls -la` équivaut à `ls -l -a`). Pensez à elles comme des "adverbes" qui précisent l'action.
* **Les Arguments** : Ce sont les "cibles" ou les informations supplémentaires dont la commande a besoin pour fonctionner. Dans `cp <rapport.txt> <Archives>`, `<rapport.txt>` et `<Archives>` sont des arguments. Ce sont les "compléments d'objet" de votre phrase.
* **Crochets `[ ]` dans la Documentation** : Quand vous lisez une page de manuel (`man`) ou une aide (`--help`), ce qui est entre crochets `[ ]` est généralement **optionnel**. Vous n'êtes pas obligé de le fournir pour que la commande fonctionne, mais ça vous donne des possibilités supplémentaires.
* **Sensibilité à la casse (Rappel Important)** : Linux fait la différence entre majuscules et minuscules. `MonDossier` et `mondossier` sont deux choses distinctes. Soyez toujours vigilant !

## 2. Les Bases Essentielles pour Écrire et Interagir avec le Terminal
* **Sensibilité à la casse (Case Sensitivity)** : (Répétition, car crucial !) `MonFichier.txt` est un fichier **différent** de `monfichier.txt` ou `Monfichier.TXT`. Soyez toujours attentif à la casse.
* **Espaces dans les noms** : Si un nom de fichier ou de dossier contient des espaces, vous avez deux options (choisissez celle que vous préférez) :
    1.  Mettez le nom complet entre guillemets doubles : `cd "Mon Dossier Avec Espaces"`
    2.  Échappez chaque espace avec un anti-slash (`\`) : `cd Mon\ Dossier\ Avec\ Espaces`
* **Touche `Tab` (Auto-complétion)** : 🚀 Votre meilleur ami pour gagner du temps et éviter les fautes de frappe ! Commencez à taper une commande, un nom de fichier ou de dossier, puis appuyez sur la touche `Tab`.
    * Si le début est unique, le terminal complétera le reste pour vous.
    * Si plusieurs options commencent pareil, appuyez deux fois sur `Tab` pour afficher toutes les possibilités.
* **Flèches `Haut` et `Bas`** : Naviguez dans l'historique des commandes que vous avez déjà tapées. Très pratique pour répéter ou modifier rapidement une commande précédente.
* **`Ctrl + C`** : 🛑 Interrompt (annule) la plupart des commandes en cours d'exécution. Utile si une commande prend trop de temps, si vous avez fait une erreur, ou si un programme ne répond plus.
* **`q` pour Quitter** : Dans beaucoup d'outils en plein écran (comme `man` pour les manuels, `less` pour visualiser des fichiers, ou `top` pour les processus), appuyez sur la touche `q` pour quitter et revenir à l'invite de commande.
* **Raccourcis Utiles pour Éditer la Ligne de Commande** (pour aller plus vite) :
    * `Ctrl + L` : Efface l'écran du terminal (équivalent à la commande `clear`).
    * `Ctrl + A` : Déplace le curseur au **début** de la ligne.
    * `Ctrl + E` : Déplace le curseur à la **fin** de la ligne.
    * `Ctrl + U` : Efface tout ce qui se trouve **avant** le curseur sur la ligne.
    * `Ctrl + K` : Efface tout ce qui se trouve **après** le curseur sur la ligne.
    * `Ctrl + W` : Efface le **mot** qui se trouve avant le curseur.
    * `Ctrl + R` : Recherche en arrière dans l'historique des commandes. Tapez une partie de la commande que vous cherchez. Appuyez à nouveau sur `Ctrl + R` pour voir les correspondances précédentes. Appuyez sur `Entrée` pour exécuter la commande trouvée, ou sur les flèches pour l'éditer.
* **Copier / Coller** :
    * La méthode la plus courante dans les terminaux modernes (y compris Windows Terminal pour WSL) est :
        * `Ctrl + Shift + C` pour copier le texte sélectionné.
        * `Ctrl + Shift + V` pour coller.
    * Souvent, un clic droit dans la fenêtre du terminal propose aussi des options de copier/coller.
    * Sélectionner du texte avec la souris le copie parfois automatiquement dans le presse-papiers sur certains systèmes.

## 3. Naviguer dans le Système de Fichiers (L'Arborescence)
Imaginez le système de fichiers comme une grande armoire (la racine `/`) contenant des tiroirs (des dossiers), qui peuvent eux-mêmes contenir d'autres tiroirs ou des objets (des fichiers). Se déplacer efficacement est fondamental.

* **La Racine `/`** : Le point de départ de toute l'arborescence des fichiers. Tous les fichiers et dossiers de votre système Linux se trouvent quelque part sous cette racine.
    * Pour aller à la racine : `cd /`
* **Le Dossier Personnel `~` (Tilde)** : Un raccourci très pratique qui représente votre dossier personnel (ex: `/home/<votre_nom_utilisateur>/` sous Linux, ou le dossier de votre utilisateur WSL). C'est là où vous "atterrissez" généralement quand vous ouvrez un nouveau terminal.
    * Pour retourner à votre dossier personnel de n'importe où : `cd ~` ou simplement `cd` (sans rien après).
* **Chemins Absolus vs. Relatifs** :
    * **Chemin Absolu** : Commence toujours par la racine `/` et décrit le chemin complet vers un fichier ou un dossier, peu importe où vous vous trouvez actuellement. Ex: `/home/<votre_nom_utilisateur>/Documents/<rapport.txt>` (comme une adresse postale complète).
    * **Chemin Relatif** : Décrit le chemin vers un fichier ou un dossier **à partir de votre position actuelle**. Ex: Si vous êtes dans `/home/<votre_nom_utilisateur>/` et que vous voulez aller dans `Documents`, vous tapez `cd Documents` (comme dire "la pièce d'à côté").
* **⭐ Point `.` et Double Point `..` (Navigation Relative Essentielle) ⭐** : Ce sont des concepts clés pour se déplacer !
    * `.` (un seul point) : Représente le **dossier actuel**.
        * *Usage principal* : Exécuter un script ou un programme qui se trouve dans le dossier où vous êtes : `./mon_script.sh` (le `./` signifie "cherche dans le dossier actuel").
    * `..` (deux points) : Représente le **dossier parent** (celui juste au-dessus dans l'arborescence).
        * *Exemple* : Si vous êtes dans `/home/<votre_nom_utilisateur>/Documents` et que vous tapez `cd ..`, vous vous retrouverez dans `/home/<votre_nom_utilisateur>`.
        * Vous pouvez les enchaîner : `cd ../..` vous fait remonter de deux niveaux (comme monter deux étages).
* **`cd -` (Tiret)** : Une commande très pratique pour revenir au **dossier précédent** dans lequel vous vous trouviez. Si vous passez de `/dossierA` à `/dossierB`, taper `cd -` vous ramènera à `/dossierA` (et vice-versa).
* **Changer de "Disque" (Accéder aux lecteurs Windows depuis WSL)** :
    Vos lecteurs Windows (C:, D:, etc.) sont "montés" (rendus accessibles) dans WSL sous le répertoire `/mnt/`.
    * Pour accéder à votre disque C: : `cd /mnt/c`
    * Pour accéder à votre disque D: : `cd /mnt/d`
    * Et ainsi de suite. Une fois dans `/mnt/c`, vous pouvez naviguer comme d'habitude (ex: `cd /mnt/c/Users/<VotreNomWindows>/Documents`).

## 4. Opérations de Base sur les Fichiers et Dossiers (Rappel)
* `ls` : Liste le contenu du dossier courant.
    * `ls -l` : Affichage long (avec détails : permissions, taille, date).
    * `ls -a` : Affiche aussi les fichiers et dossiers cachés (ceux qui commencent par un `.`).
    * `ls -lh` : Affichage long avec tailles lisibles par l'humain (Ko, Mo, Go).
* `pwd` : Affiche le chemin complet du dossier où vous vous trouvez actuellement (Print Working Directory).
* `mkdir <nom_dossier>` : Crée un nouveau dossier.
    * `mkdir -p <DossierParent>/<NouveauDossier>` : Crée `<NouveauDossier>` et `<DossierParent>` s'il n'existe pas.
* `touch <nom_fichier>` : Crée un fichier vide (ou met à jour la date de modification s'il existe déjà).
* `cp <source> <destination>` : Copie un fichier ou un dossier.
    * `cp -r <dossier_source> <dossier_destination>` : Pour copier un dossier et son contenu (récursif).
* `mv <source> <destination>` : Déplace ou renomme un fichier ou un dossier.
* `rm <fichier>` : Supprime un fichier.
* `rm -r <dossier>` : Supprime un dossier et tout son contenu (soyez prudent ! Voir `rm -rf <chemin>` plus haut).

## 5. Obtenir de l'Aide
Personne ne connaît toutes les commandes et toutes leurs options par cœur ! Apprendre à chercher de l'aide est une compétence en soi.

* `<nom_commande> --help` : Affiche une aide rapide et concise pour `<nom_commande>`, directement dans le terminal. C'est souvent le premier réflexe.
* `man <nom_commande>` (manuel) : Ouvre le manuel complet et détaillé pour `<nom_commande>`. C'est la référence la plus complète.
    * Utilisez les flèches pour naviguer, `Page Suivante`/`Page Précédente` (ou `Espace`/`b`), `/` suivi d'un mot pour chercher dans le manuel, `n` pour la prochaine occurrence de votre recherche, et `q` pour quitter.

## 6. Le Pouvoir de `sudo` (et la Sagesse qui va avec)
* `sudo <commande>` (`SuperUser Do`) : Exécute la `<commande>` avec les droits d'administrateur (superutilisateur ou "root"). Vous devrez entrer votre mot de passe utilisateur (celui de votre session Linux/WSL).
* **Quand l'utiliser ?** Principalement pour :
    1.  Installer ou supprimer des logiciels (`sudo apt install <nom_du_paquet>`).
    2.  Modifier des fichiers système importants (en dehors de votre dossier personnel).
    3.  Démarrer ou arrêter des services système.
    4.  Effectuer des opérations qui nécessitent des privilèges élevés.
* **Avec Prudence !** Une commande exécutée avec `sudo` peut potentiellement endommager votre système si vous ne savez pas ce que vous faites. Vérifiez toujours deux fois avant de lancer une commande avec `sudo`. En cas de doute, ne le faites pas ou demandez conseil. "Un grand pouvoir implique de grandes responsabilités !"

## 7. Quelques Utilitaires Pratiques pour Débuter
* `cat <fichier>` : Affiche tout le contenu d'un fichier (idéal pour les petits fichiers).
* `less <fichier>` : Affiche le contenu d'un fichier page par page (idéal pour les gros fichiers, utilisez `q` pour quitter, flèches pour naviguer).
* `head <fichier>` : Affiche les 10 premières lignes d'un fichier.
    * `head -n 5 <fichier>` : Affiche les 5 premières lignes.
* `tail <fichier>` : Affiche les 10 dernières lignes d'un fichier.
    * `tail -n 5 <fichier>` : Affiche les 5 dernières lignes.
    * `tail -f <fichier_log>` : Très utile pour suivre un fichier de log en temps réel (les nouvelles lignes s'affichent au fur et à mesure). `Ctrl + C` pour arrêter.
* `clear` : Efface l'écran du terminal (pour y voir plus clair).

C'est un bon point de départ ! N'hésitez pas à expérimenter (dans des dossiers de test au début pour ne rien casser d'important). La pratique est la clé.
