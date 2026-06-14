# Remove the fish greetings
set -g fish_greeting

# Start neofetch, starship and atuin
neofetch
eval (starship init fish)
atuin init fish | source

fish_add_path ~/.local/bin

# Create directory and enter it
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

# Jump to a project
function proj
    cd ~/Projects/$argv[1]
end

# Backup file
function bak
    cp $argv[1] $argv[1].bak
end


#########################################
## Aliases
#########################################

# File Listing (eza)
alias ls='eza -1 --icons=auto'
alias l='eza -lh --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias la='eza -a --icons=auto'
alias ld='eza -lhD --icons=auto'
alias lt='eza --icons=auto --tree'
alias lta='eza --tree -a --icons=auto'
alias ltl='eza --tree -lh --icons=auto'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias cfg='cd ~/.config'
alias cache='cd ~/.cache'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias pics='cd ~/Pictures'

# File Operations
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkdir='mkdir -pv'

# Process Management
alias kf='kill -9'

# Git
alias g='git'

alias gs='git status'
alias ga='git add'
alias gaa='git add .'

alias gc='git commit'
alias gcm='git commit -m'

alias gp='git push'
alias gpl='git pull'

alias gb='git branch'
alias gba='git branch -a'

alias gco='git checkout'
alias gcb='git checkout -b'

alias gd='git diff'
alias gl='git log --oneline --graph --decorate'

# Archives
alias untar='tar -xvf'
alias targz='tar -czvf'

# Package Management
alias paci='sudo pacman -S'
alias pacr='sudo pacman -Rns'
alias pacu='sudo pacman -Syu'
alias yi='yay --noconfirm --needed -S'
alias yr='yay -Rns'
alias yu='yay -Syu --noconfirm --needed'

# Editors
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# Quick Commands
alias path='echo $PATH | tr ":" "\n"'
alias reload='source ~/.config/fish/config.fish'
alias c='printf "\e[3J\e[H\e[2J"'
alias cls='printf "\e[3J\e[H\e[2J"'
alias clear='printf "\e[3J\e[H\e[2J"'
