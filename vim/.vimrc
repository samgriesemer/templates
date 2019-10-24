""" REGULAR CONFIG """
set shell=/bin/bash
set mouse=nicr
set number
set background=dark
set conceallevel=1
syntax enable
colorscheme solarized
setlocal spell
set spelllang=en_us

""" PLUG PACKAGE MANAGER """
" begin plugin list
call plug#begin('~/.vim/plugged')

"" UltiSnips engine and snippets ""
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"" VimTeX ""
Plug 'lervag/vimtex'

"" TeX-conceal ""
Plug 'KeitaNakamura/tex-conceal.vim'

" end plugin list, initialize system
call plug#end()

""" PACKAGE CONFIG """
"" UltiSnips configuration ""
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

"" VimTex configuration ""
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0

"" TeX-conceal configuration ""
let g:tex_conceal='abdmg'
