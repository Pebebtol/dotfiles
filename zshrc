# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/pibebtol/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="wedisagree"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux rand-quote extract)

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

PATH=$PATH:$HOME/.cargo/bin

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias emzsh="emacs ~/.zshrc &"
alias ohmyzsh="emacs ~/.oh-my-zsh &"
alias emvim="emacs ~/.gvimrc &"
alias emranger="emacs ~/.config/ranger/rc.conf &"
alias pacs="sudo pacman"
alias updt="sudo pacman -Sc && yaourt -Syua"
#alias susp='systemctl suspend && i3lock -c 000000 --ringcolor ffffff33 --insidevercolor 00000000 --insidewrongcolor 00000000 --linecolor ffffffbb --insidecolor 00000000'
alias susp='systemctl suspend && slock'
alias resint='sudo systemctl restart NetworkManager'
alias shutint='sudo systemctl stop NetworkManager'
alias shut="shutdown now"
alias fuck='sudo $(fc -ln -1)'
alias torg='telnet www.ateraan.com 4002'
alias wat='cat ~/mic'
alias emi3='emacs ~/.config/i3/config &'
alias emi3bar='emacs ~/.config/polybar/config &'
alias emmic='emacs ~/mic &'
alias emvimp='emacs ~/.vimperatorrc &'
alias psaux='ps -aux'
alias gnu='gtypist'
alias todo='todo2'
alias td='todo2'
alias tda='todo2 -a'
alias tdA='todo2 -A'
alias tdd='todo2 -d'
alias tdr='todo2 --reparent'
alias emtd='emacs ~/.todo2 &'
alias gnuneo='gtypist ktde_neo.typ'
alias g='googler'
alias gstall='git status -uall'
alias pstp='ps -Ao user,uid,comm,pid,pcpu --sort=-pcpu | head -n 6'
alias prism='bash ~/workspace/prism-4.4.beta-linux64/bin/xprism &'
function mkcd() {
    if [ -n "$1" ]
    then
        mkdir $1
	cd $1
    else
        echo fu
    fi
}


function fh() {
   command=$(fc -ln 0|               # show history without line numbers
     awk '!x[$0]++'  |               # drop duplicates (https://unix.stackexchange.com/a/193331)
     fzf -e +s \
         --tac \
         --color=light \
         --height=20 \
         --inline-info \
         --border \
         --prompt="Search history "  # fuzzy find with exact match, no sorting and custom style
   				     # tac to reverse the order
   )

   if [[ !  -z  $param  ]]; then
     BUFFER=$BUFFER
     zle redisplay     # redisplay the current command prompt line
   else
     # See http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Widgets
     # for more details on this
     BUFFER=$command   # replace the buffer of the command prompt with our command
     zle redisplay     # redisplay the current command prompt line
#     zle accept-line   # accept the current line in buffer a.k.a "press enter" - Comment out to edit the line
   fi
 }

 zle -N fh           # Run my as a zsh widget / line editor thing
 bindkey "\C-r" fh   # Bind our function to ctrl-r
