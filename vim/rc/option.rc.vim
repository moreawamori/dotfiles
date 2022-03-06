set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=single

" Status Line
set laststatus=2
set noshowmode
set showcmd
set ruler
if !has('gui_running')
    set t_Co=256
endif
set t_ut=

" Cmd mode
set incsearch
set ignorecase
set smartcase
set hlsearch

set backspace=indent,eol,start

set bg=dark
set ttyfast
set wrapscan
set whichwrap=b,s,h,l,<,>,[,],~
set number
set autoindent
set smartindent
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set matchpairs+=<:>
set virtualedit=block

set completeopt=menuone
if exists('+completepopup')
    set completeopt+=popup
    set completepopup=height:4,width:60,highlight:InfoPopup
endif
set complete=
set pumheight=20

if exists('+breakindent')
    set breakindent
    set wrap
else
    set nowrap
endif

set expandtab
set tabstop=4
"set softtabstop=4
set shiftwidth=4
set nf+=alpha " Serial number option: +Alphabet (default: hex,bin)
set wildmenu

set title
" Transparent
 "augroup TransparentBG
 "    autocmd!
 "    autocmd Colorscheme * highlight Normal ctermbg=NONE guibg=NONE
 "    autocmd Colorscheme * highlight NonText ctermbg=NONE guibg=NONE
 "    autocmd Colorscheme * highlight LineNr ctermbg=NONE guibg=NONE
 "    autocmd Colorscheme * highlight Folded ctermbg=NONE guibg=NONE
 "    autocmd Colorscheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
 "augroup END

set termguicolors
syntax enable
filetype plugin indent on
filetype on
colorscheme tokyonight
let g:tokyonight_style = 'storm'

let g:ruby_no_expensive = 1

set helplang=ja,en
let g:previm_enable_realtime = 1

set conceallevel=0
let g:tex_conceal=''
