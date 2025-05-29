# Procédure pour déplacer et configurer Ubuntu-24.04 sous WSL

1.  **Définir WSL 2 comme version par défaut**
    > Définit WSL 2 comme version par défaut pour toutes les futures distributions.

    ```powershell
    wsl --set-default-version 2
    ```

2.  **Mettre à jour WSL (pré-release)**
    > Met à jour WSL vers la dernière version, y compris les versions pré-release.

    ```powershell
    wsl --update --pre-release
    ```

3.  **Installer Ubuntu-24.04**
    > Installe la distribution Ubuntu-24.04 via WSL.

    ```powershell
    wsl --install -d Ubuntu-24.04
    ```

4.  **Exporter la distribution actuelle**
    > Sauvegarde Ubuntu-24.04 dans un fichier `.tar` pour la déplacer ou la restaurer.

    ```powershell
    wsl --export Ubuntu-24.04 C:\WSL\ubuntu24-backup.tar
    ```

5.  **Supprimer la distribution de WSL**
    > Supprime Ubuntu-24.04 de WSL pour pouvoir la réimporter ailleurs.

    ```powershell
    wsl --unregister Ubuntu-24.04
    ```

6.  **Réimporter Ubuntu-24.04 dans un dossier dédié**
    > Installe Ubuntu-24.04 dans `C:\WSL\Ubuntu-24.04` à partir du backup.

    ```powershell
    wsl --import Ubuntu-24.04 C:\WSL\Ubuntu-24.04 C:\WSL\ubuntu24-backup.tar --version 2
    ```

7.  **Définir Ubuntu-24.04 comme distribution par défaut**
    > Fait d’Ubuntu-24.04 la distribution qui démarre par défaut avec `wsl`.

    ```powershell
    wsl --set-default Ubuntu-24.04
    ```

8.  **Ouvrir une session dans Ubuntu-24.04**
    > Accède à Ubuntu-24.04 via WSL (ouvre un shell).

    ```powershell
    wsl -d Ubuntu-24.04
    ```

9.  **Mettre à jour les paquets dans Ubuntu**
    > Met à jour la liste des paquets et installe les dernières mises à jour.

    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

10. **Installer les outils de base**
    > Installe des outils essentiels (git, curl, build-essential, unzip, wget).

    ```bash
    sudo apt install git curl build-essential unzip wget -y
    ```
