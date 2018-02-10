# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/cereberus/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="clean"
# Interesting: clean, jonathan, clean

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in daclean).
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

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
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

###############################################################################
#
#           USER-SPECIFIC SETTINGS
#
# All settings before this section was found by default in .zshrc file.
#

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
#
# Disply as a list
alias l='ls -CF -l'

#######################
# Directories aliases
#
#
if [ "$(whoami)" != 'root' ]; then
    USER_PREFIX='/home'
else
    USER_PREFIX=''
fi
#
alias d='cd /home/cereberus/Downloads'
alias g='cd /home/cereberus/git'
alias t='cd /tmp'

export LANG=en_US.UTF-8
export LC_MESSAGES="C"

##########################################
# Programs, scripts and commands aliases
#
# Short or single-character
config_dir='/home/cereberus/.config/cereberus_arch'
alias b='bash $config_dir/brightness.sh'
alias c='bash $config_dir/colors.sh'
alias e='evince'
alias i='firefox -new-window'
alias iq='firefox -new-window --private'
alias l='ls -l --color=auto'
alias lx='lynx duckduckgo.com'
alias lxn='lynx wiki.archlinux.org/index.php/Netctl'
alias pa='ping www.archlinux.org'
alias m='mplayer -fs'

#
# Multiple-characters
#
#
# To-be-populated

# Required for ctrl+s vim save.
stty -ixon

# FSL initialization
source /etc/fsl/5.0/fsl.sh

# Keyboard layout
setxkbmap pl
#EOF
###############################################################################
#
#           USER-SPECIFIC SETTINGS
#
# All settings before this section was found by default in .zshrc file.
#

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
#
# Disply as a list
alias l='ls -CF -l'

#######################
# Directories aliases
#
#
if [ "$(whoami)" != 'root' ]; then
    USER_PREFIX='/home'
else
    USER_PREFIX=''
fi
#
alias d='cd /home/cereberus/Downloads'
alias g='cd /home/cereberus/git'
alias t='cd /tmp'

export LANG=en_US.UTF-8
export LC_MESSAGES="C"

##########################################
# Programs, scripts and commands aliases
#
# Short or single-character
config_dir='/home/cereberus/.config/cereberus_arch'
alias b='bash $config_dir/brightness.sh'
alias c='bash $config_dir/colors.sh'
alias e='evince'
alias i='firefox -new-window'
alias iq='firefox -new-window --private'
alias l='ls -l --color=auto'
alias lx='lynx duckduckgo.com'
alias lxn='lynx wiki.archlinux.org/index.php/Netctl'
alias pa='ping www.archlinux.org'
alias m='mplayer -fs'
alias mass_rename='bash /home/cereberus/Dropbox/linux/scripts/mass_rename.sh'
alias mendeley='/opt/mendeleydesktop/bin/mendeleydesktop'

#
# Multiple-characters
#
#
# To-be-populated

# Required for ctrl+s vim save.
stty -ixon

# FSL initialization
source /etc/fsl/5.0/fsl.sh

# Keyboard layout
setxkbmap pl
#EOF
