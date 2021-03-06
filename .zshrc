source /usr/share/zsh/share/antigen.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH=/home/marco/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

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
# plugins=(
#     git archlinux bgnotify colored-man-pages command-not-found
#     docker docker-compose jira npm python pip tmux vi-mode
#     virtualenv virtualenvwrapper web-search fasd thefuck
#     zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting)

antigen use oh-my-zsh
antigen bundle git
antigen bundle archlinux
antigen bundle bgnotify
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle docker
antigen bundle docker-compose
antigen bundle jira
antigen bundle npm
antigen bundle python
antigen bundle pip
antigen bundle tmux
antigen bundle nmap
antigen bundle vi-mode
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle web-search
antigen bundle fasd
antigen bundle thefuck
antigen bundle zsh-navigation-tools
antigen bundle mvoelske/jrnl-zsh-completion
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle hchbaw/zce.zsh
antigen theme caiogondim/bullet-train.zsh
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# source $ZSH/oh-my-zsh.sh

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

if [[ "$RPS1" != *'$(vi_mode_prompt_info)'* ]]; then
	if [[ "$RPS1" != ' '* ]]; then
		RPS1=' '$RPS1
	fi
	RPS1='$(vi_mode_prompt_info)'$RPS1
fi

if [[ "$RPS1" != *' ' ]]; then
	RPS1=$RPS1' '
fi
RPS1=$RPS1'[%j]'

export LESSOPEN="|/usr/bin/lesspipe.sh %s"

# export JIRA_URL='https://bpusea.atlassian.net/'
# export JIRA_NAME='Marco.KH.Wong'
# export JIRA_PREFIX='RS-';

BULLETTRAIN_PROMPT_ORDER=(time status context dir virtualenv git cmd_exec_time)
BULLETTRAIN_TIME_12HR=true
BULLETTRAIN_STATUS_EXIT_SHOW=true

setopt AUTO_PUSHD

bindkey "^R" history-incremental-search-backward
bindkey "^T" znt-history-widget
zle -N znt-cd-widget
bindkey "^B" znt-cd-widget
zle -N znt-kill-widget
bindkey "^Y" znt-kill-widget

bindkey -M viins "jk" vi-cmd-mode

ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey -M viins "^ " forward-word

bindkey -M vicmd "s" zce
zstyle ':zce:*' keys 'sadfjklewcmpgh'

alias fuck='$(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
