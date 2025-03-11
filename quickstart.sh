#!/bin/bash

log_file="xqss-setup.log"
timestamp() {
    date +"%Y-%m-%d_%H-%M-%S" # output format: YYYY-MM-DD_HH-MM-SS
}

updateSystem(){
    echo "[$(timestamp)] Updating the system..." | tee -a "$log_file"
    sudo apt update 2>&1 | tee -a "$log_file"
    sudo apt dist-upgrade --auto-remove --no-install-recommends 2>&1 | tee -a "$log_file"
    echo "System update complete." | tee -a "$log_file"
}

installPackages(){
    echo "[$(timestamp)] Installing packages..." | tee -a "$log_file"
    sudo apt install --no-install-recommends --no-install-suggests policykit-1 libnotify-bin xdg-desktop-portal xdg-desktop-portal-gtk xfce4-power-manager-plugins qt5ct xfce4-terminal lightdm lightdm-gtk-greeter-settings eject bash-completion gvfs* qt5-gtk2-platformtheme network-manager network-manager-gnome xfce4-screenshooter xinit pulseaudio alsa-utils engrampa xserver-xorg xdg-user-dirs wpasupplicant fonts-noto* arc-theme papirus-icon-theme breeze-cursor-theme flatpak desktop-base xfce4 mousepad ristretto pavucontrol xfce4-panel xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-taskmanager xfce4-notifyd xfwm4 galculator package-update-indicator falkon tumbler
    #Installing Plasma-Discover instead of GNOME Software because GNOME Software sucks.
    sudo apt install --install-recommends plasma-discover plasma-discover-backend-flatpak
    xdg-user-dirs-update
    echo "Package installation complete." | tee -a "$log_file"
    echo "[$(timestamp)] Purging unwanted packages…" | tee -a "$log_file"
    sudo apt purge --auto-remove unattended-upgrades snapd plasma-discover-backend-snap
}

setupFlatpak(){
    echo "[$(timestamp)] Setting up Flatpak..." | tee -a "$log_file"
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    echo "Flatpak setup complete." | tee -a "$log_file"
}

setupMisc(){
    echo "[$(timestamp)] Setting up miscellaneous configurations..." | tee -a "$log_file"
    mkdir -p ~/.config
    cp -r config/* ~/.config
    #Shared folder includes a script that should be executable to all users, it allows to update both DPKG and Flatpak packages in one go due to a silly limitation on package-update-indicator that only allows it to run one command at once to "apply updates".
    sudo cp -r shared /home/
    sudo chmod a+rx -R /home/shared
    echo "Miscellaneous configuration complete." | tee -a "$log_file"
}

# Starting the script sequence
{
    updateSystem && installPackages && setupFlatpak && setupMisc
    echo "[$(timestamp)] Process has completed." | tee -a "$log_file"
} || {
    echo "[$(timestamp)] An error occurred. Please check the log at $log_file for details." >&2
    exit 1
}

read -n 1 -s -r -p "Press any key to continue..."
