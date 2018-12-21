source ~/.bashrc

# Aliases
alias ls="ls -G"
alias ll="ls -l"
alias la="ls -A"
alias l="ls -CF"
alias npml="npm list -g --depth=0"
alias npmo="npm outdated -g --depth=0"
alias gpom="git push origin master"
alias gs="git status"
alias reload="source ~/.bash_profile"

export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"    

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# Ignore duplicates in command history
export HISTCONTROL=ignoredups

# GIT_PROMPT_ONLY_IN_REPO=1

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi 

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

export BAT_THEME="OneHalfDark"
