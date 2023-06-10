let g:lightline = {
      \ 'enable': {'tabline': '2'},
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \ 'left': [
      \ [ 'mode', 'paste' ],
      \ [ 'filepath' ],
      \ [ 'filename', 'currenttag'],
      \ ],
      \ 'right': [
      \ [ 'lineinfo'],
      \ [ 'percent' ],
      \ [ 'char_code', 'fileformat', 'fileencoding', 'date', 'filetype'],
      \ ],
      \ },
      \ 'inactive': {
      \ 'left': [ [ 'filepath' ], [ 'filename' ] ],
      \ 'right': [ [ 'lineinfo' ], [ 'percent' ] ],
      \ },
      \ 'separator': {'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': {'left': "\ue0b1", 'right': "\ue0b3"}
      \ }
