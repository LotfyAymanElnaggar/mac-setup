# 🍎 Lotfy's Mac Setup

> One script to set up a brand-new Mac with all my apps, dev tools, and preferences.

## Quick Start

```bash
git clone https://github.com/YOUR_USERNAME/mac-setup.git ~/mac-setup
cd ~/mac-setup
chmod +x install.sh
./install.sh
```

## What Gets Installed

### 🍺 Homebrew Formulae (CLI tools & libraries)

| Category | Packages |
|----------|----------|
| **PHP** | `php`, `php@8.0`, `php@8.2` |
| **Database** | `mysql`, `sqlite`, `libpq`, `freetds` |
| **Web/Network** | `curl`, `libnghttp2`, `libnghttp3`, `libngtcp2`, `libssh2`, `openssl@3`, `krb5` |
| **Image/Media** | `gd`, `freetype`, `libpng`, `libtiff`, `webp`, `jpeg-turbo`, `jpeg-xl`, `giflib`, `libavif`, `aom`, `dav1d`, `libvmaf`, `highway`, `little-cms2`, `openexr`, `openjph`, `imath` |
| **Compression** | `brotli`, `lz4`, `xz`, `zlib`, `zstd`, `libdeflate`, `libzip` |
| **Text/Data** | `aspell`, `gettext`, `oniguruma`, `pcre2`, `readline`, `tidy-html5`, `protobuf`, `icu4c@78` |
| **Build tools** | `autoconf`, `libtool`, `m4` |
| **Crypto** | `argon2`, `gmp`, `libsodium` |
| **System** | `ca-certificates`, `fontconfig`, `libunistring`, `net-snmp`, `openldap`, `unixodbc` |

### 🖥️ Homebrew Casks (GUI apps)

| App | Description |
|-----|-------------|
| **AltTab** | Windows-style alt-tab switcher |
| **CleanShot** | Screenshot & recording tool |
| **Docker Desktop** | Container management |
| **DisplayLink Manager** | External display driver/manager |
| **Hidden Bar** | Hide menu bar icons |
| **iTerm2** | Terminal emulator |
| **Itsycal** | Tiny menu bar calendar |
| **LocalSend** | Cross-platform file sharing |
| **Rectangle** | Window management |
| **Stats** | System monitor in menu bar |
| **Time Out** | Break reminder |

### 📦 Other Apps (manual install)

These apps were found on the system but need manual installation:

| App | Source |
|-----|--------|
| Amphetamine | Mac App Store |
| AnyDesk | [anydesk.com](https://anydesk.com/download) |
| Blackmagic Proxy Generator Lite | Mac App Store |
| Blackmagic RAW | [blackmagicdesign.com](https://www.blackmagicdesign.com) |
| Brave Browser | [brave.com](https://brave.com/download) |
| Caffeine | Mac App Store |
| ChatGPT | [openai.com](https://chat.openai.com/desktop) |
| ChatGPT Atlas | Mac App Store |
| Claude | [claude.ai](https://claude.ai/download) |
| Clop | Mac App Store |
| DaVinci Resolve | [blackmagicdesign.com](https://www.blackmagicdesign.com/products/davinciresolve) |
| DBeaver | [dbeaver.io](https://dbeaver.io/download) |
| Discord | [discord.com](https://discord.com/download) |
| Dropover | Mac App Store |
| f.lux | [justgetflux.com](https://justgetflux.com) |
| Free Download Manager | [freedownloadmanager.org](https://www.freedownloadmanager.org) |
| Google Chrome | [google.com/chrome](https://google.com/chrome) |
| Ice | [GitHub](https://github.com/jordanbaird/Ice) |
| Latest | [GitHub](https://github.com/mangerlahn/Latest) |
| MonitorControl Lite | Mac App Store |
| NearDrop | [GitHub](https://github.com/grishka/NearDrop) |
| Notion | [notion.so](https://www.notion.so/desktop) |
| Pearcleaner | [GitHub](https://github.com/alienator88/Pearcleaner) |
| Prime Video | Mac App Store |
| Raycast | [raycast.com](https://raycast.com) |
| Scroll Reverser | [pilotmoon.com](https://pilotmoon.com/scrollreverser) |
| Telegram | Mac App Store |
| Texty | Mac App Store |
| The Unarchiver | Mac App Store |
| Tor Browser | [torproject.org](https://www.torproject.org/download) |
| Visual Studio Code | [code.visualstudio.com](https://code.visualstudio.com) |
| VLC | [videolan.org](https://www.videolan.org/vlc) |
| WhatsApp | Mac App Store |
| Zoom | [zoom.us](https://zoom.us/download) |

### 🧰 Dev Environment

| Tool | Version | Method |
|------|---------|--------|
| **Node.js** | v20.20.0 (LTS Iron) | NVM |
| **PHP** | 8.2.30 | Homebrew |
| **MySQL** | 9.6.0 | Homebrew |
| **Git** | Apple Git | Xcode CLT |
| **Docker** | 29.2.0 | Docker Desktop |
| **Python** | 3.9.6 | System |
| **Composer** | Latest | Manual install |

### 🔌 VS Code Extensions

- `github.copilot-chat`
- `ms-azuretools.vscode-containers`
- `ms-vscode-remote.remote-containers`

### 🐚 Shell Setup

- **Shell**: Zsh with [Oh My Zsh](https://ohmyz.sh)
- **Theme**: `robbyrussell`
- **Plugins**: `git`

## Repository Structure

```
mac-setup/
├── README.md            # This file
├── Brewfile             # Homebrew packages & casks
├── install.sh           # Main setup script
├── macos-defaults.sh    # macOS preference tweaks
├── .zshrc               # Shell configuration
└── .gitignore           # Git ignores
```

## Customization

- **Add/remove Homebrew packages**: Edit `Brewfile`
- **Add/remove macOS tweaks**: Edit `macos-defaults.sh`
- **Change shell config**: Edit `.zshrc`
- **Add new setup steps**: Edit `install.sh`

## Detected System Info

| Property | Value |
|----------|-------|
| **Generated** | February 20, 2026 |
| **Architecture** | Apple Silicon (arm64) |
| **Homebrew Formulae** | 68 packages |
| **Homebrew Casks** | 11 apps |
| **Applications** | 50+ total |
