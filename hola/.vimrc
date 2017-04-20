set undodir=~/.vim/undo
set undofile

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

let mapleader = " "
set clipboard=unnamedplus
set textwidth=80
set colorcolumn=+1
filetype plugin indent on

" Numbers
set number
set numberwidth=5
" set columns=85
" autocmd BufReadPre,FileReadPre * set lines=49
" 35
" if &diff
"   set columns=180
" endif

nnoremap <backspace> <C-^>
nnoremap <leader><leader> :FZF<CR>
nnoremap Y y$
nnoremap <leader>a :Ag 
nnoremap <leader>u :call fzf#run(fzf#wrap('cvsu',
      \ {'source': 'cvsu \| sed "s/[FMOGRA?] //"', 'down': '25%'}, 0))<CR>
imap kk <Esc>
imap jj <Esc>
imap jk <Esc>
imap kj <Esc>
nnoremap <C-p> ciw<C-r>0<ESC>

" MY OWN CODE HERE
set relativenumber
set hidden
let g:ctrlp_show_hidden = 1
augroup sourcesession
        autocmd!
        autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
        \   source Session.vim |
        \ endif
augroup END

set splitright
set splitbelow

let g:syntastic_check_on_open=1

" Always use vertical diffs
set diffopt+=vertical

"https://github.com/dhruvasagar/vim-prosession
call plug#begin('~/.vim/plugged')
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
" Plug 'scrooloose/syntastic'
Plug 'pbrisbin/vim-mkdir'
Plug '907th/vim-auto-save'
Plug 'benmills/vimux'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'suan/vim-instant-markdown'
Plug 'plasticboy/vim-markdown'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

let $FZF_DEFAULT_COMMAND = 'ag --ignore "build*" -g ""'
:set noshowmode
let g:syntastic_aggregate_errors = 1
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
au FocusGained,BufEnter * :silent! !
" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime
set nojoinspaces
let g:auto_save = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let NERDTreeShowHidden=1

map <C-n> :NERDTreeToggle<CR>
map <C-c> :TComment<CR>

