if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end


set -gx EDITOR nvim

. ~/.config/fish/aliases.fish
. ~/.config/fish/functions.fish


set SPACEFISH_PROMPT_ORDER dir docker aws pyenv exit_code char
set SPACEFISH_RPROMPT_ORDER git time 

set SPACEFISH_CHAR_SYMBOL '»'

set SPACEFISH_PROMPT_ADD_NEWLINE 'false'
set SPACEFISH_PROMPT_SEPARATE_LINE 'false'
set SPACEFISH_PROMPT_PREFIX ''

set SPACEFISH_TIME_SHOW 'true'
set SPACEFISH_TIME_PREFIX ''
set SPACEFISH_TIME_12HR 'true'

set SPACEFISH_USER_SHOW 'false'

set SPACEFISH_DIR_TRUNC '4'
set SPACEFISH_TRUNC_REPO 'true'

set SPACEFISH_GIT_PREFIX ' '
set SPACEFISH_GIT_STATUS '· '
set SPACEFISH_GIT_STATUS ''


set SPACESHIP_NODE_SHOW 'false'
set SPACESHIP_JULIA_SHOW 'false'
set SPACESHIP_RUBY_SHOW 'false'
set SPACESHIP_HASKELL_SHOW 'false'
set SPACESHIP_CONDA_SHOW 'false'
set SPACESHIP_GOLANG_SHOW 'false'
set SPACESHIP_PHP_SHOW 'false'
set SPACESHIP_RUST_SHOW 'false'
set SPACESHIP_DOTNET_SHOW 'false'
set SPACESHIP_KUBERCONTEXT_SHOW 'false'
set SPACESHIP_BATTERY_SHOW 'false'
set SPACESHIP_EXEC_TIME_SHOW 'false'
