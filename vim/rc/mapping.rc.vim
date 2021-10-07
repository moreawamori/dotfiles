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
nnoremap <silent> <C-l>    :<C-u>redraw!<CR>
nmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>
" s: Windows and buffers(High priority)
" " The prefix key.
nnoremap    [Window]   <Nop>
nmap    s [Window]
nnoremap <silent> [Window]p  :<C-u>vsplit<CR>:wincmd w<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> <Tab>      :wincmd w<CR>
nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ""

"on terminal mode
if exists(':tnoremap')
  tnoremap   <ESC>      <C-\><C-n>
  tnoremap   jk         <C-\><C-n>
  tnoremap   j<Space>   j
"  tnoremap <expr> ;  vimrc#sticky_func()
endif

nnoremap Q  q
cnoremap <C-p> <Up>
