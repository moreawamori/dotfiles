if has('vim_starting') && empty(argv())
  syntax off
endif

let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

if exists('&inccommand')
  set inccommand=nosplit
endif

if exists('&pumblend')
  "set pumblend=20
  " For gonvim
  " autocmd MyAutoCmd InsertEnter * set pumblend=20
endif

if exists('&winblend')
  "set winblend=20
endif
set termguicolors
set guicursor=
