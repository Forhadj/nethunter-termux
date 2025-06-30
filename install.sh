#!/bin/bash

# NetHunter CLI Installer by Forhad
INSTALLED_ROOTFS_DIR="/data/data/com.termux/files/var/lib/proot-distro/installed-rootfs"

print_banner() {
    clear
    echo "##################################################
##                                              ##
##  88      a8P         db        88        88  ##
##  88    .88'         d88b       88        88  ##
##  88   88'          d8''8b      88        88  ##
##  88 d88           d8'  '8b     88        88  ##
##  8888'88.        d8YaaaaY8b    88        88  ##
##  88P   Y8b      d8''''''''8b   88        88  ##
##  88     '88.   d8'        '8b  88        88  ##
##  88       Y8b d8'          '8b 888888888 88  ##
##        CREATED BY FORHAD👽                   ##
##  GitHub: github.com/Forhadj                  ##
##  YT: youtube.com/@forhad2.00                 ##
##################################################
"
}

author_info() {
    print_banner
    echo
    echo "        Creator Info"
    echo
    echo "Name: Md Forhad"
    echo "GitHub: https://github.com/Forhadj"
    echo "YouTube: https://youtube.com/@forhad2.00"
    echo "Telegram: https://t.me/f_forhad"
    echo "Facebook: https://facebook.com/forhadhasan995"
    echo
    echo "Wait... Installation is starting!"
    sleep 3
}

update() {
    apt update -y
    apt upgrade -y
}

check_termux() {
    if [[ $HOME != /data/data/com.termux/files/home ]]; then
        echo "⚠️ This script is for Termux only."
        exit 1
    fi
}

install_pkg() {
    pkg install -y proot-distro git wget curl nano
}

install_kali() {
    if [[ -d "$PREFIX/var/lib/proot-distro/installed-rootfs/kali-linux" ]]; then
        echo "NetHunter already installed."
        read -p "Reinstall? (y/N): " opt
        [[ "$opt" =~ ^[Yy]$ ]] && reinstall_kali || exit
    else
        echo "Installing NetHunter..."
        proot-distro install kali-linux
    fi
}

reinstall_kali() {
    proot-distro remove kali-linux
    proot-distro clear-cache
    proot-distro install kali-linux
}

final_setup() {
    cat > $PREFIX/bin/nethunter << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
proot-distro login kali-linux
EOF
    chmod +x $PREFIX/bin/nethunter

    echo
    echo "✅ Installation Complete!"
    echo "📦 Run with: nethunter"
}

main() {
    author_info
    check_termux
    update
    install_pkg
    install_kali
    final_setup
}

main
