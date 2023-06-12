let g:lightline = {
      \ 'enable': {'tabline': '2'},
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \ 'left': [
      \ [ 'mode', 'paste' ],
      \ [ 'filepath' ],
      \ [ 'filename', 'Gin'],
      \ ],
      \ 'right': [
      \ [ 'lineinfo'],
      \ [ 'percent' ],
      \ [ 'fileformat', 'fileencoding', 'date', 'filetype'],
      \ ],
      \ },
      \ 'inactive': {
      \ 'left': [ [ 'filepath' ], [ 'filename' ] ],
      \ 'right': [ [ 'lineinfo' ], [ 'percent' ] ],
      \ },
      \ 'separator': {'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': {'left': "\ue0b1", 'right': "\ue0b3"},
      \ 'component_function': {
      \   'Gin': 'gin#component#branch#unicode',
      \    
      \ },
      \ }

augroup my_gin_component
  autocmd!
  autocmd User GinComponentPost redrawstatus
  " Or if you use tabline instead
  "autocmd User GinComponentPost redrawtabline
augroup END

autocmd! BufWritePost * call lightline#update()
