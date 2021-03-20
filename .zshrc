export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/nick/bin:$PATH"
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$(yarn global bin):$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl@1.1/lib/"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl@1.1/lib/pkgconfig"

alias ls="ls -GFh"
alias rm="trash"
alias code="nvim"
alias kitty="/Applications/Visual Studio Code.app"
alias dotfiles='/usr/bin/git --git-dir=/Users/nick/.dotfiles/ --work-tree=/Users/nick'

function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}

function set-title-preexec() {
  printf "\e]2;%s\a" "$1"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec

# asdf global version manager
. $(brew --prefix asdf)/asdf.sh
