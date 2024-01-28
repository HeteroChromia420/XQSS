#!/bin/bash

updateSystem(){
    sudo apt update | tee -a xqss-setup.log
    #Perhaps you meant to do this?
    sudo apt upgrade -y | tee -a xqss-setup.log
    clear
}

installPackages(){
    sudo apt install qt5ct xfce4-terminal lightdm lightdm-gtk-greeter-settings eject bash-completion gvfs* qt5-gtk2-platformtheme network-manager network-manager-gnome xfce4-screenshooter xinit pulseaudio alsa-utils engrampa xserver-xorg xdg-user-dirs wpasupplicant fonts-noto* arc-theme papirus-icon-theme breeze-cursor-theme flatpak desktop-base xfce4 mousepad ristretto pavucontrol xfce4-panel xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-taskmanager xfce4-notifyd xfwm4 galculator package-update-indicator falkon tumbler --no-install-recommends --no-install-suggests -y | tee -a xqss-setup.log
    sudo apt install --install-recommends plasma-discover plasma-discover-backend-flatpak -y | tee -a xqss-setup.log
    xdg-user-dirs-update | tee -a xqss-setup.log
    #And purge unwanted packages
    sudo apt purge --auto-remove unattended-upgrades snapd plasma-discover-backend-snap -y | tee -a xqss-setup.log
    clear
}

setupFlatpak(){
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo | tee -a xqss-setup.log
    clear
}

setupMisc(){
    mkdir ~/.config
    cp -r config/* ~/.config
    sudo cp -r shared /home/ | tee -a obqss-setup.log
    sudo chmod a+rwx -R /home/shared
}

updateSystem && installPackages && setupFlatpak && setupMisc 
echo "Process has completed."
read -n 1 -s -r -p "Press any key to continue..."
