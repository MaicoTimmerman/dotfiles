" SELF DEFINED VIM SETTINGS!
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

" -------------- Plugins ---------
" No need to behave in a strongly vi-compatible way
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " let Vundle manage Vundle
    Plugin 'gmarik/Vundle.vim'

    " =================
    " Installed Plugins
    " =================

    " Syntastic is a syntax checking plugin for Vim that runs files through
    " external syntax checkers and displays any resulting errors to the user.
    " This can be done on demand, or automatically as files are saved. If
    " syntax errors are detected, the user is notified and is happy because
    " they didn't have to compile their code or execute their script to find
    " them.
    Plugin 'Syntastic'

    " The NERD tree allows you to explore your filesystem and to open files
    " and directories. It presents the filesystem to you in the form of a tree
    " which you manipulate with the keyboard and/or mouse. It also allows you
    " to perform simple filesystem operations.
    Plugin 'scrooloose/nerdtree'

    " Tagbar is a Vim plugin that provides an easy way to browse the tags of
    " the current file and get an overview of its structure. It does this by
    " creating a sidebar that displays the ctags-generated tags of the current
    " file, ordered by their scope. This means that for example methods in C++
    " are displayed under the class they are defined in.
    Plugin 'majutsushi/tagbar'

    " Surround.vim is all about 'surroundings': parentheses, brackets, quotes,
    " XML tags, and more. The plugin provides mappings to easily delete,
    " change and add such surroundings in pairs.
    Plugin 'tpope/vim-surround'

    " If you've ever tried using the . command after a plugin map, you were
    " likely disappointed to discover it only repeated the last native command
    " inside that map, rather than the map as a whole. That disappointment
    " ends today. Repeat.vim remaps . in a way that plugins can tap into it.
    Plugin 'tpope/vim-repeat' " Support plugin repetition with `.`.


    " EasyMotion provides a much simpler way to use some motions in vim. It
    " takes the <number> out of <number>w or <number>f{char} by highlighting
    " all possible choices and allowing you to press one key to jump directly
    " to the target.
    Plugin 'Lokaltog/vim-easymotion' " Visually marked text object motion

    " tcomment provides easy to use, file-type sensible comments for Vim. It
    " can handle embedded syntax.  TComment works like a toggle, i.e., it will
    " comment out text that contains uncommented lines, and it will remove
    " comment markup for already commented text (i.e. text that contains no
    " uncommented lines).
    Plugin 'tComment'

    " Airline, lean & mean status/tabline for vim that's light as air
    Plugin 'bling/vim-airline' " Statusbar

    " A Vim plugin which shows a git diff in the 'gutter' (sign column). It
    " shows whether each line has been added, modified, and where lines have
    " been removed. You can also stage and revert individual hunks.
    Plugin 'airblade/vim-gitgutter' " Show git diff inline while editting files

    " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
    Plugin 'kien/ctrlp.vim' " Fussy-Search file manager

    " This is an addon for Vim providing support for editing fish scripts.
    Plugin 'dag/vim-fish'

    " There have been many attempts at bringing Sublime Text's awesome
    " multiple selection feature into Vim, but none so far have been in my
    " opinion a faithful port that is simplistic to use, yet powerful and
    " intuitive enough for an existing Vim user. vim-multiple-cursors is yet
    " another attempt at that.
    Plugin 'terryma/vim-multiple-cursors'

    " YouCompleteMe is a fast, as-you-type, fuzzy-search code completion
    " engine for Vim. It has several completion engines: an identifier-based
    " engine that works with every programming language, a semantic,
    " Clang-based engine that provides native semantic code completion for
    " C/C++/Objective-C/Objective-C++ (from now on referred to as "the
    " C-family languages"), a Jedi-based completion engine for Python, an
    " OmniSharp-based completion engine for C# and an omnifunc-based completer
    " that uses data from Vim's omnicomplete system to provide semantic
    " completions for many other languages (Ruby, PHP etc.).
    Plugin 'Valloric/YouCompleteMe'

    " This small script modifies vim’s indentation behavior to comply with PEP8
    Plugin 'hynek/vim-python-pep8-indent'

    " Add CSS3 syntax support to Vim's built-in syntax/css.vim.
    Plugin 'hail2u/vim-css3-syntax'

    " HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
    " Based on the default htmlcomplete.vim.
    Plugin 'othree/html5.vim'

    " JavaScript bundle for vim, this bundle provides syntax and indent
    " plugins.
    Plugin 'pangloss/vim-javascript'

    " Syntax highlighting, matching rules and mappings for the original
    " Markdown and extensions.
    Plugin 'plasticboy/vim-markdown'

    " Solarized is a sixteen color palette (eight monotones, eight accent
    " colors) designed for use with terminal and gui applications.
    Plugin 'altercation/vim-colors-solarized'

    " Track the engine.
    Plugin 'SirVer/ultisnips'

    " Snippets are separated from the engine. Add this if you want them:
    Plugin 'honza/vim-snippets'

    " if you use Vundle, load plugins:
    Bundle 'ervandew/supertab'

    " Support for Jinja
    Bundle 'Glench/Vim-Jinja2-Syntax'

    " incsearch.vim incrementally highlights ALL pattern matches unlike default
    " 'incsearch'.
    Bundle 'haya14busa/incsearch.vim'

    Bundle 'chase/vim-ansible-yaml'

call vundle#end()
filetype plugin indent on

" Syntastic
scriptencoding utf-8
let g:syntastic_error_symbol='✗✗'
let g:syntastic_style_error_symbol='✗✗'
let g:syntastic_warning_symbol='⚠⚠'
let g:syntastic_style_warning_symbol='⚠⚠'
let g:syntastic_check_on_open=1

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

" Pymode
let g:pymode_lint_options_mccabe = { 'complexity': 20 }

" make YCM compatible with UltiSnips (using Supertab)
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType='<C-n>'
let g:ycm_show_diagnostics_ui = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:ctrlp_custom_ignore = {
    \ 'dir': 'build\|node_modules\|vender\|venv\|python2_source\|_minted-\|2011\|2012\|2013\|2014\|2015',
    \ 'file': '.\(exe\|o|dll\|toc\|log\|out\|pdf\|fls\|bcf\|bbl\|blg\|fdb_latexmk\|gls\|glg\|alg\|acr\|run.xml\|ist\|glo\|upb\|upa\|acn\)$' }

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

    let g:mapleader = ','

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

    inoremap # x<BS>#

    " Navigate splits more easily
    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-l> <C-w>l

endif

" For all text files set 'textwidth' to 78 characters.
augroup SetWrapperForTextFiles
    au!
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt,tex} setlocal tw=80 spell
augroup END

augroup reload_vimrc
    au!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup save_folds
    au!
    au BufWinLeave *.* mkview
    au BufWinEnter *.* silent loadview
augroup END

" Set spell checker in the git commit messages
augroup GitCommit
    au!
    autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell
augroup END

augroup VimResized
    au!
    autocmd VimResized * :wincmd =
augroup END


" Automatically remove all trailing whitespace from the file before
" saving.
augroup RemoveTrailingWhitespace
    au!
    autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
    retab
augroup END

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
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.so,*.a,
            \*.lib,*.obj,*.png,*.jpg,*.gif,*.dll,*.pdf

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
set secure
