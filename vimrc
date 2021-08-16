"skip vi compatibility
set nocompatible
set ignorecase
set incsearch
set hlsearch
set relativenumber

"Search down into subfolders
"Privides tab-completion for all file-related tasks
set path+=**

"Display all matching files when we tab complete
set wildmenu

"########### key mappings ###########
nnoremap <leader>nt :NERDTree<CR>



" Vim plugins section. These are managed by vim-plug
call plug#begin('~/.vim-plug/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'pearofducks/ansible-vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'wannesm/wmgraphviz.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dbakker/vim-paragraph-motion'
Plug 'michaeljsmith/vim-indent-object'

call plug#end()

"#################################
"# plugin specific settings
"################################

"# wannesm/wmgraphvix
let g:WMGraphviz_output="svg"

"# NERDTREE 


" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

