set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'chrisbra/Colorizer'

Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
 \ "mode": "passive",
 \ "active_filetypes": [],
 \ "passive_filetypes": [] }

Plugin 'moll/vim-node'
Plugin 'leafgarland/typescript-vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'

"Plugin 'vim-scripts/grep.vim'
Plugin 'yegappan/grep'

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$', '\.d$', '\.o$'] "ignore files in NERDTree
nnoremap <C-n> :e .<CR>

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
nnoremap <Leader>p :CtrlPTag<cr>
nnoremap <Leader>P :CtrlPBuffer<cr>
set wildignore+=node_modules
set wildignore+=*.o
set wildignore+=*.d
set wildignore+=android
set wildignore+=vendor
set wildignore+=*.swp

let g:ctrlp_working_path_mode = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" always on
set laststatus=2
let g:airline_theme='deus'

Plugin 'leafOfTree/vim-vue-plugin'

Plugin 'dense-analysis/ale'

Plugin 'vim-scripts/a.vim'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set nu
set relativenumber

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set encoding=utf-8

set tabstop=4 expandtab shiftwidth=4 smarttab

set ic

set statusline+=%#warningmsg#
set statusline+=%*


" Colors
set t_Co=256

set splitbelow

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set hlsearch

let mapleader = ","

nnoremap <F1> "zyiw:exe "Ag ".@z." "<CR><CR><CR>
nnoremap <Leader>q "zyiw:exe "Ag ".@z." "<CR><CR><CR>
nnoremap <F2> :noh<CR>
nnoremap <Leader>w :noh<CR>
nnoremap <F3> :ccl<CR>
nnoremap <Leader>e :ccl<CR>

autocmd StdinReadPre * let s:std_in=1 "nerd tree close vim if nerd tree is only thing open

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au VimEnter,WinEnter,BufWinEnter * hi CursorLine cterm=NONE ctermbg=234
  au WinLeave * setlocal nocursorline
augroup END

hi SpellCap ctermbg=237
hi Pmenu ctermfg=white ctermbg=none
hi PmenuSel ctermfg=black

set re=1 " Use older version of regex engine (faster for ruby apparently)

" local vimrc
set exrc
set secure

