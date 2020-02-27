# Installation
Run the following

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

and restart the shell. `fzf` will be installed.

## For Vim
Simply add the following two lines to allow Vim to use certain built-in commands for searching lines, files, etc with `fzf`:

```
Plug '~/.fzf' "use existing installation
Plug 'junegunn/fzf.vim'
```
