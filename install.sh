#!/bin/bash

# FORHAD NetHunter Installer (Standalone)
# Uses custom rootfs (not proot-distro)

print_banner() {
    clear
    echo "##################################################
##                                              ##
##      FORHAD NetHunter Installer (Lite)      ##
##      GitHub: github.com/Forhadj             ##
##      YouTube: youtube.com/@forhad2.00       ##
##################################################"
}

download_rootfs() {
    echo "[*] Downloading Kali NetHunter RootFS..."
    mkdir -p kali-fs
    cd kali-fs
    if [ ! -f rootfs.tar.xz ]; then
        curl -L -o rootfs.tar.xz https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Kali/arm64/kali-rootfs-arm64.tar.xz
    fi
    echo "[✔] Download complete."
}

extract_rootfs() {
    echo "[*] Extracting Kali RootFS..."
    tar -xJf rootfs.tar.xz --exclude='dev' > /dev/null
    echo "[✔] Extraction complete."
}

setup_launcher() {
    echo "[*] Setting up launcher..."
    cd ..
    cat > start-nethunter.sh <<- EOM
#!/bin/bash
cd kali-fs
unset LD_PRELOAD
command="proot \
  --link2symlink \
  -0 \
  -r kali-fs \
  -b /dev \
  -b /proc \
  -b /data/data/com.termux/files/home:/root \
  -w /root \
  /usr/bin/env -i \
  HOME=/root \
  PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games \
  TERM=\$TERM \
  LANG=C.UTF-8 \
  /bin/bash --login"
eval \$command
EOM

    chmod +x start-nethunter.sh
    echo "[✔] Done. Start with: ./start-nethunter.sh"
}

main() {
    print_banner
    pkg install proot tar curl -y
    download_rootfs
    extract_rootfs
    setup_launcher
    echo "✅ NetHunter Ready. Use: ./start-nethunter.sh"
}

main
