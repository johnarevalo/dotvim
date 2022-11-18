set nocompatible

" enable count match
set shortmess-=S

" Map arrow keys to move through windows
map <up> :wincmd k<CR>
map <down> :wincmd j<CR>
map <right> :wincmd l<CR>
map <left> :wincmd h<CR>
map <A-right> :tabnext<CR>
map <A-left> :tabprevious<CR>
map <A-down> :bnext<CR>
map <A-up> :bprevious<CR>

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

"Allow undo after change buffer
set hidden

set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","
let maplocalleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <Leader>s :update<CR>
vnoremap <Leader>s <C-C>:update<CR>
inoremap <Leader>s <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :q<CR>

" Close current buffer
noremap <Leader>c :bn\|bd #<CR>


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between buffers
map <Leader>b <esc>:bprevious!<CR>
map <Leader>n <esc>:bnext!<CR>
nnoremap <Leader>1 :b! 1<CR>
nnoremap <Leader>2 :b! 2<CR>
nnoremap <Leader>3 :b! 3<CR>
nnoremap <Leader>4 :b! 4<CR>
nnoremap <Leader>5 :b! 5<CR>
nnoremap <Leader>6 :b! 6<CR>
nnoremap <Leader>7 :b! 7<CR>
nnoremap <Leader>8 :b! 8<CR>
nnoremap <Leader>9 :b! 9<CR>
nnoremap <Leader>0 :b! 10<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set background=light
colorscheme solarized


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
if exists('+colorcolumn')
    set colorcolumn=80
endif


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
"" set history=700
"" set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab



" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile



" ============================================================================
" Git Setup
" ============================================================================
" cd ~/.vim/bundle
" git clone git://github.com/tpope/vim-fugitive.git
" vim -u NONE -c 'helptags vim-fugitive/doc' -c q
map <Leader>hb <Plug>(GitGutterPrevHunk)
map <Leader>hn <Plug>(GitGutterNextHunk)
command Gtdiff tabedit %|Gvdiff
" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-airline
" git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Settings for fzf
set rtp+=~/.vim/pack/plugins/start/fzf
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>k :BLines<CR>
nmap <Leader>K :Lines<CR>


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#goto_stubs_command = ""
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 0

map <Leader>m Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" set completeopt=longest,menuone
" function! OmniPopup(action)
"     if pumvisible()
"         if a:action == 'j'
"             return "\<C-N>"
"         elseif a:action == 'k'
"             return "\<C-P>"
"         endif
"     endif
"     return a:action
" endfunction

" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>



" Disable show diff window
let g:autopep8_disable_show_diff=1

" folding mode
set foldnestmax=2
set foldmethod=indent
set foldlevelstart=20

" ultisnips
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
set rnu
" autopep8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
autocmd VimResized * wincmd =
" vimtex
let g:vimtex_enabled=1
let g:vimtex_indent_enabled=1
let g:vimtex_format_enabled=1
let g:tex_flavor='latex'

" autocmd vimenter * NERDTree

" easy align markdown
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" json format
nmap =j :%!python -m json.tool<CR>


" Add run commands: F5 run, F6 run test
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:below ter python3 "%"<CR>
autocmd Filetype python nnoremap <buffer> <F6> :w<CR>:below ter python3 "%:r_test.py"<CR>
autocmd Filetype python nnoremap <buffer> <F7> :w<CR>:below ter ipython -i "%"<CR>

" For org-mode files
autocmd Filetype org setlocal tabstop=2

" vim-test
let test#strategy = "vimterminal"
nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>ts :TestSuite<CR>

" vim-orgmode
:let g:org_agenda_files=['~/projects/todo.org']
