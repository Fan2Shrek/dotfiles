#!/usr/bin/env bash

set -euo pipefail

CHEZMOI_REPO="https://github.com/Fan2Shrek/dotfiles.git"

###############################################################################
# HELPERS
###############################################################################

log() {
  printf "\n\033[1;34m==>\033[0m %s\n" "$1"
}

exists() {
  command -v "$1" >/dev/null 2>&1
}

###############################################################################
# PACMAN
###############################################################################

log "Updating system"

sudo pacman -Syu --noconfirm

log "Installing official packages"

sudo pacman -S --needed --noconfirm - < pkglist.txt

###############################################################################
# YAY
###############################################################################

if ! exists yay; then
  log "Installing yay"

  TMP_DIR="$(mktemp -d)"

  git clone https://aur.archlinux.org/yay.git "$TMP_DIR/yay"

  pushd "$TMP_DIR/yay" >/dev/null
  makepkg -si --noconfirm
  popd >/dev/null

  rm -rf "$TMP_DIR"
else
  log "yay already installed"
fi

###############################################################################
# AUR PACKAGES
###############################################################################

log "Installing AUR packages"

yay -S --needed --noconfirm - < aur-pkglist.txt

###############################################################################
# CHEZMOI
###############################################################################

if ! exists chezmoi; then
  log "Installing chezmoi"

  sh -c "$(curl -fsLS get.chezmoi.io)"
else
  log "chezmoi already installed"
fi

###############################################################################
# DOTFILES
###############################################################################

if [ ! -d "$HOME/.local/share/chezmoi" ]; then
  log "Initializing chezmoi"

  chezmoi init "$CHEZMOI_REPO"
fi

log "Applying dotfiles"

chezmoi apply

###############################################################################
# SHELL
###############################################################################

if [ "$SHELL" != "$(which zsh)" ]; then
  log "Changing default shell to zsh"

  chsh -s "$(which zsh)"
fi

###############################################################################
# DOCKER
###############################################################################

log "Enabling docker service"

sudo systemctl enable docker.service
sudo systemctl start docker.service

if ! groups "$USER" | grep -q docker; then
  log "Adding user to docker group"

  sudo usermod -aG docker "$USER"
fi

###############################################################################
# SSH
###############################################################################

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  log "Generating SSH key"

  ssh-keygen -t ed25519 -C "$USER@$(hostname)"
fi

###############################################################################
# DONE
###############################################################################

log "Bootstrap complete"

echo
echo "Next steps:"
echo "  1. Reboot"
echo "  2. Run: exec zsh"
echo "  3. Verify chezmoi applied correctly"
echo
