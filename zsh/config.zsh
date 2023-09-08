# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

## Config
PATH="$HOME/brew/bin:$HOME/.cargo/bin:$HOME/bin:$PATH"
export REPOFE_ROOT=$HOME/repo # default
export REPOFE_OWNER=mizchi
export REPOFE_OWNER_ROOT=$HOME/mizchi

alias la="eza -a --git -g -h --oneline"
alias ls="eza"
ISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt auto_pushd
setopt auto_cd
autoload -Uz compinit
compinit

## eval
eval "$(sheldon source)"
eval "$(starship init zsh)"
source $HOME/.nvm/nvm.sh

## fzf
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ======== Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"


# bun completions
[ -s "/Users/kotaro.chikuba/.bun/_bun" ] && source "/Users/kotaro.chikuba/.bun/_bun"
