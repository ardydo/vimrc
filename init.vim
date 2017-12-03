set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'quabug/vim-gdscript'
Plugin 'tomasr/molokai'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'thaerkh/vim-workspace'
Plugin 'mbbill/undotree'
Plugin 'luochen1990/rainbow'
Plugin 'mhinz/vim-startify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" minhas variávies de alguma coisa. num sei
set mouse=a   		" alguma config do mouse. eu sei lá
set ai 			" identação
" set spell spelllang=pt_br
let g:airline_theme = 'molokai'
set number
set bg =dark		" cores para fundo escuro
colorscheme molokai
" encoding pro coiso de icones
set encoding=utf8
set t_Co=256
set wrap
set linebreak
set nolist
set wrapmargin=0
set formatoptions-=t
set formatoptions+=1

" ==== config de plugins ====
" bookmarks do startify
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim' } ]
" fonte com icones
set guifont=Fantasque\ Sans\ Mono\ 12
" config pra airline + icones
let g:airline_powerline_fonts = 1
" ==== keys ===
" botão pra salvar
" map <C-w> :w<CR>
" startify
nnoremap <F2> :Startify<CR>
" workspace stuff
nnoremap <F3> :ToggleWorkspace<CR>
" clear worskpace
nnoremap <s-F3> : CloseHiddenBuffers<CR>
" undotree
nnoremap <F5> :UndotreeToggle<cr>
" persistent undo file
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" An example for a vimrc file.
set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" Also switch on highlighting the last used search pattern.
set hlsearch

" I like highlighting strings inside C comments.
let c_comment_strings=1

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif
