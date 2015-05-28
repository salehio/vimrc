set number
set ignorecase
set smartcase
set backspace=2
set incsearch
set hlsearch
set wildmenu
set wildmode=list:longest
set cursorline
set diffopt+=iwhite
set noswapfile
"set colorcolumn=85
"e! ++enc=utf8
let mapleader=","
let maplocalleader=","
let g:netrw_liststyle=3 " proper file native exlorer
"set encoding=utf-8
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"Font == consolas
set guifont=consolas:h16
"Json formatter
nmap =j :%!python -m json.tool<CR> 
"Remove search highlights
nmap \q :noh<CR>
"YankRing window
nnoremap <silent> <F11> :YRShow<CR>
"Change mapping of DirectionalWindowResizer to live in harmony with multicursor mode
nnoremap <silent> <M-j> :call DownHorizontal()<CR>
nnoremap <silent> <M-k> :call UpHorizontal()<CR>
nnoremap <silent> <M-l> :call RightVertical()<CR>
nnoremap <silent> <M-h> :call LeftVertical()<CR>
"Fix multicursor mode to live in harmony with YankRing
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-X>'
let g:multi_cursor_quit_key='<Esc>'

" vim-plug
call plug#begin('$HOME/_vim/plugged')
Plug 'vim-scripts/directionalWindowResizer'
Plug 'othree/xml.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'OrangeT/vim-csharp'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
"Plug 'scrooloose/syntastic'
"Plug 'altercation/vim-colors-solarized'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'tomasr/molokai'
Plug 'majutsushi/tagbar'
Plug 'whatyouhide/vim-gotham'
Plug 'bling/vim-airline'
Plug 'sjl/gundo.vim'
Plug 'PProvost/vim-ps1'
Plug 'dhruvasagar/vim-table-mode'
Plug 'elzr/vim-json'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/YankRing.vim'
Plug 'henrik/vim-indexed-search'
"Plug 'vim-scripts/Conque-Shell'
"Plug 'airblade/vim-gitgutter' " ENABLE WHEN MOVING TO GIT
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
call plug#end()

colorscheme gotham256

" Rainbow Parentheses options
    function! Config_Rainbow()
        call rainbow_parentheses#load(0) " Load Round brackets
        call rainbow_parentheses#load(1) " Load Square brackets
        call rainbow_parentheses#load(2) " Load Braces
        autocmd! TastetheRainbow VimEnter * call Load_Rainbow() " 64bit Hack - Set VimEnter after syntax load
    endfunction

    function! Load_Rainbow()
        call rainbow_parentheses#activate()
    endfunction

    augroup TastetheRainbow
        autocmd!
        autocmd Syntax * call Config_Rainbow() " Load rainbow_parentheses on syntax load
        autocmd VimEnter * call Load_Rainbow()
    augroup END

    " rainbow_parentheses toggle
    nnoremap <silent> <Leader>t :call rainbow_parentheses#toggle()<CR>

" xml syntax folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax"

" F8 to toggle project tags
nmap <F8> :TagbarToggle<CR>

" Toggle tree undo screen
nnoremap <F5> :GundoToggle<CR>

" Set .tpl to .xml syntax highlighting
au BufRead,BufNewFile *.tpl set filetype=xml

" Let delimate expand on new line
let delimitMate_expand_cr = 1
