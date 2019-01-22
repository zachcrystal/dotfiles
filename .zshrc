export PATH=$HOME/bin:/usr/local/bin:$PATH
export VISUAL=nvim

source ~/.dotfiles/zsh/alias.zsh

# DISABLE_AUTO_TITLE=true

# Path to your oh-my-zsh installation.
export ZSH="/Users/Zach/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  autojump
  osx
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

PURE_PROMPT_SYMBOL=$
PURE_CMD_MAX_EXEC_TIME=200000000000

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --type f --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

fa() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fad() {
  DIR=`find * -maxdepth 0 -type d -print 2> /dev/null | fzf-tmux` \
    && cd "$DIR"
  }

# -- NVM -------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# -- bat -------------------------------------------------------------------
export BAT_THEME="OneHalfDark"
export TERM=xterm-256color-italic
