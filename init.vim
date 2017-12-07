" === BASICS ===
" not compatible
set nocp
" visible line numbers
set number
"" ruler
set ru
" more undo history
set history=25
" identation stuff
set autoindent smartindent cindent
" search stuff
set hlsearch incsearch ignorecase smartcase
" visual wrap
set wrap
" turning physical wrap off
set textwidth=0 wrapmargin=0
" good linebreak
set linebreak
" mouse on
set mouse=a
" syntax highlighting
syntax on
" proper encoding
set encoding=utf-8
" show incomplete comands
set showcmd
"backup stuff
set backup
set backupdir=~/.vim/tmp//

" === DEFAULTS ===
" I don't know if I should delete these
" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" I like highlighting strings inside C comments.
let c_comment_strings=1

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

filetype off                  " required

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	" actual plugins
	Plugin 'ryanoasis/vim-devicons'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'quabug/vim-gdscript'
	Plugin 'tomasr/molokai'
	Plugin 'godlygeek/tabular'
	Plugin 'plasticboy/vim-markdown'
	Plugin 'mbbill/undotree'
	Plugin 'luochen1990/rainbow'
	Plugin 'mhinz/vim-startify'

call vundle#end()            " required
filetype plugin indent on    " required

" === PLUGINS ===
" ==== STARTIFY ====
" bookmarks do startify
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim' } ]
" home list order
let g:startify_list_order = [
\ ['Sessões'],
\ 'sessions',
\ ['Favoritos'],
\ 'bookmarks',
\ ['Recentes'],
\ 'files',
\ ['Diretório'],
\ 'dir',
\ ]
" fonte com icones
set guifont=Fantasque\ Sans\ Mono\ 12
" ==== AIRLINE ====
" config pra airline + icones
let g:airline_powerline_fonts = 1
" airline theme
let g:airline_theme = 'molokai'
" persistent undo file
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" ==== RAINBOW ====
let g:rainbow_active = 1

" === CUSTOM KEYS ===
" startify
nnoremap <F2> :Startify<CR>
" undotree
nnoremap <F3> :UndotreeToggle<cr>
" : remapping
nnoremap ; :

" === THEME ===
" bg affinity
set bg=dark
" color scheme
colorscheme molokai
" 256 colors
set t_Co=256

