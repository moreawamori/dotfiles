set encoding=utf-8
scriptencoding utf-8

if &compatible
    set nocompatible
endif

"=======================================================
function! s:source_rc(path, ...) abort
    let use_global = get(a:000, 0, !has('vim_starting'))
    let abspath = resolve(expand('~/.vim/rc/' . a:path))
    if !use_global
        execute 'source' fnameescape(abspath)
        return
    endif

    "substitute all 'set' to 'setglobal'
    let content = map(readfile(abspath),
                \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W","setglobal", "")')
    "create tempfile and source the tempfile
    let tempfile = tempname()
    try
        call writefile(content, tempfile)
        execute 'source' fnameescape(tempfile)
    finally
        if filereadable(tempfile)
            call delete(tempfile)
        endif
    endtry
endfunction
"=====================================================

call s:source_rc('dein.rc.vim')
call s:source_rc('init.rc.vim')
call s:source_rc('secret_dein.rc.vim')
call s:source_rc('mapping.rc.vim')
if has('nvim')
    call s:source_rc('neovim.rc.vim')
endif

if !has('vim_starting')
    call dein#call_hook('source')
    call dein#call_hook('post_source')
endif
"---------------------------
" Strings
"---------------------------
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=single
"-=========================
" Status_Line
"--------------------------
set laststatus=2
" set showmode
set noshowmode
set showcmd
set ruler
if !has('gui_running')
    set t_Co=256
endif
set t_ut=
"==========================
" cmd mode
"--------------------------
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><ESC><ESC> :<C-u>set nohlsearch!<CR>

"nnoremap j gj
"nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
set backspace=indent,eol,start
inoremap <silent> jj <ESC>
"==========================
set ttyfast
set wrapscan
set whichwrap=b,s,h,l,<,>,[,],~
set number
set autoindent
set smartindent
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set matchpairs+=<:>
set termguicolors
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
set background=dark

"set cursorline
set laststatus=2
set wildmenu

colorscheme tokyonight
let g:tokyonight_style = 'storm'
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

syntax enable
filetype plugin indent on
filetype on
let g:ruby_no_expensive = 1

autocmd Filetype cpp set keywordprg=/usr/bin/cppman
set helplang=ja,en
let g:previm_enable_realtime = 1

set conceallevel=0
let g:tex_conceal=''
set secure
