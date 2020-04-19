""" REGULAR CONFIG """
set shell=/bin/bash
set mouse=nicr
set number
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set conceallevel=1

" text wrapping config
"set textwidth=90
"set colorcolumn=90
set wrap
set linebreak
set breakindent
filetype plugin indent on
autocmd BufRead,BufNewFile *.md,*.txt setlocal breakindentopt=shift:2
"set columns=90

colorscheme solarized
"colorscheme gruvbox

syntax enable
setlocal spell
set spelllang=en_us
autocmd BufRead,BufNewFile *.md setlocal spell

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
Plug 'plasticboy/vim-markdown'

"" VimWiki ""
Plug 'vimwiki/vimwiki', {'branch': 'dev'}

"" Taskwiki ""
Plug 'tbabej/taskwiki'

"" fzf ""
Plug '~/.fzf' "make sure fzf installed (along with ripgrep)
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
let g:vimtex_view_method='zathura'
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
let g:vim_markdown_auto_insert_bullets = 0

"" VimWiki config ""
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/Nextcloud/sitefiles/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'links_space_char': '-'}]
let g:vimwiki_global_ext = 0
"let g:vimwiki_folding='list'

"" Taskwiki config ""
let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_sort_order = 'status-,urgency-'


"" Transparent bg to match terminal, comes at end to ensure hi isn't overwritten
hi Normal guibg=NONE ctermbg=NONE

"" Custom commands ""
" enforce no arrows
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" redefine <Leader> to <space>
let mapleader = "\<Space>"
nmap <Leader>df :Df<CR>
nmap <Leader>dl :Dl<CR>
nmap <Leader>wf :Wf<CR>
nmap <Leader>wl :Wl<CR>
nmap <Leader>wb :Wb<CR>
nmap <Leader>wu :Wu<CR>

" Search current directory filenames + fzf preview
command! -bang -nargs=? -complete=dir Df
    \ call fzf#vim#files('.', fzf#vim#with_preview({'right':'50%'}, 'down:50%:wrap'), <bang>0)

" Search all lines in current directory files, first input is exact ripgrep match, then fzf preview
command! -bang -nargs=* Dl
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>).' .', 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --with-nth 4.. --nth 1.. -q '.shellescape(<q-args>),
    \                         'right': '50%'}, 'down:50%:wrap'), <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=default']}), <bang>0)

" NOTE: fzf#vim#preview() arguments
" First argument: {'options': <options_dict>, 'right/left/up/down': '<perc>%'}
" Second argument: 'right/left/up/down': <perc>% [for preview window location]

" Search wiki filenames + fzf preview
command! -bang -nargs=? -complete=dir Wf
    \ call fzf#vim#files('$HOME/Nextcloud/sitefiles/', fzf#vim#with_preview({'right':'50%'}, 'down:50%:wrap'), <bang>0)

" Search all lines in wiki files, first input is exact ripgrep match, then fzf preview
command! -bang -nargs=* Wl
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>).' $HOME/Nextcloud/sitefiles', 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --with-nth 4.. --nth 1.. -q '.shellescape(<q-args>),
    \                         'right': '50%'}, 'down:50%:wrap'), <bang>0)

" Find backlinks for current file using ripgrep on exact filename link regex
" after exact search, prefill fzf session with filename to highlight context
" (note that an additional space is added after prefill to allow immediate
" typing; without space matching becomes odd)
command! -bang -nargs=* Wb
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case ''\[[^\]]*\]\((.*/)*'.expand('%:t:r').'(#[^\)]*)*\)'' $HOME/Nextcloud/sitefiles', 1,
    \   fzf#vim#with_preview({'options': '-q '''.shellescape(expand('%:t:r')).' ''',
    \                         'right': '50%'}, 'down:50%:wrap'), <bang>0)

" Get fuzzy unlinked references related to current filename using ripgrep to
" get all lines. Following fzf session is prefilled with current filename
" (plus a space to allow typing immediately)
command! -bang -nargs=* Wu
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case ''.*'' $HOME/Nextcloud/sitefiles', 1,
    \   fzf#vim#with_preview({'options': '-q '''.shellescape(expand('%:t:r')).' '' --delimiter : --with-nth 4.. --nth 1..',
    \                         'right': '50%'}, 'down'), <bang>0)

" EXPERIMENTAL COMMANDS (commands under development)

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'cd $HOME/Nextcloud/sitefiles && rg -n --color always ^',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'right': 40,
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" Process file name appropriately (e.g. remove spaces, periods, etc)
function! s:process_filename(name)
    let filename = a:name

    " replace spaces with dashes
    let filename = substitute(filename,' ','-','g')

    " replace periods with underscores
    let filename = substitute(filename,'\.','_','g')

    return filename
endfunction

" Autocomplete links (fills dashes with spaces, underscores with dots) Can be
" 1) no path, just filename. Returned string will remain local
" 2) subsystem path relative to the system root e.g. 'wiki/name.md' or 'feed/name.md'
"    In this case returned path will be relative to current file
function! s:wrap_link(lines)
    " back to insert mode
    call feedkeys('i')

    " parse file name, processing it using wrap_link
    " (if new, otherwise name should remain unchanged)
    let file = join(a:lines)
    let path = matchstr(file,'.*/')
    let newpath = ""

    if !empty(path)
        let pathcmd = "realpath --relative-to ".expand('%:p:h')." $HOME/Nextcloud/sitefiles/".path
        let newpath = system(pathcmd)."/"
        let newpath = substitute(newpath,'\n','','g')

        " handle absolute wiki file path for local directories
        if newpath == "./"
            let newpath = ""
        endif
    endif

    let filename = substitute(file,'.*/','','')
    let filename = substitute(filename,'\.md','','')
    let filename = s:process_filename(filename)
    let file = newpath.filename

    " replace underscores with periods
    let display = substitute(filename,'_','.','g')

    " replace dashes with spaces
    let display = substitute(display,'-',' ','g')

    " return final concatenation
    return '['.display.']('.file.') '
endfunction

inoremap <expr> [[ fzf#vim#complete(fzf#wrap({
    \ 'source': 'find $HOME/Nextcloud/sitefiles -exec realpath --relative-to $HOME/Nextcloud/sitefiles \{\} \;',
    \ 'reducer': function('<sid>wrap_link'),
    \ 'options': '--bind=ctrl-d:print-query --multi --reverse --margin 15%,0',
    \ 'right':    40}))

" metadata template for all new files
au BufNewFile $HOME/Nextcloud/sitefiles/*.md :silent 0r !$HOME/Nextcloud/vwbin/vwbash '%'

" modified time update on file save
" :autocmd BufWritePost /path/to/file/or/pattern !command <afile>

