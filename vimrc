set encoding=utf-8
scriptencoding utf-8

if &compatible
  set nocompatible
endif

if has('nvim')
  " https://zenn.dev/kawarimidoll/articles/19bfc63e1c218c
  "lua if vim.loader then vim.loader.enable() end
endif

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif

" load secret_dein
source ~/.vim/rc/secret_dein.rc.vim

" Load dein.
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

let g:dein#auto_recache = v:true
let g:dein#lazy_rplugins = v:true
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = v:true
" let g:dein#notification_icon = '~/.vim/signs/warn.png'
let g:dein#install_log_filename = '~/dein.log'

let s:path = $CACHE . '/dein'

if dein#min#load_state(s:path)
  let g:dein#inline_vimrcs = ['init.rc.vim', 'option.rc.vim','mapping.rc.vim']

  if has('nvim')
    call add(g:dein#inline_vimrcs, 'neovim.rc.vim')
  endif

  let s:base_dir = expand('~/.vim/rc/', ':h')
  call map(g:dein#inline_vimrcs, { _, val -> s:base_dir . val })

  let s:dein_toml = '~/.vim/rc/dein.toml'
  let s:dein_lazy_toml = '~/.vim/rc/dein_lazy.toml'
  let s:dein_ft_toml = '~/.vim/rc/dein_ft.toml'
  let s:dein_ddc_toml = '~/.vim/rc/dein_ddc.toml'
  let s:dein_ddu_toml = '~/.vim/rc/dein_ddu.toml'
  let s:dein_nvim_toml = '~/.vim/rc/dein_nvim.toml'

  call dein#begin(s:path, [
        \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml
        \ ])

  call dein#load_toml(s:dein_toml, #{lazy: 0})
  call dein#load_toml(s:dein_lazy_toml, #{lazy : 1})
  call dein#load_toml(s:dein_ddc_toml, #{lazy : 1})
  call dein#load_toml(s:dein_ddu_toml, #{lazy : 1})
  call dein#load_toml(s:dein_nvim_toml, #{lazy : 1})
  call dein#load_toml(s:dein_ft_toml)

  call dein#end()
  call dein#save_state()
endif

syntax enable
filetype plugin indent on
filetype detect

set secure
