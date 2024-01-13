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
