START="%{$fg_bold[magenta]%}╭─"
STOP="%{$fg_bold[magenta]%}╰─▪"

local user_host='%{$fg_bold[cyan]%}%n%'

local AT='%{$fg[red]%}@'
local PC='%{$fg_bold[magenta]%}%m:'
local PWD='%{$fg_bold[blue]%}[%0~$(git_prompt_info)]'
local RSC='%{$reset_color%}'


PROMPT="╭─${user_host} ${AT} ${PC} ${PWD} 
${STOP} ${RSC}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%} ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$fg[blue]%}"

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

