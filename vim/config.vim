set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set background=dark
set number
set nowrap

"logical lines
nnoremap j gj
nnoremap k gk

syntax on
hi Special ctermfg=red "for query specific keywords
hi Underlined ctermfg=magenta cterm=bold "for local variables
set tags=tags

set path+=**
set wildmenu

set wildignore+=*/node_modules/*,*/dist/*,*/build/*,*/.git/* "ignore for :e and ctrlp

" Ctrl-p gives fuzzy find
set runtimepath^=~/.config/vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' "try project root, but fall back to cwd
let g:ctrlp_custom_ignore = {
    \'dir': '\v[\/](node_modules|\.git|dist|build|target)$',
    \'file': '\v\.(exe|dll|so|pyc|class|o)$'
    \ } "ignore these directories and files when performing fuzzy search

" ctrl-hjkl will jump between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"shift arrow keys will resize splits
nnoremap <S-Up>    :resize +2<CR>
nnoremap <S-Down>  :resize -2<CR>
nnoremap <S-Left>  :vertical resize -2<CR>
nnoremap <S-Right> :vertical resize +2<CR>
