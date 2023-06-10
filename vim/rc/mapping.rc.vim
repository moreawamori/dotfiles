"-----------------------------
"key-mappings:
"

" Use ',' instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = ','
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = 'm'

" Visual mode keymappings:
" Indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  xnoremap <silent> y "*y:let [@+,@"]=[@*,@*]<CR>
endif

" Normal
nnoremap <silent> <C-l>    :<C-u>redraw!<CR>
nmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>
" s: Windows and buffers(High priority)
" " The prefix key.
nnoremap s <Nop>
nnoremap <silent> sp  :<C-u>vsplit<CR>:wincmd w<CR>
nnoremap <silent> so  :<C-u>only<CR>

nnoremap <silent> <Tab>      <Cmd>wincmd w<CR>
nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ""
nnoremap <silent><ESC><ESC> :<C-u>set nohlsearch!<CR>

"nnoremap j gj
"nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" Insert
inoremap <silent> jj <ESC>

" Terminal mode
if exists(':tnoremap')
  tnoremap   <ESC>      <C-\><C-n>
  tnoremap   jk         <C-\><C-n>
  tnoremap   j<Space>   j
endif

nnoremap Q  q
cnoremap <C-p> <Up>
