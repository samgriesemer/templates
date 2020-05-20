"
" search.vim: search methods and commands for general purpose use
"
" Author: Sam Griesemer
"
" NOTE: fzf#vim#preview() arguments
" - First argument: {'options': <options_dict>, 'right/left/up/down': '<perc>%'}
" - Second argument: 'right/left/up/down': <perc>% [for preview window location]
"

" define useful base values
let rg_base = 'rg --column --line-number --no-heading --color=always --smart-case'

" general fzf search with preview
function FzfGrepPreview(cmd, pat, loc, qry, bng)
    call fzf#vim#grep(a:cmd.' '.a:pat.' '.a:loc, 1,
    \   fzf#vim#with_preview({
    \       'options': [
    \           '--delimiter=:',
    \           '--with-nth=4..',
    \           '--nth=1..',
    \           '--query='.a:qry,
    \       ],
    \       'right': '50%'
    \   }, 'down:50%:wrap'), a:bng)
endfunction

" DirFzfFiles - search current directory wiki filenames and go to file
command! -bang -nargs=? -complete=dir DirFzfFiles
    \ call fzf#vim#files('.', fzf#vim#with_preview({'right':'50%'}, 'down:50%:wrap'), <bang>0)

" DirFzfLines - search lines in all files located in the current directory
" (recursive) and go to file. Following FZF session has a prefilled query
" using the first argument, which is a string used for the initial ripgrep
" exact search.
command! -bang -nargs=* DirFzfLines
    \ call FzfGrepPreview(rg_base, shellescape(<q-args>), '.', <q-args>, <bang>0)

