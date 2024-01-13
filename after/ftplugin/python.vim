nnoremap <F5> :w<CR>:below ter python3 "%"<CR>
nnoremap <F7> :w<CR>:below ter ipython -i "%"<CR>
map <Leader>m Obreakpoint()<C-c>

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


let pylsp_config ={
\    "pylsp": {
\        "plugins": {
\            "pycodestyle": { "enabled": v:false},
\            "autopep8": { "enabled": v:false},
\        }
\    }
\}

call LspAddServer([#{name: 'pylsp',
                 \   filetype: 'python',
                 \   path: 'pylsp',
                 \   args: [],
                 \   workspaceConfig: pylsp_config
                 \ }])
