#!/usr/bin/env bash

# Ask user to run installer

while true; do
	read -p 'Do you want to install Legacy Launcher? [y/n]: ' yn
	case $yn in
		[Yy]* ) break;;
		[Nn]* ) exit;;
		* ) echo 'Please answer y or n.';;
	esac
done

# Create folders
echo 'Creating folders'
mkdir ~/.minecraft
mkdir -p ~/.local/share/applications
mkdir -p ~/.local/share/icons/hicolor/64x64/apps/

# Download the Legacy Launcher jar file and icon
echo 'Downloading files'
wget https://llaun.ch/repo/downloads/LegacyLauncher_legacy.jar -O ~/.minecraft/LegacyLauncher.jar
wget https://dl.flathub.org/repo/appstream/x86_64/icons/128x128/ch.tlaun.TL.png -O ~/.local/share/icons/hicolor/64x64/apps/legacy-launcher.png

# Create a desktop file for the launcher
echo 'Creating desktop entry'
echo "[Desktop Entry]" > ~/.local/share/applications/LegacyLauncher.desktop
echo "Categories=Game;" >> ~/.local/share/applications/LegacyLauncher.desktop
echo "Type=Application" >> ~/.local/share/applications/LegacyLauncher.desktop
echo "Exec=java -jar ~/.minecraft/LegacyLauncher.jar" >> ~/.local/share/applications/LegacyLauncher.desktop
echo "Name=Legacy Launcher" >> ~/.local/share/applications/LegacyLauncher.desktop
echo "Comment=Cracked Minecraft launcher" >> ~/.local/share/applications/LegacyLauncher.desktop
echo "Comment[ru_RU]=Пиратский Майнкрафт лаунчер" >> ~/.local/share/applications/LegacyLauncher.desktop
echo "Icon=legacy-launcher" >> ~/.local/share/applications/LegacyLauncher.desktop

# Make the desktop file executable
echo 'Making file executable'
chmod +x ~/.local/share/applications/LegacyLauncher.desktop
echo 'Done!'
exit 0
