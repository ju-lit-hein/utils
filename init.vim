call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'HelifeWasTaken/VimTek'
Plug 'HelifeWasTaken/VimUtils'
Plug 'x4m3/vim-epitech'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ggandor/lightspeed.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'lambdalisue/battery.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-capslock'
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
nnoremap <C-j> :terminal<CR>
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
set encoding=UTF-8
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



let g:airline_extensions = ['ale', 'battery', 'branch', 'capslock', 'hunks']


lua << EOF
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space: "
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
EOF



lua << EOF
require('Comment').setup()
EOF



autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


