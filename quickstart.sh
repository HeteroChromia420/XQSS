#! /bin/bash

clear
sudo apt update
sudo apt install curl aria2 wget ca-certificates gpg --no-install-recommends --no-install-suggests -y
sudo apt-fast install qt5ct xfce4-terminal lightdm lightdm-gtk-greeter-settings parole quodlibet libreoffice mpd mpv youtube-dl synaptic eject bash-completion gvfs* qt5-gtk2-platformtheme network-manager network-manager-gnome xfce4-screenshooter xinit pulseaudio alsa-utils engrampa xserver-xorg xdg-user-dirs wpasupplicant gimp fonts-noto* arc-theme papirus-icon-theme breeze-cursor-theme flatpak desktop-base caffeine xscreensaver xfce4 mousepad ristretto policykit-1 policykit-1-gnome pavucontrol xfce4-panel xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-taskmanager xfce4-notifyd xfwm4 galculator package-update-indicator epiphany-browser preload --no-install-recommends --no-install-suggests -y
sudo apt install --install-recommends gnome-software gnome-software-plugin-flatpak -y
sudo apt purge --auto-remove unattended-upgrades snapd gnome-software-plugin-snap -y
xdg-user-dirs-update
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo