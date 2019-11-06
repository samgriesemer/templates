# move .vimrc
cp .vimrc ~/

# install plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# install default plugins
vim +PlugInstall +qall

# install color themes
mkdir -p ~/.vim/colors/
cp ~/.vim/plugged/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
cp ~/.vim/plugged/gruvbox/colors/gruvbox.vim ~/.vim/colors/

# add Gilles snippets
cp tex.snippets ~/.vim/plugged/vim-snippets/UltiSnips/
