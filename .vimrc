" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set undodir=~/.vim/undo
set undofile

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

set textwidth=80
set colorcolumn=+1
filetype plugin indent on

" Numbers
set number
set numberwidth=5

nnoremap <leader><leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" MY OWN CODE HERE
set relativenumber
set hidden
set statusline=...%{ObsessionStatus()}...
let g:ctrlp_show_hidden = 1
augroup sourcesession
        autocmd!
        autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
        \   source Session.vim |
        \ endif
augroup END

set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
let g:syntastic_check_on_open=1

" Always use vertical diffs
set diffopt+=vertical

"https://github.com/dhruvasagar/vim-prosession
call plug#begin('~/.vim/plugged')
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-obsession'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/tComment'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'pbrisbin/vim-mkdir'
Plug 'kchmck/vim-coffee-script'
Plug '907th/vim-auto-save'
Plug 'benmills/vimux'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Valloric/YouCompleteMe'
" Plug 'oblitum/YouCompleteMe'
" Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'suan/vim-instant-markdown'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'jason0x43/vim-js-indent'
"vim-run-interactive

call plug#end()
" Typescript Support
" if !exists("g:ycm_semantic_triggers")
  " let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers['typescript'] = ['.']
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
" autocmd FileType typescript inoremap <C-f> <C-o>:echo tsuquyomi#hint()<CR>
" let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt=menuone,preview,noselect
" setlocal completeopt-=longest
" End Typescript Support

set shortmess+=c
:set noshowmode
let g:syntastic_aggregate_errors = 1
let mapleader = " "
set tabstop=2
set shiftwidth=2
set scrolloff=20
set shiftround
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set nojoinspaces
let g:auto_save = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let NERDTreeShowHidden=1

map <C-n> :NERDTreeToggle<CR>
map <C-c> :TComment<CR>

let mapleader = " "

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
set wildignore+=*/node_modules/*
autocmd VimEnter * :call SetupCtrlP()

