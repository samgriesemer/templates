# Vim Setup
This folder is dedicated to a fast and easy Vim config. Steps to get everything up and running:

1. `cd` into this folder. The setup script makes references to local files.
2. Execute `bash setup.sh`. This will set basic settings like a Solarized color scheme, line numbers, spell checking, etc. It will also install the Vim Plug package manager. Finally, it takes care of moving the `.vimrc` itself into your home directory as well as other files necessary for setup (e.g. color scheme, snippet files).
3. Open Vim, and run `:PlugInstall` to install the default packages found in `.vimrc` with Plug. 

Additionally, my personal setup maps Caps-Lock -> Esc key for easier switching between Vim modes. This setup may vary across systems.

## VimPlug Usage
- Plugins can installed within Vim using `:PlugInstall`
- Plugins can be updated within Vim using `:PlugUpdate`

## MacVim
If on Mac and you would like the conceal feature (along with yanking to clipboard!), install MacVim via Homebrew `brew install macvim`. To replace normal Vim with MacVim, run `alias vim='/usr/local/Cellar/macvim/8.1-159/MacVim.app/Contents/bin/mvim -v'` (make sure `zsh` is also updated).
