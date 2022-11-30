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

" Better clipboard handling
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

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

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Color scheme
set background=light
colorscheme solarized
let g:solarized_visibility="normal"
let g:solarized_contrast="normal"

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
set rnu     " relative line number
if exists('+colorcolumn')
    set colorcolumn=80
endif

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


" Settings for fzf
set rtp+=~/.vim/pack/plugins/start/fzf
nmap <Space>f :GFiles<CR>
nmap <Space>F :Files<CR>

" Settings for vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" folding mode
set foldnestmax=2
set foldmethod=indent
set foldlevelstart=20

" autoformat
noremap <buffer> <F8> :Format<CR>
autocmd VimResized * wincmd =

" vimtex
let g:vimtex_enabled=1
let g:vimtex_indent_enabled=1
let g:vimtex_format_enabled=1
let g:tex_flavor='latex'

" easy align markdown
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" json format
nmap =j :%!python -m json.tool<CR>

" Commands for python files
autocmd Filetype python nnoremap <F5> :w<CR>:below ter python3 "%"<CR>
autocmd Filetype python nnoremap <F7> :w<CR>:below ter ipython -i "%"<CR>
autocmd Filetype python map <Leader>m Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" For org-mode files
autocmd Filetype org setlocal tabstop=2
:let g:org_agenda_files=['~/projects/todo.org']

" vim-test
let test#strategy = "make"
let test#python#pytest#options = '--tb=native'
nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>ts :TestSuite<CR>


" dispatch
" autocmd FileType python let b:dispatch = 'pylint -f parseable %'

runtime coc.vim
