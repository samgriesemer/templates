# the idea of this theme is to contain a lot of info in a small string, by
# compressing some parts and colorcoding, which bring useful visual cues,
# while limiting the amount of colors and such to keep it easy on the eyes.
# When a command exited >0, the timestamp will be in red and the exit code
# will be on the right edge.
# The exit code visual cues will only display once.
# (i.e. they will be reset, even if you hit enter a few times on empty command prompts)

typeset -A host_repr

# translate hostnames into shortened, colorcoded strings
host_repr=('cloud-smgr' "%Bcloud%b" 'smgr-ubuntu' "%Bhome%b" "smgr-mbp" "%Bmbp%b")

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%D{%H:%M}%{$reset_color%}"
time_disabled="%{$fg[green]%}%D{%H:%M}%{$reset_color%}"
time=$time_enabled

# user part, color coded by privileges
local user="%(!.%{$fg[blue]%}.%{$fg[cyan]%})%n%{$reset_color%}"

# Hostname part.  compressed and colorcoded per host_repr array
# if not found, regular hostname in default color
local host="@${host_repr[$HOST]:-$HOST}%{$reset_color%}"

# Compacted $PWD
local pwd="%{$fg[blue]%}%30<...<%~%<<%{$reset_color%}"

PROMPT='[${time}][${user}${host}][${pwd}]%(!.#.$) '

# i would prefer 1 icon that shows the "most drastic" deviation from HEAD,
# but lets see how this works out
ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}] "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}%{$fg[red]%}*%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}-%?-%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code} $(git_prompt_info)'

function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		time=$time_disabled
		return_code=$return_code_disabled
	else
		time=$time_enabled
		return_code=$return_code_enabled
	fi
	zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
