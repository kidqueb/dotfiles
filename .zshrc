export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
. $(brew --prefix asdf)/asdf.sh

export PATH="/usr/local/sbin:$PATH"
export PATH="$(yarn global bin):$PATH"

alias dotfiles='/usr/bin/git --git-dir=/Users/nick/.dotfiles/ --work-tree=/Users/nick'
alias mkdir='mkdir -pv'
