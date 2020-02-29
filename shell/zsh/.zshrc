## GAMES ##
if [ -x /usr/games/cowsay -a -x /usr/games/fortune -a -x /usr/games/lolcat ]; then
  fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1) | lolcat
fi

## VIM KEYS ##
bindkey -v
bindkey "^[OA" up-line-or-search
bindkey "^[OB" down-line-or-search

## TIMEWARRIOR ##
export TIMEWARRIORDB=$HOME/Nextcloud/.timewarrior

## fzf ##
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="
--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235
"

## BAT ##
export BAT_THEME='ansi-dark'

## FIX GLOB ##
unsetopt nomatch
