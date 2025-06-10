# config.nu
#
# Installed by:
# version = "0.104.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

source ~/.oh-my-posh.nu
$env.TERM = "xterm-256color"

$env.PATH = ($env.PATH | prepend "/home/pierr/.cargo/bin")

source ~/.config/nushell/scripts/git.nu
source ~/.config/nushell/scripts/docker.nu

###### ALIAS
alias lg = lazygit
alias cdd = cd /work
alias bye = sudo shutdown -h now

###### ENV
$env.EDITOR = "nvim"
$env.config.show_banner = false

def --env z [dir: string] {
  print $"z-ing to directory: ($dir)"
  let zDir = ZSH_CMD=1 zsh -ic $"z -e ($dir)"
  print $"cd to: ($zDir)"
  cd $zDir
}

fastfetch
