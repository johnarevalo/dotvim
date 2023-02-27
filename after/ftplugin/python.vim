nnoremap <F5> :w<CR>:below ter python3 "%"<CR>
nnoremap <F7> :w<CR>:below ter ipython -i "%"<CR>
map <Leader>m Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" vim-test
let test#strategy = "dispatch"
let test#python#runner = 'pytest'

nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>ts :TestSuite<CR>

" dispatch
" autocmd FileType python let b:dispatch = 'pylint -f parseable %'

if !exists("current_compiler")
  compiler python
endif
