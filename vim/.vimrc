set nocompatible              " be iMproved, required
filetype off                  " required

" #########################
" Plugins
" #########################
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'KabbAmine/vCoolor.vim'
Plugin 'lilydjwg/colorizer'

Plugin 'moll/vim-node'
Plugin 'leafgarland/typescript-vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'

" JS pluigins
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plugin 'airblade/vim-gitgutter'

if has('nvim')
    Plugin 'numkil/ag.nvim'
else
    Plugin 'yegappan/grep'
endif

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$', '\.d$', '\.o$'] "ignore files in NERDTree
autocmd StdinReadPre * let s:std_in=1 "nerd tree close vim if nerd tree is only thing open
nnoremap <C-n> :e .<CR>

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

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
let g:airline_theme='behelit'

Plugin 'leafOfTree/vim-vue-plugin'

Plugin 'dense-analysis/ale'

Plugin 'vim-scripts/a.vim'
cnoreabbrev AH AS

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-scripts/OmniCppComplete'

if has('nvim')
    " nvim only plugins go here
endif

call vundle#end()            " required
filetype plugin indent on    " required

" #########################
" General settings
" #########################
syntax on
set nu
set relativenumber

set encoding=utf-8

set tabstop=4 expandtab shiftwidth=4 smarttab

set ic

set statusline+=%#warningmsg#
set statusline+=%*

set splitbelow

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set hlsearch

set wildignore+=node_modules
set wildignore+=*.o
set wildignore+=*.d
set wildignore+=*.swp
set wildignore+=vendor
set wildignore+=*.pyc

set re=1 " Use older version of regex engine (faster for ruby apparently)

set splitbelow

set wildmenu " tab complete commands

set showcmd

set copyindent " use tabs when a line is with tabs, spaces when a line is with spaces

" #########################
" Key maps
" #########################
let mapleader = ","

" Search word under cursor
nnoremap <F1> "zyiw:exe "Ag ".@z." "<CR><CR><CR>
map <Leader>q <F1>

" Turn off search hilight
nnoremap <F2> :noh<CR>
map <Leader>w <F2>

" Close quick fix & location list
nnoremap <F3> :ccl<CR>:lcl<CR>
map <Leader>e <F3>

" resize split vertically
nnoremap <F11> <C-W>-
nnoremap <F12> <C-W>+

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Put from the 0 register (yank only)
nnoremap <Leader>p "0p
nnoremap <Leader>P "0P

" CtrlP tags
nnoremap <Leader><Tab> :CtrlPTag<cr>

" #########################
" Colors
" #########################
set t_Co=256

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

hi SpellCap ctermbg=237
hi Pmenu ctermfg=white ctermbg=none
hi PmenuSel ctermfg=black ctermbg=white

hi CursorLine cterm=NONE ctermbg=234
hi CursorLineNr cterm=NONE ctermbg=232
hi Search ctermfg=0 ctermbg=3
hi Visual ctermfg=15 ctermbg=23
hi DiffChange ctermfg=0
hi SpellBad ctermfg=15 ctermbg=200
hi SpellRare ctermfg=0
hi CursorColumn ctermfg=0
hi ColorColumn ctermfg=0
hi StatusLineTerm ctermfg=0
hi StatusLineTermNC ctermfg=0
hi Constant ctermfg=5
hi debugPC ctermbg=235

hi DiffAdd    ctermfg=6 ctermbg=8
hi DiffChange ctermfg=3 ctermbg=8
hi DiffDelete ctermfg=1 ctermbg=8

hi link GitGutterAdd DiffAdd
hi link GitGutterChange DiffChange
hi link GitGutterChangeDelete DiffChange
hi link GitGutterDelete DiffDelete

hi ToolbarLine ctermfg=0

" Tell git gutter to leave the sign column alone
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=None

" #########################
" Autocmds & Custom functions
" #########################
" cpp/c header guards
" Add header guard for header files
function! InsertHeaderGuard()
    let headerguard = "_" . substitute(toupper(expand("%:t")), "\\.", "_", "g") . "_"
    exe "normal gg"
    exe "normal O#ifndef " .headerguard
    exe "normal o#define " .headerguard
    exe "normal Go#endif //" .headerguard
    exe "normal O"
endfunction

autocmd bufnewfile *.h,*.hpp exe "call InsertHeaderGuard()"

" Display a list of the current marks when jumping to mark
function! s:Marks()
  marks abcdefghijklmnopqtstuvwxyz.
  echo 'Jump to mark: '
  let marks = nr2char(getchar())
  redraw
  execute 'normal! `' . marks
endfunction

command! Marks call s:Marks()
nnoremap <Leader>c :Marks<Cr>

" Spell check for commit messages
au VimEnter,WinEnter,BufWinEnter *COMMIT_EDITMSG setlocal spell

" #########################
" Local vimrc files
" #########################
" source any extra vimrc that I didn't want in here.
" i.e. machine specific stuff
if filereadable(expand("~/.vimrc-extra"))
    source ~/.vimrc-extra
endif

" use local vimrc files
set exrc
" prevent unsafe commands in project specific vimrcs 
" should be at the end of this file!
set secure
