if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Activate virtual environment if it exists
if [[ -f venv/bin/activate ]]; then
  source venv/bin/activate
elif [[ -f .venv/bin/activate ]]; then
  source .venv/bin/activate
fi


# Activate virtual environment when changing directories
function cd() {
  builtin cd $1

  if [[ -f venv/bin/activate ]]; then
    source venv/bin/activate
  elif [[ -f .venv/bin/activate ]]; then
    source .venv/bin/activate
  fi
}

# ZSH Path
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Automatic Updates
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Command completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Aliases
alias ssh="ssh -l user server.com"

alias activ="source venv/bin/activate"
alias rpy="python manage.py runserver"
alias ll="eza -lag"
alias lg="lazygit"

. "$HOME/.local/bin/env"
