## GAMES ##
if [ -x /usr/games/cowsay -a -x /usr/games/fortune -a -x /usr/games/lolcat ]; then
  fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1) | lolcat
fi

## KEYS ##
bindkey -v
bindkey "^[OA" up-line-or-search
bindkey "^[OB" down-line-or-search
