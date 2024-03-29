if [ -f /etc/bashrc ];
then
    . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
PATH="$HOME/my-scripts/:$PATH"
export PATH

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


_RED=$(tput setaf 1)
_GREEN=$(tput setaf 35)
_VIOLET=$(tput setaf 105)
_BLUE=$(tput setaf 4)
_CYAN=$(tput setaf 69)
_BOLD=$(tput bold)
_REV=$(tput rev)
_RESET=$(tput sgr0)

#export PS1="S: \! | ${_BOLD}${_BLUE}[\s] ${_RESET}${_GREEN}(\D{%A %e %B} | \t) ${_RESET}${_BOLD}${_VIOLET}[\w] ${_RED}\$(parse_git_branch)${_RESET}\n${_CYAN}${_BOLD}\u${_RESET} \$ "

#PROMPT_COMMAND=__prompt_command

function __prompt_command()
{
    local EXIT="$?"
    PS1="${_REV}"

    local _LIGHT_GREEN=$(tput setaf 47)

    if [ $EXIT != 0 ]; then
        PS1+="${_RED}[$EXIT]"
    else
        PS1+="${_LIGHT_GREEN}[$EXIT]"
    fi

    PS1+="${_RESET} ${_BOLD}${_BLUE}[\s] ${_RESET}${_GREEN}(\D{%A %e %B} | \t) ${_RESET}${_BOLD}${_VIOLET}[\w] ${_RED}\$(parse_git_branch)${_RESET}\n${_CYAN}${_BOLD}\u${_RESET} > "
}

function mkcd()
{
    mkdir $1;
    cd $1;
}

function save_config()
{
    rm ~/perso/utils/bashrc;
    rm ~/perso/utils/i3config;
    rm ~/perso/utils/i3status.conf;
    rm ~/perso/utils/picom.conf;
    rm ~/perso/utils/alacritty.yml;
    rm -r ~/perso/utils/slock;
    rm ~/perso/utils/init.vim;
    cp ~/.bashrc ~/perso/utils/bashrc;
    cp ~/.config/i3/config ~/perso/utils/i3config;
    cp /etc/i3status.conf ~/perso/utils/i3status.conf;
    cp ~/.config/picom/picom.conf ~/perso/utils/picom.conf;
    cp ~/.config/alacritty/alacritty.yml ~/perso/utils/alacritty.yml;
    cp -r ~/perso/slock ~/perso/utils/;
    cp ~/.config/nvim/init.vim ~/perso/utils/init.vim;
    cd ~/perso/utils/;
    git add --all;
    git commit -m "bashrc modifications";
    git push;
    cd -;
}

function xs()
{
    if [[ $1 == "on" ]]; then
        if [[ $2 == "same-as" ]]; then
            xrandr --output HDMI-1-0 --$2 eDP-1 --mode 1920x1080;
            xrandr --output eDP-1 --mode 1920x1080;
        else
            xrandr --output HDMI-1-0 --$2 eDP-1 --auto;
        fi
    elif [[ $1 == "off" ]]; then
        xrandr --output HDMI-1-0 --off;
        xrandr --output eDP-1 --mode 2560x1440;
    fi
}

function create_branch()
{
    git branch $1
    git switch $1
    git push --set-upstream origin $1
}

transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

xset s off
xset -dpms
gk epitech

alias ls="ls --color=auto"
alias l="ls"
alias la="ls -a --color=auto"
alias lla="ls -al --color=auto"
alias lal="ls -al --color=auto"
alias em="emacs"
alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias cl="clear"
alias c="clear"
alias cs="coding-style ./ ./"
alias em="emacs"
alias gi="printf '*.a\n*.o\n*.bin\n*.out\n*.log' >> .gitignore"
alias mc="mr_clean"
alias please="sudo"
alias pt="push_that.sh"
alias off="systemctl poweroff"
alias sl="setxkbmap ru"
alias ,,,="setxkbmap us"
alias ga="git add"
alias gaa="echo \"check objects files\" ; git add --all"
alias gc="git commit -m"
alias gcm='git commit -m "add a lot of functionnalities"'
alias gp="git push"
alias bc="bc -l"
alias diff="colordiff"
alias i3lock="i3lock -c 1c79bd"
alias giiit="git"
alias outlook="firefox https://outlook.office.com/mail &"
alias vim="nvim"
alias lucas="echo \"c koi MUL\""
alias ana="echo \"<3\""
alias alias="yes casse toi avec ton "
unset rc
[ -f "/home/julithein/.ghcup/env" ] && source "/home/julithein/.ghcup/env" # ghcup-env
. "$HOME/.cargo/env"
