# ~.config/fish/config.fish



# Gruvbox colors
set -g GRUVBOX_RED (set_color '#fb4934')
set -g GRUVBOX_GREEN (set_color '#b8bb26')
set -g GRUVBOX_YELLOW (set_color '#fabd2f')
set -g GRUVBOX_BLUE (set_color '#83a598')
set -g GRUVBOX_PURPLE (set_color '#d3869b')
set -g GRUVBOX_AQUA (set_color '#8ec07c')
set -g GRUVBOX_ORANGE (set_color '#fe8019')
set -g GRUVBOX_WHITE (set_color '#bdae93')
set -g RESET_COLOR (set_color normal)

function fish_prompt
  # Check if we're in Alacritty
  if set -q ALACRITTY_WINDOW_ID
    # Use the same prompt format without colors for Alacritty
    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    echo -n "["
    echo -n (whoami)
    echo -n "@"
    echo -n (uname -n)
    echo -n " "
    # echo -n (prompt_pwd )
    printf '%s' (prompt_pwd --full-length-dirs 4)
    echo -n "]"
    if test -n "$git_branch"
      echo -n "($git_branch)"
    end
    echo -n "󰲒 "
  else
    # Your custom prompt for other terminals with colors
    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    echo -n "$GRUVBOX_RED""["
    echo -n "$GRUVBOX_YELLOW"(whoami)
    echo -n "$GRUVBOX_GREEN@"
    echo -n "$GRUVBOX_BLUE"(uname -n)
    echo -n " $GRUVBOX_PURPLE"(prompt_pwd)
    echo -n "$GRUVBOX_RED""]"
    if test -n "$git_branch"
      echo -n "$GRUVBOX_RED($RESET_COLOR$GRUVBOX_PURPLE$git_branch$RESET_COLOR$GRUVBOX_RED)"
    end
    echo -n "$RESET_COLOR$GRUVBOX_BLUE 󰲒 $RESET_COLOR"
  end
end

# The rest of your configuration remains unchanged
# Environment variables
set -x PATH $HOME/git-clone/eww/target/release $PATH
set -x LIBVA_DRIVER_NAME nvidia
set -x XDG_SESSION_TYPE wayland
set -x GBM_BACKEND nvidia-drm
set -x XDG_CURRENT_DESKTOP Hyprland
set -x XDG_PICTURES_DIR $HOME/Pictures/Screenshots/Hypr
set -x GTK_THEME Gruvbox-Dark
set -x PATH $PATH $HOME/bin
set -x PATH $PATH $HOME/.local/share/nvim/mason/bin
set -x PATH $HOME/.cargo/bin $PATH

# editor
set -x EDITOR vim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR "rvim -u NONE"

# Aliases
alias custom-fetch='~/scripts/custom_fastfetch.sh'
alias bashrc='nvim ~/.bashrc'
alias zshrc='nvim ~/.zshrc'
alias cls='clear'
alias fetch='~/scripts/custom_fastfetch.sh'
alias fishrc='nvim ~/.config/fish/config.fish'
alias kirc='nvim ~/.config/kitty/kitty.conf'
alias fase='fzf --tmux right,50%,40%'
# alias fzf="fzf --preview 'bat --style numbers,changes --color=always --theme=gruvbox-dark {} | head -500'"
# Key bindings
bind \e\[3~ delete-char

# Zoxide initialization
if type -q zoxide
  zoxide init fish | source
end
# Set up fzf key bindings
fzf --fish | source
# export FZF_CTRL_T_OPTS="
#   --walker-skip .git,node_modules,target
#   --preview 'bat -n --color=always {}'
#   --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export GEMINI_API_KEY="AIzaSyBPE24S-B_7drCYdnBONI2Y-fsjnNf9zCs"
export CODESTRAL_API_KEY="BttB0UFilIRgSRQPfefbYI4WogQt8bXw"




contains /usr/local/bin $PATH
or set PATH /usr/local/bin $PATH

set PATH /home/pita/.local/bin $PATH









# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd
  builtin pwd -L
end


# A copy of fish's internal cd function. This makes it possible to use
# `alias cd=z` without causing an infinite loop.
if ! builtin functions --query __zoxide_cd_internal
  if builtin functions --query cd
    builtin functions --copy cd __zoxide_cd_internal
  else
    alias __zoxide_cd_internal='builtin cd'
  end
end

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
  __zoxide_cd_internal $argv
end

# =============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
function __zoxide_hook --on-variable PWD
  test -z "$fish_private_mode"
  and command zoxide add -- (__zoxide_pwd)
end

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

if test -z $__zoxide_z_prefix
  set __zoxide_z_prefix 'z!'
end
set __zoxide_z_prefix_regex ^(string escape --style=regex $__zoxide_z_prefix)

# Jump to a directory using only keywords.
function __zoxide_z
  set -l argc (count $argv)
  if test $argc -eq 0
    __zoxide_cd $HOME
  else if test "$argv" = -
    __zoxide_cd -
  else if test $argc -eq 1 -a -d $argv[1]
    __zoxide_cd $argv[1]
  else if set -l result (string replace --regex $__zoxide_z_prefix_regex '' $argv[-1]); and test -n $result
    __zoxide_cd $result
  else
    set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
    and __zoxide_cd $result
  end
end

# Completions.
function __zoxide_z_complete
  set -l tokens (commandline --current-process --tokenize)
  set -l curr_tokens (commandline --cut-at-cursor --current-process --tokenize)

  if test (count $tokens) -le 2 -a (count $curr_tokens) -eq 1
    # If there are < 2 arguments, use `cd` completions.
    complete --do-complete "'' "(commandline --cut-at-cursor --current-token) | string match --regex '.*/$'
  else if test (count $tokens) -eq (count $curr_tokens); and ! string match --quiet --regex $__zoxide_z_prefix_regex. $tokens[-1]
    # If the last argument is empty and the one before doesn't start with
    # $__zoxide_z_prefix, use interactive selection.
    set -l query $tokens[2..-1]
    set -l result (zoxide query --exclude (__zoxide_pwd) --interactive -- $query)
    and echo $__zoxide_z_prefix$result
    commandline --function repaint
  end
end
complete --command __zoxide_z --no-files --arguments '(__zoxide_z_complete)'

# Jump to a directory using interactive search.
function __zoxide_zi
  set -l result (command zoxide query --interactive -- $argv)
  and __zoxide_cd $result
end

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

abbr --erase z &>/dev/null
alias z=__zoxide_z

abbr --erase zi &>/dev/null
alias zi=__zoxide_zi

set -g fish_prompt_pwd_dir_length 0




#
#
#
#
## Gruvbox colors
#set -g GRUVBOX_RED (set_color '#fb4934')
#set -g GRUVBOX_GREEN (set_color '#b8bb26')
#set -g GRUVBOX_YELLOW (set_color '#fabd2f')
#set -g GRUVBOX_BLUE (set_color '#83a598')
#set -g GRUVBOX_PURPLE (set_color '#d3869b')
#set -g GRUVBOX_AQUA (set_color '#8ec07c')
#set -g GRUVBOX_ORANGE (set_color '#fe8019')
#set -g GRUVBOX_WHITE (set_color '#bdae93')
#set -g RESET_COLOR (set_color normal)
#
#function fish_prompt
#    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
#    echo -n "$GRUVBOX_RED""["
#    echo -n "$GRUVBOX_YELLOW"(whoami)
#    echo -n "$GRUVBOX_GREEN@"
#    echo -n "$GRUVBOX_BLUE"(uname -n)
#    echo -n " $GRUVBOX_PURPLE"(prompt_pwd)
#    echo -n "$GRUVBOX_RED""]"
#    if test -n "$git_branch"
#        echo -n "$GRUVBOX_PURPLE($git_branch)"
#    end
#    echo -n "$RESET_COLOR$GRUVBOX_WHITE> $RESET_COLOR"
#end
#
#
## Environment variables
#set -x PATH $HOME/eww/target/release $PATH
#set -x LIBVA_DRIVER_NAME nvidia
#set -x XDG_SESSION_TYPE wayland
#set -x GBM_BACKEND nvidia-drm
#set -x XDG_CURRENT_DESKTOP Hyprland
#set -x XDG_PICTURES_DIR $HOME/Pictures/Screenshots/Hypr
#set -x GTK_THEME Gruvbox-Dark
#set -x PATH $PATH $HOME/bin
#set -x PATH $PATH $HOME/.local/share/nvim/mason/bin
#set -x PATH $HOME/.cargo/bin $PATH
#
## editor
#set -x EDITOR vim
#set -x GIT_EDITOR $EDITOR
#set -x SUDO_EDITOR "rvim -u NONE"
#
## Aliases
#alias fetch='~/scripts/custom_fastfetch.sh'
#alias bashrc='nvim ~/.bashrc'
#alias zshrc='nvim ~/.zshrc'
#alias cls='clear'
#alias vim='launch_neovide'
#alias platipus='fastfetch -c ~/.config/fastfetch/config2.json'
#alias parry-the-platipus='fetch'
#alias fishrc='nvim ~/.config/fish/config.fish'
#
## Key bindings
#bind \e\[3~ delete-char
#
## Cowsay greeting
##function fish_greeting
#    #cowsay -f stegosaurus Hello, pita | ~/scripts/cowsay.sh
#  #end
#
## Zoxide initialization
#if type -q zoxide
#    zoxide init fish | source
#end
#
#contains /usr/local/bin $PATH
#or set PATH /usr/local/bin $PATH

