syntax on
set number
set smarttab
set ignorecase
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set clipboard+=unnamed  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard
set encoding=utf-8

autocmd BufNewFile,BufReadPost *.blade.php set filetype=blade
autocmd Filetype py setlocal shiftwidth=4 tabstop=4
filetype plugin indent on
let mapleader = ","
nmap <Leader>m :e $MYVIMRC<cr>
nmap <Leader>t :NERDTreeToggle<cr>
nmap <Leader>p :set paste<cr>
nmap <Leader>[ :set nopaste<cr>
let NERDTreeHijackNetrw = 0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let NERDTreeShowHidden=1
set autoread
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif
let python_highlight_all=1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Vundlevim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
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
call vundle#end()

set t_Co=256
colorscheme Tomorrow-Night

augroup VimCSS3Syntax
autocmd!

autocmd FileType css setlocal iskeyword+=-
augroup END

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'
let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_cache_taglists = 1

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
au BufNewFile,BufRead [Dd]ockerfile,Dockerfile.* set filetype=dockerfile

set wildignore+=*.pyc,*.swp
"Nerdtree config for wildignore
let NERDTreeRespectWildIgnore=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"untuk membaca packages python
function! LoadPythonPath() 
py <<EOF
    # load PYTHONPATH into vim, this lets you hover over a module name
    # and type 'gf' (for goto file) and open that file in vim. Useful
    # and easier than rope for simple tasks 
    import os.path
    import sys
    import vim
    for p in sys.path:
        if os.path.isdir(p):
            vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

    endfunction
