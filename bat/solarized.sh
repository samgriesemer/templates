# Get theme
mkdir -p ~/.config/bat/themes
cd ~/.config/bat/themes
git clone https://github.com/braver/Solarized
cd ~/.config/bat/themes/Solarized
git checkout -b b1.6.0 1.6.0
cd ~/.config/bat/themes
ln -sf "Solarized/Solarized (dark).tmTheme" Default.tmTheme

# Get language definition files
mkdir -p ~/.config/bat/syntaxes
cd ~/.config/bat/syntaxes
git clone https://github.com/sublimehq/Packages/
rm -rf Packages/Markdown
git clone https://github.com/jonschlinkert/sublime-markdown-extended

# Clear and built cache
bat cache --clear
bat cache --build
