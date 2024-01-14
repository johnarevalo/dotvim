packadd lsp

nnoremap <silent> K :LspHover<CR>
nmap <leader>r :LspRename<CR>
nmap <leader>f :LspFormat<CR>
nmap gr :LspShowReferences<CR>
nmap gd :LspGotoDefinition<CR>
nmap [G :LspDiag first<CR>
nmap [g :LspDiag prev<CR>
nmap ]g :LspDiag next<CR>
nmap ]G :LspDiag last<CR>
nmap <Space>d :LspDiag show<CR>
nmap <Space>s :LspDocumentSymbol<CR>

" Enable TAB for completion
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

let pylsp_config ={
\    "pylsp": {
\        "plugins": {
\            "pycodestyle": { "enabled": v:false},
\            "autopep8": { "enabled": v:false},
\            "rope_completion": { "enabled": v:true},
\            "ruff": {
\                "enabled": v:true,
\                 "executable": "ruff",
\                 "format": ["I"],
\                 "targetVersion": "py310",
\            },
\        }
\    }
\}

call LspAddServer([#{name: 'pylsp',
                 \   filetype: 'python',
                 \   path: 'pylsp',
                 \   args: [],
                 \   workspaceConfig: pylsp_config
                 \ }])
