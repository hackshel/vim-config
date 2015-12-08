if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible        " Use Vim defaults (much better!)
set bs=indent,eol,start " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

syntax on
set list
set expandtab
"set noautoindent
"set smartindent
set laststatus=2
set number
set hidden
"set autoread
"set autowrite
set nobackup             " keep a backup file
set backspace=2
set cmdheight=2
set showcmd
set history=500
set colorcolumn=81
set ignorecase          " 忽略大小写进行查找
set hlsearch


"set fileencodings=utf-8,gk2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8


""" background color
set background=dark


""""" set hi commonds

hi ColorColumn ctermbg=DarkBlue

""""set color scheme
let g:molokai_original = 1
let g:rehash256 = 1


"set highlight=Comment ctermfg=green guifg=green


"let let mapleader = ","
"let g:mapleader = ","
"""mapping keys
nmap ,c "+y<cr>
nmap ,p "*p<cr>



" Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ FilePath:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c
"set statusline= \ %F%m%r%h \ %w\ \[%{&fenc}][%{&ff}]\ [%p%%][%l/%L]\ [%{ShrinkPath('%:p:h',20)}]

"filetype on
"filetype plugin on
"filetype indent on
"filetype plugin indent on

set listchars=tab:].,trail:\|,extends:<,precedes:>
"set ts=4 | set expandtab
set ts=4
set sw=4
"autocmd filetype python,py  set ts=4 | set expandtab

"autocmd FileType text setlocal textwidth=78

au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS



"colorscheme darkblue

noremap ,w :w<cr>
noremap ,s :split<cr>
noremap ,vs :vsplit<cr>
noremap ,q :q!<cr>
noremap ,ts :TlistToggle<cr>
noremap <F2> GoDate: <Esc>:read !date<CR>kJ

inoremap <C-C> <ESC>
inoremap jj <ESC>
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>

nnoremap <C-C> <ESC>

"-----
"set tags
"-----

set autochdir
set tags=/usr/home/xiaochen/webroot/tags


"-----
"set source Explorer
"-----
nmap <F8> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l


let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

"-----
"set taglist
"-----

nmap <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Window=1

"-----
"set NERDTree
"-----


nmap <F6> :NERDTreeToggle<CR>
"let NERDTreeWinPos="left"
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2  "选中root即设置为当前目录
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号

"execute pathogen#infect()
"set laststatus=2
"set term=dtterm
"
"

execute pathogen#infect()

" settings of Syntastic plugin
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" php 语法检查
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"
let makeprg = "php -l -d error_reporting=E_ALL -d display_errors=1"

let g:syntastic_python_checkers=['pylint']
let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'


