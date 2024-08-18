#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\W]\$ '
export PATH="/home/pita/eww/target/release:$PATH"
export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland	
export GBM_BACKEND=nvidia-drm
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_PICTURES_DIR="$HOME/Pictures/Screenshots/Hypr"
export GTK_THEME=Gruvbox-Dark
alias fetch='fastfetch'
alias bashrc='nvim ~/.bashrc'
export EDITOR='nvim'
export VISUAL='nvim'

eval "$(zoxide init bash)"
eval "$(starship init bash)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
