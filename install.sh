#!/bin/bash

echo "🚀 Installation des dépendances pour Cyber-Tool..."

# 📌 Mise à jour et installation des packages nécessaires
echo "🔧 Installation des outils système..."
pkg update -y && pkg upgrade -y
pkg install -y python python-pip openssl clang cmake make libffi openssl-tool git libjpeg-turbo python-cryptography

# 📌 Donner les permissions d'exécution uniquement aux fichiers nécessaires
chmod +x install.sh cyber-tool

# 📌 Installation des modules Python avec versions spécifiques
echo "📦 Installation des modules Python..."
pip install --no-cache-dir -r requirements.txt

# 📌 Installation propre de `smbprotocol`
echo "🔧 Installation de smbprotocol..."
pip install --no-cache-dir smbprotocol

# 📦 Installation de Pillow avec support JPEG
echo "📦 Installation de Pillow avec support JPEG..."
CFLAGS="-I/data/data/com.termux/files/usr/include/" LDFLAGS="-L/data/data/com.termux/files/usr/lib/" pip install --no-cache-dir pillow==10.3.0

# 📌 Vérification des modules installés
echo "🔍 Vérification des installations..."
pip list | grep -E "smbprotocol|pillow"

echo "✅ Installation terminée ! 💀 Cyber-Tool est prêt à l'emploi."

# 🔥 Lancement immédiat de Cyber-Tool sans pause
exec ./cyber-tool
