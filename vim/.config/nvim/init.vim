" SELF DEFINED VIM SETTINGS!
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

" -------------- Plugins ---------
" No need to behave in a strongly vi-compatible way
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
    Plug 'vim-scripts/Syntastic'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle' }
    Plug 'majutsushi/tagbar', {'on': 'Tagbar' }
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'vim-scripts/tComment'
    Plug 'bling/vim-airline'
    Plug 'airblade/vim-gitgutter' " Show git diff inline while editting files
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'altercation/vim-colors-solarized'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'rking/ag.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Yggdroot/indentLine'
    Plug 'terryma/vim-expand-region'

    " Syntax
    Plug 'dag/vim-fish'
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'plasticboy/vim-markdown'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'haya14busa/incsearch.vim'
    Plug 'chase/vim-ansible-yaml'
    Plug 'MaicoTimmerman/ast.vim'
    Plug 'rust-lang/rust.vim'
    " Plug 'LaTeX-Box-Team/LaTeX-Box'
    Plug 'udalov/kotlin-vim'
    Plug 'posva/vim-vue'

    " Auto complete
    Plug 'davidhalter/jedi-vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'


call plug#end()
filetype plugin indent on

" Syntastic
let g:syntastic_error_symbol='✗✗'
let g:syntastic_style_error_symbol='✗✗'
let g:syntastic_warning_symbol='⚠⚠'
let g:syntastic_style_warning_symbol='⚠⚠'


" Nerdtree
map <F7> :NERDTreeToggle<CR>

" Airline, lean & mean status/tabline for vim that's light as air
let g:airline_powerline_fonts = 1 " Enable powerline icons.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
set ttimeoutlen=50 " Stop the delay in airline when leaving insertmode.

" Tagbar
map <F8> :Tagbar<CR>
highlight TagbarHighlight term=underline ctermfg=130 ctermbg=0 guifg=Brown

" Deoplete
let g:jedi#completions_enabled = 0
let g:deoplete#enable_at_startup = 1


" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "UltiSnipsExtra"]


let g:ctrlp_custom_ignore = {
    \ 'dir': 'dist\|build\|node_modules\|vender\|venv\|python2_source\|_minted-\|2011\|2012\|2013\|2014\|2015',
    \ 'file': '.\(exe\|o|dll\|toc\|log\|out\|pdf\|fls\|bcf\|bbl\|blg\|fdb_latexmk\|gls\|glg\|alg\|acr\|run.xml\|ist\|glo\|upb\|upa\|acn\)$' }

" Expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" -------------- Plugins ---------
"
" Mark the 80 colomn and everything past it.
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
end

if &shell =~# 'fish$'
    set shell=bash
endif


" Indenting like a boss
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set breakindent

set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set ruler                       " display the current cursor position in bottomleft
set showcmd                     " display incomplete commands
set history=50                  " keep 50 commands 50 patterns in the history
set incsearch                   " do incremental searching
set showmatch                   " Show matching bracket
set hidden                      " Hides current buffer on opening a new file instead of closing
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set laststatus=2                " always show the statusbar.
set t_Co=256                    " set color scheme to 256
set nobackup                    " set no backups
set number                      " set line numbers
set cursorline                  " highlight current cursor line.
set pastetoggle=<F2>            "
set hlsearch                    "
set mouse=a
set exrc
set ignorecase
set smartcase
set listchars=tab:»-,eol:¬  " Chars show in list mode
set conceallevel=0

let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:LatexBox_latexmk_options = "-shell-escape -bibtex -xelatex"
let g:vim_markdown_math = 1


let g:mapleader=" "
let g:maplocalleader=" "
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

" Set the solarized colorscheme with dark background
set background=dark
syntax on
colorscheme solarized

highlight ColorColumn ctermbg=DarkGray
highlight SignColumn ctermbg=black
highlight Search term=reverse cterm=bold

" Highlight merge conflict markers
match Todo '\v^(\<|\=|\>){7}([^=].+)?$'


if !exists(":W")
    command W w                     " use W to (w)rite
    command Q q                     " use Q to (q)uit
    command Wq wq                   " use W to (w)rite(q)uit
    command WQ wq                   " ...
    command Wa wa                   " ...
    command Qa qa                   " ...
    command Wqa wqa                 " ...
    command WQa wqa                 " ...
    command WQA wqa                 " ...

    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
    noremap <leader>m :make<CR><CR>
    inoremap <C-h> <C-o><C-w>h
    inoremap <C-j> <C-o><C-w>j
    inoremap <C-k> <C-o><C-w>k
    inoremap <C-l> <C-o><C-w>l

    " Set escape to remove highlighting
    nnoremap <silent><leader>/ :nohls <CR>
    nnoremap ; :

    " Dont stop visual mode on block (un)indent
    vnoremap < <gv
    vnoremap > >gv

    " Allow for blocks to be walked through the code
    vnoremap <down> :m '>+1<CR>gv=gv
    vnoremap <up> :m '<-2<CR>gv=gv

    " Jump to next/previous merge conflict marker
    nnoremap <silent> ]c /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
    nnoremap <silent> [c ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>

    " map j to gj and k to gk, so line navigation ignores line wrap
    " ...but only if the count is undefined (otherwise, things like 4j
    " break if wrapped LINES are present)
    nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
    nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
    xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
    xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

    " Fix shitty python behaviour of jumping to start of rule when entering '#'
    inoremap # x<BS>#

    " Navigate splits more easily
    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-l> <C-w>l

    nnoremap <C-p> :FZF<cr>
    nnoremap <leader>o :FZF<cr>
    nnoremap <leader>w :w<cr>

    "Space pasting and yanking is to clipboard
    nmap <Leader>y "+yy
    nmap <Leader>d "+dd
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    vmap <Leader>p "+p
    vmap <Leader>P "+P

    " Map \ to start searching for ag
    nnoremap \ :Ag<space>
    vnoremap \ "xy:Ag<space>"<C-r>x"<CR>


    " No last command windows!
    nnoremap q: :q<CR>

    " No execute mode, instead text format the paragraph
    nnoremap Q gqip

    " Enable spell check
    nnoremap <Leader>s :set spell<CR>

    " Show a list of buffers
    nnoremap <Leader><Leader> :Buffers<CR>
    nnoremap <Leader>ll :!latexmk -shell-escape -xelatex %<CR>

    noremap <Leader>gf :vsp <cfile><CR>

endif

" For all text files set 'textwidth' to 78 characters.
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt,tex} setl tw=80 spell

" Format c(++) and java code using clang formatter
au FileType c,cpp,cs,java,js noremap <leader>f :pyf /usr/share/clang/clang-format.py<cr>

" Set spell checker in the git commit messages
autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell

" Fix windows sized on resizing vim.
autocmd VimResized * :wincmd =

" CiviC see has C syntax.
au BufRead,BufNewFile *.cvc set syntax=c

" NetLogo
au BufRead,BufNewFile *.nlogo set syntax=nlogo
au BufRead,BufNewFile *.nls set syntax=nlogo

" Automatically remove all trailing whitespace from the file before
" saving.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Go to remembered position in file if it's on a valid line number
augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |
    \     let b:doopenfold = 1 |
    \     if (foldlevel(JumpCursorOnEdit_foo) >
    \               foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |
    \     endif |
    \     exe JumpCursorOnEdit_foo |
    \   endif |
    \ endif

    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |
    \   if(b:doopenfold > 1) |
    \       exe  "+".1 |
    \   endif |
    \   unlet b:doopenfold |
    \ endif
augroup END


if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" ignore *.ext files
set wildignore+=*.so,*.swp,*.zip,*.exe,*.dll,*.pyc,*.pdf,*.dvi,*.aux
set wildignore+=*.png,*.jpg,*.gif,*.class,*.o,*.so,*.a,*.lib,*obj

let g:extesions_ignore = ['exe'
            \'bcf', 'bbl', 'blg', 'fdb_latexmk', 'gls', 'glg', 'alg', 'acr',
            \'run.xml', 'ist', 'glo', 'upb', 'upa', 'acn', 'svg', 'jpeg', 'jpg',
            \'png', 'dll', 'pyc', 'class', 'o', 'so', 'obj', 'dvi', 'aux']
let g:ignore_dirs = ['build', 'node_modules', 'venv', 'python2_source',
            \'_minted-', '.sass-cache', 'dist',
            \'.git', '.svn', '.hg']
"ctrlp ignores
let g:ctrlp_custom_ignore = {
  \ 'dir': 'build\|node_modules\|venv\|python2_source\|_minted-\|\.sass-cache\|dist',
  \ 'file': '.\(exe\|o|dll\|toc\|log\|out\|fls\|bcf\|bbl\|blg\|fdb_latexmk\|gls\|glg\|alg\|acr\|run.xml\|ist\|glo\|upb\|upa\|acn\|svg\|jpeg\|jpg\|png\)$'
  \ }

let $FZF_DEFAULT_COMMAND = 'ag --hidden ' .
            \'--ignore "*.' . join(g:extesions_ignore, '" --ignore "*.') . '" ' .
            \'--ignore "' . join(g:ignore_dirs, '" --ignore "') . '" ' .
            \'-g ""'

fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        exe 'tjump ' . expand('<cword>')
    finally
        let &ic = ic
    endtry
endfun

nnoremap <silent> <c-]> :call MatchCaseTag()<CR>

"disable syntastic on a per buffer basis (some work files blow it up)
function! SyntasticDisableBuffer()
    let b:syntastic_mode = "passive"
    SyntasticReset
    echo 'Syntastic disabled for this buffer'
endfunction

command! SyntasticDisableBuffer call SyntasticDisableBuffer()

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
set secure
