# vim:ft=zsh ts=2 sw=2 sts=2
#
# A good example of theme file is agnoster
# My ideal prompt would be one that shows only relevant information, and is made to be used with tmux and vi as permanent companions
# The things that it should show are
# - shows the current directory (#directory)
# - displays the current branch (#git) [kolo muse juaghurtado]
# - displays the current gemset (#rvm) [alanpeabody nebirhos]
# - displays the last command status code (#status)
# - displays the user (#user)
# - displays the current zle mode (#zle_mode) [pygmalion]
# - uses segments bar as in my airline theme (#segments) [agnoster powerline blinks]
# - uses the RPROMPT to show aditional information (?)
# - uses a two line format, with a single caracter arrow (#arrow) [avit bira]

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

function segment {
  local _bg _fg
  [[ -n $1 ]] && _bg="%K{$1}" || _bg="%k"
  [[ -n $2 ]] && _fg="%F{$2}" || _fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$_bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

## #directory
# displays the current folder
# args: 0
function directory {
    echo -n '%~'
}

# #user
# displays the current user
# args: 0
function username {
    echo -n '%n'
}

# #git_info
# configures zsh's git caracters and echo -n's the git format order
function git_info {
    ZSH_THEME_GIT_PROMPT_PREFIX="["
    ZSH_THEME_GIT_PROMPT_SUFFIX="]"

    # Use git simple format colors
    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}A"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}M"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}D"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[green]%}R"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}UU"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}??"

    echo -n "$(git_prompt_info) $(git_prompt_status)"
}

#LINENUMBERS=blinks
#PERCENTAGE=candy-kingom
#EXIT_STATUS=mortalscumbag sunrise jnrowe jreese flazz
#LINE_END_TEXT=sporty_256 sorin smt

# #arrow
# display the command arrow
function arrow {
     echo -n "%(?.%{$fg[cyan]%}.%{$fg[orange]%})>%{$reset_color%}"
}

function build_prompt {
    segment 010 060
    username
    echo -n "@"
    directory
    git_info
    echo -n "\n"
    arrow
}
#PROMPT=$'%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%I:%M:%S]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)\ %{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '

#PROMPT="%B${username}%b%{$reset_color%} at ${hostname} in ${folder}${git}%{$reset_color%} ${arrow}%{$reset_color%}"


PROMPT='$(build_prompt) '

