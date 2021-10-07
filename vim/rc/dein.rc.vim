"load dein
let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand('~/.cache/dein')
          \. '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

let g:dein#auto_recache = v:true
let g:dein#lazy_rplugins = v:true
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = v:true
" let g:dein#notification_icon = '~/.vim/signs/warn.png'
let g:dein#install_log_filename = '~/dein.log'

let s:path = expand('~/.cache/dein')
if !dein#load_state(s:path)
   finish
endif

let s:dein_toml = '~/.vim/rc/dein.toml'
let s:dein_lazy_toml = '~/.vim/rc/dein_lazy.toml'
let s:dein_ft_toml = '~/.vim/rc/dein_ft.toml'
let s:dein_ddc_toml = '~/.vim/rc/dein_ddc.toml'
call dein#begin(s:path, [
      \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml
      \ ])

call dein#load_toml(s:dein_toml, {'lazy': 0})
call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})
call dein#load_toml(s:dein_ddc_toml, {'lazy' : 1})
call dein#load_toml(s:dein_ft_toml)
call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif
