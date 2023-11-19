"" SOURCES
" https://www.atlassian.com/git/tutorials/dotfiles
" https://www.programiz.com/python-programming/file-operation
" see 00-99/20-29_IT/25_Backup

language en_US

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

set encoding=utf-8
set fileencoding=utf-8

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype off "off for vundle 

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
"set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000


"" ADD WILDMENUE
" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" PLUGINS ---------------------------------------------------------------- {{{
    " Manage vundle plugins
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    
    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'vim-scripts/indentpython.vim'
    Bundle 'Valloric/YouCompleteMe' 
    " ~/.vim/bundle/YouCompleteMe/install.py
    Plugin 'vim-syntastic/syntastic'
    Plugin 'nvie/vim-flake8'
    Plugin 'jnurmine/Zenburn'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'kien/ctrlp.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    " add all your plugins here (note older versions of Vundle
    " used Bundle instead of Plugin)
    
    " ...
    
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    
    """ Bootstrap vim-plug
    ""
    ""if empty(glob('~/.vim/autoload/plug.vim'))
    ""  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    ""        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ""  autocmd VimEnter * PlugInstall | source ~/.vimrc
    ""endif
    ""
    ""call plug#begin('~/.vim/plugged')
    ""
    """ Automatically install missing plugins on startup
    ""if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))

    ""
    ""
    """ Plugin code goes here.
    ""
    """"    Plug 'dense-analysis/ale'
    ""    Plug 'preservim/nerdtree'
    "" ""   Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
    ""    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    ""    Plug 'habamax/vim-asciidoctor'
    "" ""   Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    ""
    ""call plug#end()
    ""
    " }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{


" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
"

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'yaml': ['prettier', 'eslint']}

" Auto brackets
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" ansible-vim
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

set backspace=indent,eol,start


filetype plugin indent on

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
"let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" Autocomplete when typing a .
" CRASHS TERMINAL ON MACOS
"au filetype go inoremap <buffer> . .<C-x><C-o>


" MOUSE ""

" enable mouse support, for example for :tabs
" set mouse=a

" YAML "
" disable the cracy indention when commenting
autocmd FileType yaml,yaml.ansible setlocal indentkeys-=0#

" BACKUP "

" BACKUP "

"Turn on backup option
set backup

"Where to store backups
set backupdir=~/.vim/backup//

" Create dir if not exist"
silent !mkdir ~/.vim/backup/ > /dev/null 2>&1

"Make backup before overwriting the current buffer
set writebackup

"Overwrite the original backup file
set backupcopy=no

"Meaningful backup name, filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

" STATUSLINE "
set statusline=%M%R%l/%L,%c:%F

" To make it clearer which window i'm in i have a differently colored status line for the selected window.

highlight StatusLine ctermfg=black ctermbg=green cterm=NONE

highlight StatusLineNC ctermfg=black ctermbg=lightblue cterm=NONE

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

"" CODING

" for YouCompleteMe


""The first line ensures that the auto-complete window goes away when you’re done with it, 
""and the second defines a shortcut for goto definition.
""Note: My leader key is mapped to space, 
""so space-g will goto definition of whatever I’m currently on. 
""That’s helpful when I’m exploring new code.
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"" PYTHON
"python with virtualenv support
python3 << EOF
import os
import subprocess

if "VIRTUAL_ENV" in os.environ:
    project_base_dir = os.environ["VIRTUAL_ENV"]
    script = os.path.join(project_base_dir, "bin/activate")
    pipe = subprocess.Popen(". %s; env" % script, stdout=subprocess.PIPE, shell=True)
    output = pipe.communicate()[0].decode('utf8').splitlines()
    env = dict((line.split("=", 1) for line in output))
    os.environ.update(env)

EOF


let python_highlight_all=1
syntax on

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |       
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" WEB
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2


if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"" NERDTree
 "ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

