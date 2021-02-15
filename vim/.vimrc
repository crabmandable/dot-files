set nocompatible              " be iMproved, required
filetype off                  " required

" #########################
" Plugins
" #########################

call plug#begin('~/.vim/plugged')

Plug 'KabbAmine/vCoolor.vim'
Plug 'lilydjwg/colorizer'

Plug 'leafgarland/typescript-vim'

Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }

Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'

" JS pluigins
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
let g:jsx_ext_required = 0

Plug 'airblade/vim-gitgutter'

Plug 'francoiscabrol/ranger.vim'
if has('nvim')
    " ranger.vim requires this in nvim
    Plug 'rbgrouleff/bclose.vim'
endif
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" always on
set laststatus=2
let g:airline_theme='behelit'

Plug 'leafOfTree/vim-vue-plugin'

Plug 'dense-analysis/ale'

Plug 'vim-scripts/a.vim'
cnoreabbrev AH AS

Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'c'] }
Plug 'vim-scripts/OmniCppComplete', { 'for': ['cpp', 'c'] }

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if has('nvim')
    " nvim only plugins go here
    Plug 'numkil/ag.nvim'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    Plug 'voldikss/vim-floaterm'

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
else
    Plug 'yegappan/grep'
endif

call plug#end()            " required
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
set incsearch

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

set showmatch " show matching brace when inserting a closeing brace

set noerrorbells
set belloff=esc " no bell when hitting esc in normal mode

set matchpairs+=<:>

set listchars=tab:>·,trail:_,extends:>,precedes:<
set list

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

" Esc exits insert mode in vim terminal:
tnoremap <Esc> <C-\><C-n>
" simulate i_CTRL-R in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Floatterm stuff
function! s:MapFloatermKeys()
    " Toggle term
    nnoremap <C-n> :FloatermToggle<cr>
    " cmake && make
    nnoremap <leader>m :FloatermNew --autoclose=0 cmake -DCMAKE_BUILD_TYPE=Debug . && make -j $(nproc)<cr>
    " cmake && make clean && make
    nnoremap <leader>M :FloatermNew --autoclose=0 cmake -DCMAKE_BUILD_TYPE=Debug . && make clean && make -j $(nproc)<cr>
    " ranger
    " nnoremap <leader>o :FloatermNew --height=0.8 --width=0.8 --disposable --wintype=float --name=files --position=center --autoclose=2 ranger <cr>
endfunction
autocmd VimEnter * if exists(":FloatermNew") | call s:MapFloatermKeys() | endif

nnoremap <leader>f :RangerWorkingDirectory<CR>

" #########################
" Colors
" #########################
set t_Co=256
colorscheme elflord

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
hi Visual ctermbg=8 ctermfg=11
hi DiffChange ctermfg=0
hi SpellBad ctermfg=15 ctermbg=red
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

hi WildMenu ctermfg=cyan
hi Todo ctermfg=cyan

hi Folded ctermbg=black

" Tell git gutter to leave the sign column alone
let g:gitgutter_override_sign_column_highlight = 0
hi SignColumn ctermbg=None

hi Whitespace ctermfg=red

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

autocmd! bufnewfile *.h,*.hpp exe "call InsertHeaderGuard()"

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
au VimEnter,WinEnter,BufWinEnter *COMMIT_EDITMSG setlocal nolist

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
