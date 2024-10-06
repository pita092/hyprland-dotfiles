#:: Created by newuser for 5.9
# Gruvbox colors
# GRUVBOX_RED=$'%F{#fb4934}'
# GRUVBOX_GREEN=$'%F{#b8bb26}'
# GRUVBOX_YELLOW=$'%F{#fabd2f}'
# GRUVBOX_BLUE=$'%F{#83a598}'
# GRUVBOX_PURPLE=$'%F{#d3869b}'
# GRUVBOX_AQUA=$'%F{#8ec07c}'
# GRUVBOX_ORANGE=$'%F{#fe8019}'
# GRUVBOX_WHITE=$'%F{#bdae93}'
# RESET_COLOR=$'%f'
#
# autoload -Uz vcs_info
# precmd() { vcs_info }
# zstyle ':vcs_info:git:*' formats "${GRUVBOX_PURPLE}(%b)${RESET_COLOR}"
# setopt PROMPT_SUBST
#
# PROMPT="${GRUVBOX_RED}[${GRUVBOX_YELLOW}%n${GRUVBOX_GREEN}@${GRUVBOX_BLUE}%m${RESET_COLOR} ${GRUVBOX_PURPLE}%~${GRUVBOX_RED}]${RESET_COLOR}${GRUVBOX_YELLOW}${RESET_COLOR}${GRUVBOX_WHITE}>${RESET_COLOR} "

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
alias platipus='fastfetch -c ~/.config/fastfetch/config2.json'
alias parry-the-platipus='fetch'

bindkey "^[[3~" delete-char


cowsay -f stegosaurus Hello, pita | ~/scripts/cowsay.sh




function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" && __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

function z() {
    __zoxide_z "$@"
}

function zi() {
    __zoxide_zi "$@"
}

# Completions.
if [[ -o zle ]]; then
    __zoxide_result=''

    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            # Show completions for local directories.
            _files -/
        elif [[ "${words[-1]}" == '' ]]; then
            # Show completions for Space-Tab.
            # shellcheck disable=SC2086
            __zoxide_result="$(\command zoxide query --exclude "$(__zoxide_pwd || \builtin true)" --interactive -- ${words[2,-1]})" || __zoxide_result=''

            # Bind '\e[0n' to helper function.
            \builtin bindkey '\e[0n' '__zoxide_z_complete_helper'
            # Send '\e[0n' to console input.
            \builtin printf '\e[5n'
        fi

        # Report that the completion was successful, so that we don't fall back
        # to another completion function.
        return 0
    }

    function __zoxide_z_complete_helper() {
        if [[ -n "${__zoxide_result}" ]]; then
            # shellcheck disable=SC2034,SC2296
            BUFFER="z ${(q-)__zoxide_result}"
            \builtin zle reset-prompt
            \builtin zle accept-line
        else
            \builtin zle reset-prompt
        fi
    }
    \builtin zle -N __zoxide_z_complete_helper

    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete z
fi




eval "$(zoxide init bash)"

