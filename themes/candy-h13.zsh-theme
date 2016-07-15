function user_and_host() {
  local COLOR
  if [ -z $SSH_CONNECTION ]; then
    COLOR="green"
  else
    COLOR="red"
  fi
  echo "%{$fg_bold[$COLOR]%}%n@%m"
}

function screen_name() {
  if [ ! -z $STY ]; then
    echo "%{$reset_color%}%{$FG[005]%}[$STY]%{$reset_color%} "
  fi
}

PROMPT=$'$(user_and_host) %{$fg[blue]%}%D{[%H:%M:%S]} $(screen_name)\%{$reset_color%}%{$fg[yellow]%}[%~]%{$reset_color%} $(git_prompt_info)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
