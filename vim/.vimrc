""" REGULAR CONFIG """
set shell=/bin/bash
set mouse=nicr
set number
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set conceallevel=1
"set colorcolumn=80

colorscheme solarized
"colorscheme gruvbox
"
syntax enable
setlocal spell
set spelllang=en_us

" fix spelling error highlights
augroup spell_colors
  autocmd!
  autocmd ColorScheme solarized hi SpellBad cterm=underline
augroup END

""" PLUG PACKAGE MANAGER """
" begin plugin list
call plug#begin('~/.vim/plugged')

"" UltiSnips engine and snippets ""
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"" VimTeX ""
Plug 'lervag/vimtex'

"" TeX-conceal ""
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

"" Extra TeX snips ""
Plug 'gillescastel/latex-snippets'

"" NERDTree "" Plug 'scrooloose/nerdtree' "" Airline ""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Solarize color scheme ""
Plug 'altercation/vim-colors-solarized'

"" GruvBox color scheme ""
Plug 'morhetz/gruvbox'

"" Markdown ""
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"" VimWiki ""
Plug 'vimwiki/vimwiki', {'branch': 'dev'}

"" Taskwiki ""
Plug 'tbabej/taskwiki'

"" fzf ""
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

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

"" NERDTree config ""
let NERDTreeMinimalUI=1

"" Markdown formatting ""
highlight Comment cterm=italic

"" Vim-markdown plugin config ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal = 1
let g:vim_markdown_folding_disabled = 1

"" VimWiki config ""
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/Nextcloud/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'links_space_char': '-'}]
let g:vimwiki_global_ext = 0

"" Taskwiki config ""
let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_sort_order = 'urgency-'

"" Transparent bg to match terminal, comes at end to ensure hi isn't overwritten
hi Normal guibg=NONE ctermbg=NONE

"" Custom commands ""

" search wiki files + fzf preview
command! -bang -nargs=? -complete=dir Wf
    \ call fzf#vim#files('$HOME/Nextcloud/vimwiki/', fzf#vim#with_preview(), <bang>0)

" search all lines in wiki files, first input is exact rg then fzf preview
command! -bang -nargs=* Wl
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>).' $HOME/Nextcloud/vimwiki', 1,
    \   fzf#vim#with_preview({'options':'--delimiter : --with-nth 4.. --nth 1..'}), <bang>0)

" find backlinks for current file 
command! -bang -nargs=* Wb
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case ''\[[^\]]*\]\([\./\\]*'.expand('%:t:r').'(#[^\)]*)*\)'' $HOME/Nextcloud/vimwiki', 1,
    \ fzf#vim#with_preview(), <bang>0)

" Get fuzzy unlinked references related to current filename 
" Uses :Wl with empty rg query followed by live fzf session
" on wiki page lines
command! -bang -nargs=* Wu
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case ''.*'' $HOME/Nextcloud/vimwiki', 1,
    \   fzf#vim#with_preview({'options':'-q '.shellescape(expand('%:t:r')).' --delimiter : --with-nth 4.. --nth 1..'}), <bang>0)
