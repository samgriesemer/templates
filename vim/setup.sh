# move .vimrc
cp .vimrc ~/

# install Plug plugin manager 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# install default plugins
vim +PlugInstall +qall

# install color themes into vim colors
mkdir -p ~/.vim/colors/
cp ~/.vim/plugged/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
cp ~/.vim/plugged/gruvbox/colors/gruvbox.vim ~/.vim/colors/

# move Gilles TeX snippets to proper location
cp ~/.vim/plugged/latex-snippets/tex.snippets tex.snippets ~/.vim/plugged/vim-snippets/UltiSnips/
