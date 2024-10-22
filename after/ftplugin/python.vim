nnoremap <F5> :w<CR>:below ter python3 "%"<CR>
nnoremap <F7> :w<CR>:below ter ipython -i "%"<CR>
map <Leader>m Obreakpoint()<C-c>

" vim-slime
let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1
nmap <Leader>w :SlimeSendCurrentLine<CR>

" vim-test
let test#strategy = "dispatch"
let g:test#python#pytest#executable = 'python -m pytest -vv'

nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>ts :TestSuite<CR>

" dispatch
" autocmd FileType python let b:dispatch = 'pylint -f parseable %'

if !exists("current_compiler")
  compiler python
endif
