#                      | |             
#               _______| |__  _ __ ___ 
#              |_  / __| '_ \| '__/ __|
#             _ / /\__ \ | | | | | (__ 
#            (_)___|___/_| |_|_|  \___|
#
#   Author: ZeroPaul <landerspaulzero@gmail.com>

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path oh-my-zsh {{{

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# }}}

# Theme {{{

ZSH_THEME="zePool"

# }}}

# Default Settings {{{
#
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# }}}

# Plugins {{{

plugins=(git)

# }}}

# ZSH {{{

source $ZSH/oh-my-zsh.sh

# }}}

# Color {{{

export TERM=xterm-256color

# }}}

# User configuration Commet {{{

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# }}}

# Tmux {{{

#if [[ $SHLVL != "2" ]]; then
#tmux;
#fi

# }}}

# Functions {{{

function __typer {
    if [[ -d $* ]]; then
        t="$* directory was successsfully removed"
    elif [[ -f $* ]]; then
        t="$* file was successfully removed"
    else
        t="$* was not found"
    fi
}

function __notify {
    icon=$1
    title=$2
    description=$3
    notify-send -i $icon $title  $description
}

function __mkdir {
    message=""
    text=""
    for d in $@; do
        if [[ -d $d ]]; then
            text="$d directory already exists"
        else
            text="$d directory has been created"
            mkdir -p $d
        fi
        message+=$text
        message+="\\r"
    done
    __notify folder-new "Launcher" "${message:0:-2}"
    clear
}
#add R not R destroid
function __destroid {
    message=""
    for arg in $@; do
        __typer $arg
        message+=$t
        message+="\\r"
    done
    sudo rm -r -f $*
    __notify edittrash "Destroid" "${message:0:-2}"
    clear
}

function __fixer {
    sudo ntfsfix /dev/$*
}

function __mimefind {
    sudo grep $* /etc/mime.types
}

function __mimeadd {
    sudo mv $* /usr/share/mime/packages
    sudo update-mime-database /usr/share/mime
}

function __fontadd {
    sudo mv $* /usr/share/fonts
    sudo fc-cache -vf
}

function __confont {
    for ar in $@; do
        format_name=$(python3 $HOME/.hero_scripts/format_text.py $ar 2>&1)
        font_file="10-"
        font_file+=$format_name
        font_file+=".conf"
        python3 $HOME/.hero_scripts/generate_template.py $format_name $font_file
        sudo mv $HOME/.hero_scripts/$font_file /etc/fonts/conf.d/
    done 
}

function __cursoradd {
    sudo cp -r $* /usr/share/icons
}

function __openx {
    if [[ -z $@ ]]; then
        xdg-open .
    else
        for w in $@; do
            if [[ -d $w ]]; then
                xdg-open $w
            elif [[ -f $w ]]; then
                xdg-open $w
            else
                __notify stop "Not fount" "Could not be fount $w"
            fi 
        done
    fi
}

function __backup {
    dir_backup=$HOME/.backup
    if [[ -d "$dir_backup" ]]; then
        echo "exists"
    else
        cd && mkdir .backup
    fi

    for back in $@; do
        if [[ -f $back || -d $back ]]; then
            echo "work"
            path_orgin=$(readlink -f "$back")
            path_dir=$(dirname "$path_orgin")
            path_backup=$HOME/.backup
            extension_file="${back##*.}"
            cd $path_dir && cp $back $path_backup/
            backup_base64=$(echo "$back" | base64)
            echo $backup_base64
            echo $path_orgin
            echo $path_dir
            echo $extension_file
        else
            echo "no found"
        fi
    done
} 
# }}}

# Aliases  {{{

alias launcher='__mkdir'
alias destroid='__destroid'
alias fixdisc="__fixer"
alias mimefind="__mimefind"
alias mimeadd="__mimeadd"
alias fontsadd="__fontadd"
alias fontsconf="__confont"
alias cursoradd="__cursoradd"
alias openx="__openx 2>/dev/null"


alias zetting="vim ~/.zshrc"
alias zource="source ~/.zshrc"
alias zzh="cat ~/.ssh/id_rsa.pub"
alias listz="sudo vim /etc/apt/sources.list"

alias cursoredit="sudo vim /usr/share/icons/default/index.theme"

# /usr/share/thumbnailers
#}}}

# VirtualenvWrapper {{{

#export WORKON_HOME=$HOME/.virtualenvs 
#export PROJECT_HOME=$HOME/projects
#export VIRTUALENV_DISTRIBUTE=true
#export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
#export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
#source /usr/local/bin/virtualenvwrapper_lazy.sh

# }}}

# OpenSSL {{{

#export PATH="/usr/local/ssl/bin:${PATH}"

# }}}

# Variables  {{{

#export LC_ALL="en_US.UTF-8"
#export LC_CTYPE="en_US.UTF-8"

# }}}

# LS_COLORS="ow=1;32"

