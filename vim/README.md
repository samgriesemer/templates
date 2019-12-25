# Vim Setup
This folder is dedicated to a fast and easy Vim config for my personal settings. Steps to get everything up and running:

1. `cd` into this folder. The setup script makes references to local files.
2. Execute `bash setup.sh`. This will take care of a few basic things automatically, such as moving the `.vimrc` into your home directory, installing the Plug package manager and default plugins, moving installed color scheme files to the vim colors folder, and setting up additional snippets.

And that's it! From here you can customize plugins, color schemes, etc to your liking in your `.vimrc`. The packages and color schemes that are installed by default are listed below.

## Default Packages
* [UltiSnips](https://github.com/SirVer/ultisnips) (vim snippet engine)
* [vim-snippets](https://github.com/honza/vim-snippets) (snippet library)
* [vimtex](https://github.com/lervag/vimtex) (basic TeX support)
* [vim-latex-live](https://github.com/xuhdev/vim-latex-live-preview) (live LaTeX preview)
* [tex-conceal](https://github.com/KeitaNakamura/tex-conceal.vim) (adds support vim conceal for TeX)
* [latex-snippets](https://github.com/gillescastel/latex-snippets) (additional TeX snippets)
* [NERDTree](https://github.com/scrooloose/nerdtree) (file system explorer)
* [Airline](https://github.com/vim-airline/vim-airline) (light statusline)

## Default Color Schemes
* [Solarized](https://github.com/altercation/vim-colors-solarized)
* [GruvBox](https://github.com/morhetz/gruvbox)

## Additional Notes
### Basic VimPlug Usage
- Plugins can installed within Vim using `:PlugInstall`
- Plugins can be updated within Vim using `:PlugUpdate`

### MacVim
If on Mac and you would like support for vim's conceal feature (along with yanking to clipboard!), install MacVim via Homebrew `brew install macvim`. To replace the system default Vim with MacVim, run `alias vim='/usr/local/Cellar/macvim/8.1-159/MacVim.app/Contents/bin/mvim -v'` to use MacVim when using the `vim` command. If using `zsh`, the shell must first be updated (i.e. `brew upgrade zsh`).
