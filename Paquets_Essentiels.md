## Paquets Essentiels de Base pour WSL2 (Ubuntu 24.04)

Voici une sélection de paquets `apt` utiles pour bien démarrer avec ton environnement WSL2 sous Ubuntu. Pour les installer, utilise la commande `sudo apt install <nom_du_paquet>`. N'oublie pas de faire un `sudo apt update` avant pour rafraîchir la liste des paquets.

### 1. Essentiels Système et Utilitaires Courants
Ces paquets sont fondamentaux pour la compilation, la gestion de fichiers et quelques outils de diagnostic.

* **`build-essential`**
    * *Description* : Méta-paquet crucial qui installe les outils de base pour compiler du code source (comme `gcc`, `g++`, `make`). Indispensable si tu prévois de compiler des logiciels depuis leurs sources.
* **`curl`**
    * *Description* : Outil en ligne de commande pour transférer des données avec des URLs. Très utilisé pour télécharger des fichiers, des scripts, ou interagir avec des APIs.
* **`wget`**
    * *Description* : Similaire à `curl`, `wget` est un utilitaire non interactif pour télécharger des fichiers depuis le web.
* **`git`**
    * *Description* : Le système de contrôle de version distribué le plus populaire. Essentiel pour la gestion de code source et la collaboration. (Tu l'as déjà, mais c'est un *must-have*).
* **`unzip`**
    * *Description* : Permet de décompresser les fichiers archivés au format `.zip`.
* **`zip`**
    * *Description* : Permet de créer des archives au format `.zip`.
* **`htop`**
    * *Description* : Un visualiseur de processus interactif et en temps réel. Plus convivial et informatif que la commande `top` de base.
* **`ca-certificates`**
    * *Description* : Contient les certificats d'autorité racine nécessaires pour valider les connexions SSL/TLS (HTTPS). Généralement installé, mais s'assurer qu'il est à jour est une bonne pratique.
* **`gnupg`** (ou `gnupg2`)
    * *Description* : GNU Privacy Guard, utilisé pour le chiffrement et la signature de données/communications. Souvent requis pour vérifier l'authenticité des paquets logiciels.

### 2. Outils de Développement (Python)
Puisque tu utilises Python, voici les bases :

* **`python3-pip`**
    * *Description* : Le gestionnaire de paquets pour Python. Permet d'installer et de gérer les bibliothèques Python qui ne sont pas dans les dépôts `apt`.
* **`python3-venv`**
    * *Description* : Module pour créer des environnements virtuels Python isolés. Fortement recommandé pour gérer les dépendances de tes projets Python.

### 3. Éditeurs de Texte en Terminal
Utiles pour des modifications rapides de fichiers directement dans le terminal.

* **`nano`**
    * *Description* : Éditeur de texte simple et intuitif, idéal pour les débutants ou pour des modifications rapides. Les raccourcis clavier sont affichés en bas de l'écran.
* **`vim`** (ou `neovim` pour une version plus moderne)
    * *Description* : Éditeur de texte très puissant et configurable, mais avec une courbe d'apprentissage plus marquée. Extrêmement efficace une fois maîtrisé.

### 4. Utilitaires Réseau (Vérification)
Ces outils sont généralement présents, mais une vérification ne coûte rien.

* **`net-tools`** (Optionnel)
    * *Description* : Fournit des outils réseau classiques comme `ifconfig`, `netstat`, `route`. Bien que `iproute2` (qui fournit la commande `ip`) soit plus moderne et généralement préféré, certains scripts ou habitudes peuvent encore reposer sur `net-tools`.
* **`dnsutils`**
    * *Description* : Contient des utilitaires pour interroger les serveurs DNS, comme `dig` et `nslookup`. Utile pour diagnostiquer les problèmes de résolution de noms.

### Conseil :
Après avoir installé ces paquets, tu peux faire un petit nettoyage avec `sudo apt autoremove` pour supprimer les dépendances qui ne seraient plus nécessaires et `sudo apt clean` pour vider le cache des paquets téléchargés.
