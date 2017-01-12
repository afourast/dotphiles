
"""""""""""""""""" Vundle """""""""""""""" 

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
Plugin 'bserem/vim-greek-spell'
"Plugin 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'vim-latex/vim-latex'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
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
"filetype plugin indent on

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" copy to and from system clipboard
set clipboard=unnamed,unnamedplus

" set spell checking for certain filetypes
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us,el
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us,el
autocmd FileType gitcommit setlocal spell spelllang=en_us,el

" add custom filetypes
au BufNewFile,BufRead *.launch set filetype=xml

"Set working directory to the current file
autocmd BufEnter * lcd %:p:h

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
"let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'

"auto compile when saving 
au BufWritePost *.tex silent call Tex_RunLaTeX()
au BufWritePost *.tex silent !pkill -USR1 xdvi.bin

"set line width to 100 for latex files
autocmd bufreadpre *.tex setlocal textwidth=100

"convert numberd list to itemize pressing f6
":map <f6> ?^\D<cr>jmaV/<cr>kmb:s/^../\\item/<cr>'aV'b<f5>itemize<cr>
":map <f6> {jV}:s/^../\\item/<cr>{jV}k<f5>itemize<cr>
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

"greek language input - toggle with ctrl-6
:set keymap=greek_utf-8
:set iminsert=0
:set imsearch=-1
inoremap <M-F2> <C-^>
":set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

"spell checking toggle between greek and english
"function! ToggleSpelllang()
  "if(&spell == 0)
    "set spell spelllang=el
    "echo "Spell is on, language is Greek"
  "elseif(&spelllang == 'el') && (&spell == 1)
    "set spell spelllang=en_us
    "echo "Spell is on, language is US English"
  "elseif((&spelllang == 'en_us') || (&spelllang == 'en')) && (&spell == 1)
    "set nospell
    "echo "Spell is off"
  "endif
"endfunc
"nnoremap <silent> <M-F3> :call ToggleSpelllang()<CR>

"set spell spelllang=en_us,el

"Toggle text width in latex 
function! ToggleLineWidth()
  if(&textwidth ==100 )
    setlocal textwidth=1000
    echo "Set text width to 1000"
  else
    setlocal textwidth=100
    echo "Set text width to 100"
  endif
endfunc
nnoremap <silent> <M-F4> :call ToggleLineWidth()<CR>

"reload vimrc  
nnoremap <silent> <F4> :so %<CR>


"Folding method 
set foldmethod=syntax
set foldlevelstart=1
"set foldmethod=indent
"set foldnestmax=2


