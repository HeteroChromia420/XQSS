#!/bin/bash

clearScreen(){
    clear
}

updateSystem(){
    sudo apt update | tee -a xqss-setup.log
    #Perhaps you meant to do this?
    sudo apt upgrade -y | tee -a xqss-setup.log
    clearScreen
}

installPackages(){
    sudo apt install qt5ct xfce4-terminal lightdm lightdm-gtk-greeter-settings eject bash-completion gvfs* qt5-gtk2-platformtheme network-manager network-manager-gnome xfce4-screenshooter xinit pulseaudio alsa-utils file-roller xserver-xorg xdg-user-dirs wpasupplicant fonts-noto* arc-theme papirus-icon-theme breeze-cursor-theme flatpak desktop-base xfce4 mousepad ristretto pavucontrol xfce4-panel xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-taskmanager xfce4-notifyd xfwm4 galculator package-update-indicator falkon --no-install-recommends --no-install-suggests -y | tee -a xqss-setup.log
    sudo apt install --install-recommends plasma-discover plasma-discover-backend-flatpak -y | tee -a xqss-setup.log
    xdg-user-dirs-update | tee -a xqss-setup.log
    #And purge unwanted packages
    sudo apt purge --auto-remove unattended-upgrades snapd plasma-discover-backend-snap -y | tee -a xqss-setup.log
    clearScreen
}

setupFlatpak(){
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo | tee -a xqss-setup.log
    clearScreen
}

setupMisc(){
    mkdir ~/.config
    cp -r config/* ~/.config
}

updateSystem && installPackages && setupFlatpak && setupMisc && echo "All components are installed successfully! Feel free to check xqss-setup.log." || echo "One or more components failed to install. Please check xqss-setup.log."
echo "Process has completed."
read -n 1 -s -r -p "Press any key to continue..."
