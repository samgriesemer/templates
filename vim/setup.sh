# move .vimrc
cp .vimrc ~/

# install solarized
mkdir -p ~/.vim/colors/
cp solarized.vim ~/.vim/colors/

# install plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# install default plugins
vim +PlugInstall +qall

# add Gilles snippets
cp tex.snippets ~/.vim/plugged/vim-snippets/UltiSnips/
