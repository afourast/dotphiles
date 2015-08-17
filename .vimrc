""""""""""""""""""" Vundle """""""""""""""" 

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'ervandew/supertab'
Plugin 'craigemery/vim-autotag'
Plugin 'tpope/vim-surround'
Plugin 'jaredly/vim-debug'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""" /Vundle """""""""""""""""""""

" Enable syntax highlighting
syntax on

set hidden

" Better command-line completion
set wildmenu

"turn on spelling
":set spell

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

" Filetype Indentation Mode
filetype plugin indent on

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" copy to and from system clipboard
set clipboard=unnamed,unnamedplus

" set spell checking for certain filetypes
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd FileType gitcommit setlocal spell

" add custom filetypes
au BufNewFile,BufRead *.launch set filetype=xml

"Set working directory to the current file
"autocmd BufEnter * lcd %:p:h

" toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" look for ctags from working dir up to home
set tags=./tags,tags;$HOME

" toogle TagBar with <F8>
nmap <F8> :TagbarToggle<CR> 

"search highlighting 
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"""""""""""""""""""""" LATEX """""""""""""""""""""" 
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"set the compile output to pdf
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

"uncomment this line to compile xelatex. 
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'

"auto compile when saving 
au BufWritePost *.tex silent call Tex_RunLaTeX()
au BufWritePost *.tex silent !pkill -USR1 xdvi.bin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tab completion
let g:atp_tab_map = 1

" grep visualized 
vnoremap <C-h> "hy:%s/<C-r>h//gc<left><left><left>

" replace visualized 
vnoremap <C-g> "hy:grep -rn <C-r>h *<left><left>


""""""""""""""""""" Octave syntax highlighting """""""""""""""" 
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" source autotag script
:so ~/.vim/bundle/vim-autotag/plugin/autotag.vim

" reload all files when they are changed (used for git branch changes)
:set autoread 

"save and reload folds automatically
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview 

" Map ctrl-movement keys to window switching
map <A-l> <C-w><Right>
map <A-h> <C-w><Left>

" Maps Ctrl-Alt-[h,l] to resizing a window split
map <silent> <C-A-h> <C-w><
map <silent> <C-A-l> <C-W>>

" remove toolbar in gvim 
:set guioptions-=m
:set guioptions-=M 

" place minibuffer tab as a right column
" see this issue and fix for minibuf missbehaving https://github.com/fholgado/minibufexpl.vim/issues/104
let g:miniBufExplVSplit = 20  
let g:miniBufExplBRSplit = 1   

" map switching between buffers via minibuffer plugin
map <A-j> :MBEbn<CR>
map <A-k> :MBEbp<CR>

"This trigger takes advantage of the fact that the quickfix window can be easily distinguished by its file-type, qf.
"The wincmd J command is equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to the very bottom
:autocmd FileType qf wincmd J
