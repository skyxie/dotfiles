function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"

PS1="$RED\$(date +%H:%M:%S)$BLUE|$LIGHT_RED\$(uname)$BLUE|$LIGHT_GREEN\w$BLUE|$GREEN\$(parse_git_branch)$BLUE\$$WHITE "
PS2='> '
PS4='+ '
}

proml

# Set langauge just in case
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export RACK_ENV=development
export RAILS_ENV=development
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/lib:/usr/local/opt/libpng/lib/pkgconfig/:/usr/local/opt/freetype/lib/pkgconfig/:/usr/local/opt/fontconfig/lib/pkgconfig/:/usr/local/opt/libxml2/lib/pkgconfig:/usr/local/opt/libiconv/lib/pkgconfig"
export NODE_PATH="/usr/local/lib/node"

alias h=history
alias c=clear
alias be='bundle exec'
alias la='ls -al'
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias less='less -R'
alias grep='grep --color=auto --exclude-dir=.git --exclude-dir=log --exclude-dir=vendor'
alias ag='ag --ignore-dir=.git --ignore-dir=log --ignore-dir=vendor --ignore-dir=build --ignore-dir=dist --ignore-dir=node_modules'
alias db='mysql --host=localhost --port=3306 --user=root'
alias gulp='./node_modules/gulp/bin/gulp.js'
alias cd='pushd'
alias subl='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'

# Copy popular Mac OSX utilities pbcopy and pbpaste to Linux
if hash xclip >& /dev/null && [[ $(uname) =~ ^Linux ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

if hash rbenv >& /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if hash go >& /dev/null; then
  export GOROOT="/usr/local/opt/go/libexec"
  export GOPATH="$HOME/dev/go_path"

  # Go install path from brew
  export PATH="$GOROOT/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/opt/local/lib:$PATH"
  export PATH="$HOME/dev/go_appengine:$PATH"
fi

# Add directory for custom executables to PATH
export PATH="$HOME/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# added by Anaconda3 4.4.0 installer
export PATH="/anaconda/bin:$PATH"

if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

