# 🛡️ NetHunter CLI Installer for Termux by Forhad

Welcome to the **NetHunter CLI Installer** built specifically for Termux users. This project automates the setup of Kali NetHunter (rootless) with useful tools like `nmap`, `sqlmap`, `hydra`, and `metasploit`, along with a custom launcher command and styled prompt.

---

## 📦 Features

- One-command installation for Kali NetHunter (Debian based)
- Installs essential pentesting tools automatically
- Creates a `nethunter` command to start NetHunter CLI
- Adds styled prompt: `┌──(forhad㉿localhost)-[~]`
- Lightweight & error-handled script
- Suitable for beginners and advanced Termux users

---

## 🚀 How to Install

```bash
pkg update && pkg upgrade -y
pkg install -y git
git clone https://github.com/Forhadj/nethunter-termux
cd nethunter-termux
bash install.sh
```

---

## 🔧 Usage

```bash
nethunter
```

This launches the Kali NetHunter terminal with all your tools ready.

---

## 📚 Tools Included

- `nmap` – Network Mapper
- `sqlmap` – SQL Injection Automation
- `hydra` – Brute Force Login Cracker
- `metasploit-framework` – Exploitation Framework
- `dnsutils` – DNS Analysis Tools (`dig`, etc.)

---

## ⚠️ Common Issues & Fixes

| Issue                                      | Solution                                       |
|--------------------------------------------|------------------------------------------------|
| `command not found` after install          | Run `source ~/.bashrc` or restart Termux       |
| `Error: proot-distro should not be run as root` | Always run `nethunter` from normal Termux shell |
| Package not found                          | Run `termux-change-repo` then retry            |
| Insufficient space                         | Ensure at least **3GB free**                    |

---

## 🙋 About Developer

- **Name:** Md Forhad  
- **GitHub:** https://github.com/Forhadj  
- **Facebook:** https://facebook.com/forhadhasan995  
- **YouTube:** https://youtube.com/@forhad2.00  
- **Telegram:** https://t.me/f_forhad  

---

## 📜 License

MIT License – Use, modify, distribute freely with credit.

---

> This tool is designed for educational purposes. Always use ethically.

Happy Hunting! 🔍
