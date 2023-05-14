call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'HelifeWasTaken/VimTek'
Plug 'HelifeWasTaken/VimUtils'
Plug 'x4m3/vim-epitech'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
set nu rnu
syntax on

inoremap jj <ESC>
inoremap kk <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

let mapleader = " "


nnoremap <leader>u :UndotreeShow<CR><bar>:wincmd h<CR>

if has('persistent_undo')
    silent !mkdir ~/.vim/undodir > /dev/null 2>&1
    set undodir=$HOME/.vim/undodir
    set undolevels=5000
    set undofile
endif

nnoremap <leader>ai magg=G`a
set nobackup
set noswapfile
set nocompatible
set showmatch
set ignorecase
set mouse=v
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set cc=80
filetype plugin indent on
set mouse=a
filetype plugin on
set ttyfast
set clipboard+=unnamedplus
let g:python3_host_prog = '/bin/python3'
let g:ycm_clangd_binary_path='/usr/bin/clangd'
let g:DoxygenToolkit_commentType = "C++"

function! SetupCommandAbbrs(from, to)
    exec 'cnoreabbrev <expr> '.a:from
                \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
                \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

autocmd FileType json syntax match Comment +\/\/.\+$+
let g:coc_global_config="$HOME/.config/nvim/coc-settings.json"

call SetupCommandAbbrs('C', 'CocConfig')
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:toggleterm_terminal_mapping = '<C-j>'
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-j> <C-\><C-n>:exe v:count1 . "ToggleTerm"<CR>

inoremap <silent><c-j> <Esc>:<c-u>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-j> <Esc>:<c-u>exe v:count1 . "ToggleTerm"<CR>

set hidden

let g:nvim_tree_show_icons = { 'git': 1 }
let g:nvim_tree_icons = {
    \ 'git': {
    \   'unstaged': "[UNSTAGED] ",
    \   'staged': "[STAGED] ",
    \   'unmerged': "[UMERGE] ",
    \   'renamed': "[RENAME] ",
    \   'untracked': "[UNTRACKED] ",
    \   'deleted': "[DELETED] ",
    \   'ignored': "[IGNORED] "
    \   }
    \ }

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
