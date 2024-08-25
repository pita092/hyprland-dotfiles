# Created by newuser for 5.9
# Gruvbox colors
GRUVBOX_RED=$'%F{#fb4934}'
GRUVBOX_GREEN=$'%F{#b8bb26}'
GRUVBOX_YELLOW=$'%F{#fabd2f}'
GRUVBOX_BLUE=$'%F{#83a598}'
GRUVBOX_PURPLE=$'%F{#d3869b}'
GRUVBOX_AQUA=$'%F{#8ec07c}'
GRUVBOX_ORANGE=$'%F{#fe8019}'
GRUVBOX_WHITE=$'%F{#bdae93}'
RESET_COLOR=$'%f'

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats "${GRUVBOX_PURPLE}(%b)${RESET_COLOR}"
setopt PROMPT_SUBST

PROMPT="${GRUVBOX_RED}[${GRUVBOX_YELLOW}%n${GRUVBOX_GREEN}@${GRUVBOX_BLUE}%m${RESET_COLOR} ${GRUVBOX_PURPLE}%~${GRUVBOX_RED}]${RESET_COLOR}${GRUVBOX_YELLOW}${RESET_COLOR}${GRUVBOX_WHITE}>${RESET_COLOR} "

export PATH="/home/pita/eww/target/release:$PATH"
export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland	
export GBM_BACKEND=nvidia-drm
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_PICTURES_DIR="$HOME/Pictures/Screenshots/Hypr"
export GTK_THEME=Gruvbox-Dark
export PATH=$PATH:/home/pita/bin
export PATH=$PATH:/home/pita/.local/share/nvim/mason/bin
export PATH="$HOME/.cargo/bin:$PATH"


alias fetch='~/scripts/custom_fastfetch.sh'
alias bashrc='nvim ~/.bashrc'
alias zshrc='nvim ~/.zshrc'
alias cls='clear'
alias vim='launch_neovide'


eval "$(zoxide init bash)"
bindkey "^[[3~" delete-char


cowsay -f stegosaurus Hello, pita | ~/scripts/cowsay.sh





