#!/usr/bin/env bash
# ============================================================
# 🍎  Lotfy's Mac Setup Script
# Automates setting up a brand new Mac with all apps & tools
# Usage:  chmod +x install.sh && ./install.sh
# ============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

step() { echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"; echo -e "${GREEN}▶ $1${NC}"; echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"; }
info() { echo -e "${CYAN}  ℹ  $1${NC}"; }
warn() { echo -e "${YELLOW}  ⚠  $1${NC}"; }
success() { echo -e "${GREEN}  ✔  $1${NC}"; }
error() { echo -e "${RED}  ✖  $1${NC}"; }

# ───────────────────────────────────────────────────────────
# 1. Xcode Command Line Tools
# ───────────────────────────────────────────────────────────
step "Installing Xcode Command Line Tools"
if xcode-select -p &>/dev/null; then
    success "Xcode Command Line Tools already installed"
else
    info "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Press ENTER after the Xcode CLI tools installer finishes."
    read -r
fi

# ───────────────────────────────────────────────────────────
# 2. Homebrew
# ───────────────────────────────────────────────────────────
step "Installing Homebrew"
if command -v brew &>/dev/null; then
    success "Homebrew already installed"
    info "Updating Homebrew..."
    brew update
else
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for Apple Silicon
    if [[ "$(uname -m)" == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# ───────────────────────────────────────────────────────────
# 3. Brew Bundle (install everything from Brewfile)
# ───────────────────────────────────────────────────────────
step "Installing packages from Brewfile"
if [[ -f "$SCRIPT_DIR/Brewfile" ]]; then
    brew bundle --file="$SCRIPT_DIR/Brewfile" --no-lock
    success "Brewfile installation complete"
else
    error "Brewfile not found!"
fi

# ───────────────────────────────────────────────────────────
# 4. Oh My Zsh
# ───────────────────────────────────────────────────────────
step "Installing Oh My Zsh"
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    success "Oh My Zsh already installed"
else
    info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# ───────────────────────────────────────────────────────────
# 5. Copy .zshrc
# ───────────────────────────────────────────────────────────
step "Setting up shell configuration"
if [[ -f "$SCRIPT_DIR/.zshrc" ]]; then
    if [[ -f "$HOME/.zshrc" ]]; then
        warn "Backing up existing .zshrc to ~/.zshrc.backup"
        cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
    fi
    cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
    success ".zshrc installed"
else
    warn ".zshrc not found in repo, skipping"
fi

# ───────────────────────────────────────────────────────────
# 6. NVM & Node.js
# ───────────────────────────────────────────────────────────
step "Installing NVM & Node.js"
export NVM_DIR="$HOME/.nvm"
if [[ -d "$NVM_DIR" ]]; then
    success "NVM already installed"
else
    info "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

# Load NVM
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

info "Installing Node.js v20 (LTS Iron)..."
nvm install 20
nvm alias default 20
success "Node.js $(node -v) installed"

# ───────────────────────────────────────────────────────────
# 7. Global NPM packages
# ───────────────────────────────────────────────────────────
step "Installing global NPM packages"
npm install -g corepack
corepack enable
success "Global NPM packages installed"

# ───────────────────────────────────────────────────────────
# 8. Composer
# ───────────────────────────────────────────────────────────
step "Installing Composer"
if command -v composer &>/dev/null; then
    success "Composer already installed"
else
    info "Installing Composer..."
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    php -r "unlink('composer-setup.php');"
    success "Composer installed"
fi

# ───────────────────────────────────────────────────────────
# 9. macOS Defaults (quality-of-life tweaks)
# ───────────────────────────────────────────────────────────
step "Applying macOS defaults"
if [[ -f "$SCRIPT_DIR/macos-defaults.sh" ]]; then
    source "$SCRIPT_DIR/macos-defaults.sh"
    success "macOS defaults applied"
else
    warn "macos-defaults.sh not found, skipping"
fi

# ───────────────────────────────────────────────────────────
# 10. Apps NOT in Homebrew (manual install reminders)
# ───────────────────────────────────────────────────────────
step "Apps that need manual installation"
echo ""
echo -e "${YELLOW}  The following apps were detected but are NOT in Homebrew."
echo -e "  You'll need to install them manually:${NC}"
echo ""
MANUAL_APPS=(
    "Amphetamine           → Mac App Store"
    "Antigravity           → Already bundled with your dev tools"
    "AnyDesk               → https://anydesk.com/download"
    "Blackmagic Proxy Gen  → Mac App Store"
    "Blackmagic RAW        → https://www.blackmagicdesign.com"
    "Brave Browser         → https://brave.com/download"
    "Caffeine              → Mac App Store or https://intelliscapesolutions.com/apps/caffeine"
    "ChatGPT Atlas         → Mac App Store"
    "ChatGPT               → https://chat.openai.com/desktop"
    "Claude                → https://claude.ai/download"
    "Clop                  → Mac App Store"
    "DBeaver               → https://dbeaver.io/download"
    "DaVinci Resolve       → https://www.blackmagicdesign.com/products/davinciresolve"
    "Discord               → https://discord.com/download"
    "Dropover              → Mac App Store"
    "Flux                  → https://justgetflux.com"
    "Free Download Manager → https://www.freedownloadmanager.org"
    "Google Chrome         → https://google.com/chrome"
    "Ice                   → https://github.com/jordanbaird/Ice"
    "Latest                → https://github.com/mangerlahn/Latest"
    "MonitorControlLite    → Mac App Store"
    "NearDrop              → https://github.com/grishka/NearDrop"
    "Notion                → https://www.notion.so/desktop"
    "Pearcleaner           → https://github.com/alienator88/Pearcleaner"
    "Prime Video           → Mac App Store"
    "Raycast               → https://raycast.com"
    "Scroll Reverser       → https://pilotmoon.com/scrollreverser"
    "Telegram              → Mac App Store or https://desktop.telegram.org"
    "Texty                 → Mac App Store"
    "The Unarchiver        → Mac App Store"
    "Tor Browser           → https://www.torproject.org/download"
    "VLC                   → https://www.videolan.org/vlc"
    "Visual Studio Code    → https://code.visualstudio.com"
    "WhatsApp              → Mac App Store or https://www.whatsapp.com/download"
    "Zoom                  → https://zoom.us/download"
)
for app in "${MANUAL_APPS[@]}"; do
    echo -e "    ${CYAN}•${NC} $app"
done
echo ""

# ───────────────────────────────────────────────────────────
# Done!
# ───────────────────────────────────────────────────────────
step "🎉  Setup Complete!"
echo ""
echo -e "${GREEN}  Your Mac is ready to go!${NC}"
echo -e "${CYAN}  Recommendations:${NC}"
echo -e "    • Restart your terminal (or run ${YELLOW}source ~/.zshrc${NC})"
echo -e "    • Install the manual apps listed above"
echo -e "    • Sign in to your accounts (iCloud, browsers, etc.)"
echo -e "    • Restore your SSH keys and Git config"
echo ""
