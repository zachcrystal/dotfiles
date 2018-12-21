export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/Zach/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  autojump
  osx
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

PURE_PROMPT_SYMBOL=$
PURE_CMD_MAX_EXEC_TIME=200000000000

alias zshconfig="vim ~/.zshrc"
alias reload="source ~/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

