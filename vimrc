"skip vi compatibility
set nocompatible
set ignorecase
set relativenumber

"Search down into subfolders
"Privides tab-completion for all file-related tasks
set path+=**

"Display all matching files when we tab complete
set wildmenu

" Vim plugins section. These are managed by vim-plug
call plug#begin('~/.vim-plug/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'

call plug#end()
