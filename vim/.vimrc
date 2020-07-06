""""""""""""""""""
" REGULAR CONFIG "
""""""""""""""""""
set shell=/bin/bash
set mouse=nicr
set number
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set conceallevel=2
set timeoutlen=600
set ttimeoutlen=50

" text wrapping config
set wrap
set linebreak
set showbreak=..
set breakindent

set autoindent
set textwidth=90
set display+=lastline
filetype plugin indent off

colorscheme solarized
"au BufEnter *.md colorscheme mdsolarized
"colorscheme gruvbox

syntax enable
set spell
set spelllang=en_us

" fix spelling error highlights
"augroup spell_colors
  "autocmd!
  "autocmd ColorScheme solarized hi SpellBad cterm=underline
"augroup END

""""""""""""""""""""""""
" PLUG PACKAGE MANAGER "
""""""""""""""""""""""""
" begin plugin list
call plug#begin('~/.vim/plugged')

"" UltiSnips engine and snippets ""
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"" VimTeX ""
Plug 'lervag/vimtex'

"" Extra TeX snips ""
Plug 'gillescastel/latex-snippets'

"" TeX-conceal ""
Plug 'KeitaNakamura/tex-conceal.vim', {'for': ['tex','md']}

"" NERDTree ""
Plug 'scrooloose/nerdtree'

"" Airline ""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Solarize color scheme ""
Plug 'altercation/vim-colors-solarized'

"" GruvBox color scheme ""
Plug 'morhetz/gruvbox'

"" Markdown ""
Plug 'godlygeek/tabular'
Plug 'samgriesemer/vim-markdown'

"" Lists ""
Plug 'dkarter/bullets.vim'

"" Wiki ""
"Plug 'lervag/wiki.vim'
Plug 'samgriesemer/vim-roam'

"" Vim-taskwarrior ""
Plug 'blindFS/vim-taskwarrior'

"" Taskwiki ""
Plug 'samgriesemer/taskwiki'

"" fzf ""
Plug '~/.fzf' "make sure fzf installed (along with ripgrep)
Plug 'junegunn/fzf.vim'

" end plugin list, initialize system
call plug#end()

""""""""""""""""""
" PACKAGE CONFIG "
""""""""""""""""""
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

"" Vim-markdown plugin config ""
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

"" Base markdown settings (tpope) ""
let g:markdown_folding=1

"" Wiki ""
let g:wiki_root = '~/Nextcloud/sitefiles'
"let g:wiki_root = '~/Documents/notes'
"let g:wiki_link_target_type = 'md'
"let g:wiki_link_extension = 'md'
let g:wiki_filetypes = ['md']
let g:wiki_write_on_follow = 1
let g:wiki_map_create_page = 'StringToFname'
"let g:wiki_map_link_create  = 'FnameToString'
let g:wiki_mappings_local = {
    \ '<plug>(wiki-graph-find-backlinks)' : '<Leader>wlb',
    \ '<plug>(wiki-link-toggle)' : '<Leader>wlt',
    \ '<plug>(wiki-page-toc)' : '<Leader>wpt'
    \ }

"" Taskwiki config ""
let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_sort_order = 'status-,urgency-'
let g:taskwiki_dont_preserve_folds = 1

""""""""""""""""""""""
" POST PLUGIN CONFIG "
""""""""""""""""""""""
" Markdown indentation
au BufRead,BufNewFile *.md filetype indent off
au BufRead,BufNewFile *.md setlocal spell
au FileType markdown setlocal foldlevel=99

" Transparent bg to match terminal, comes at end to ensure hi isn't overwritten
hi Normal guibg=NONE ctermbg=NONE

" Italic comments
highlight Comment cterm=italic

" redefine <Leader> to <space>
let mapleader = "\<Space>"

"""""""""""""""""""
" CUSTOM MAPPINGS "
"""""""""""""""""""
" enforce no arrows
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" general search
nmap <Leader>df :DirFzfFiles<CR>
nmap <Leader>dl :DirFzfLines<CR>

" wiki search
nmap <Leader>wf :WikiFzfFiles<CR>
nmap <Leader>wl :WikiFzfLines<CR>
"nmap <Leader>wb :WikiFzfBacklinks<CR>
nmap <Leader>wb :BacklinkBuffer<CR>
nmap <Leader>wu :WikiFzfUnlinks<CR>

" wiki link completion defined in after/.../links.vim due to issues

" wiki in-page TOC search
nmap <Leader>wt :WikiFzfToc<CR>

" wiki create file
nmap <Leader>we :WikiCreateFile<CR>

" tabular formatted tables
inoremap <silent> <Bar>   <Bar><Esc>:call TableAlign()<CR>a

