syntax on
set number
set relativenumber
set smarttab
set ignorecase
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set clipboard+=unnamed  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard
set mouse=a
set encoding=utf-8
set backspace=indent,eol,start
set cursorline

autocmd BufNewFile,BufReadPost *.blade.php set filetype=blade
autocmd Filetype py setlocal shiftwidth=4 tabstop=4
filetype plugin indent on
let mapleader = ","
nmap <Leader>m :e $MYVIMRC<cr>
nmap <Leader>t :NERDTreeToggle<cr>
nmap <Leader>p :SyntasticToggleMode<cr>
nmap <Leader>l :FZF<cr>
imap <c-p> <c-x><c-o>

let NERDTreeHijackNetrw = 0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let NERDTreeShowHidden=1
set autoread
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Vundlevim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin '1995parham/tomorrow-night-vim'
Plugin 'mechatroner/rainbow_csv'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'alvan/vim-closetag'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'stanangeloff/php.vim'
Plugin 'othree/html5.vim'
Plugin 'jwalton512/vim-blade'
Plugin 'infoslack/vim-docker'
"autocomplete python
Plugin 'davidhalter/jedi-vim'
"autocorrection python file
Plugin 'vim-syntastic/syntastic'
"templating jinja
Plugin 'glench/vim-jinja2-syntax'
" c autocomplete must install sudo apt install clang
Plugin 'justmao945/vim-clang'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'posva/vim-vue'
"search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'unkiwii/vim-nerdtree-sync'
"syntax python
Plugin 'vim-python/python-syntax'
call vundle#end()

colorscheme naz

augroup VimCSS3Syntax
autocmd!

autocmd FileType css setlocal iskeyword+=-
augroup END

let g:airline_theme='tomorrow'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.vue'
let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_cache_taglists = 1

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
au BufNewFile,BufRead [Dd]ockerfile,Dockerfile.* set filetype=dockerfile

set wildignore+=*.pyc,*.swp,*__pycache__,*.DS_Store
"Nerdtree config for wildignore
let NERDTreeRespectWildIgnore=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:used_javascript_libs = 'vue'
autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd FileType vue syntax sync fromstart

let g:nerdtree_sync_cursorline = 1
let g:NERDTreeHighlightCursorline = 1
let g:python_highlight_all = 1

" disable mini popup on function python
let g:jedi#show_call_signatures= 2

"pip install flake8
let g:syntastic_python_flake8_args='--ignore=E302,E231,E501,E701,E401,E128,E251,F403,F405,E402,E221'

highlight VertSplit ctermfg=NONE
highlight VertSplit ctermbg=NONE

" disable all mouse wheel
nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>

imap <ScrollWheelUp> <nop>
imap <S-ScrollWheelUp> <nop>
imap <C-ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
imap <S-ScrollWheelDown> <nop>
imap <C-ScrollWheelDown> <nop>
imap <ScrollWheelLeft> <nop>
imap <S-ScrollWheelLeft> <nop>
imap <C-ScrollWheelLeft> <nop>
imap <ScrollWheelRight> <nop>
imap <S-ScrollWheelRight> <nop>
imap <C-ScrollWheelRight> <nop>

vmap <ScrollWheelUp> <nop>
vmap <S-ScrollWheelUp> <nop>
vmap <C-ScrollWheelUp> <nop>
vmap <ScrollWheelDown> <nop>
vmap <S-ScrollWheelDown> <nop>
vmap <C-ScrollWheelDown> <nop>
vmap <ScrollWheelLeft> <nop>
vmap <S-ScrollWheelLeft> <nop>
vmap <C-ScrollWheelLeft> <nop>
vmap <ScrollWheelRight> <nop>
vmap <S-ScrollWheelRight> <nop>
vmap <C-ScrollWheelRight> <nop>

" disable arrow key
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" disable page down and up
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>

vnoremap <PageUp> <Nop>
vnoremap <PageDown> <Nop>
