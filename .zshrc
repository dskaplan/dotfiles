source ~/.aliases

# zplug init
source ~/.zplug/init.zsh

# zplug plugins
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/wd", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "lib/spectrum.zsh", from:oh-my-zsh, as:command
zplug "zdharma/fast-syntax-highlighting"
zplug "chrissicool/zsh-256color"
zplug "mafredri/zsh-async"
# zplug "~/.zsh_config/dk", from:local, as:theme
# zplug "agkozak/agkozak-zsh-theme"
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load 

export PATH="/usr/local/sbin:/home/david/bin:$PATH"
export PATH="/home/david/.local/bin:$PATH"

export EDITOR='nvim'

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi


#source ~/.xinitrc
#
# SPACESHIP!
# 
#
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  rust          # Rust section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  time          # Time stampts section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  jobs
)
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false

SPACESHIP_TIME_SHOW=true

SPACESHIP_TIME_FORMAT="%T"
SPACESHIP_TIME_12HR=true
SPACESHIP_TIME_PREFIX=""
SPACESHIP_TIME_SUFFIX=" "
SPACESHIP_USER_SHOW=false
SPACESHIP_HOST_SHOW=false

SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_GIT_PREFIX="| "
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""


SPACESHIP_HG_STATUS_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_XCODE_SHOW_GLOBAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_GLOBAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_HASKELL_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false


SPACESHIP_BATTERY_SHOW=false



