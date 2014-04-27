" SELF DEFINED VIM SETTINGS!
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible                " must be first
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Installed Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'Syntastic'
" configure syntastic
let g:syntastic_error_symbol='✗✗'
let g:syntastic_style_error_symbol='✗✗'
let g:syntastic_warning_symbol='⚠⚠'
let g:syntastic_style_warning_symbol='⚠⚠'
let g:syntastic_check_on_open=1
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'msanders/snipmate.vim'
Bundle 'tComment'
Bundle 'bling/vim-airline'
" Change the powerline icons to the correct terms.
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set ttimeoutlen=50              " Stop the delay in airline when leaving insertmode.
Bundle 'dag/vim2hs'
Bundle 'sparkup'

" Sparkup, very easy html programming
" in ~/.vim/ftplugin
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " After an eol use the previously used indention
set ruler                       " display the current cursor position in bottomleft
set showcmd                     " display incomplete commands
set history=50                  " keep 50 commands 50 patterns in the history
set incsearch                   " do incremental searching
set smartindent                 " Do smart autoindenting when starting a new line.
set tabstop=4                   " Number of spaces that a <tab> counts for.
set softtabstop=4               " Number of spaces that a <tab> counts for.
set expandtab                   " Use number of spaces for <tab>
set shiftwidth=4                " Number of spaces for 'cindent', >>, << and autoindent
set number                      " Adds the linenumber infront of the line
set colorcolumn=120             " Make the 120th colomn red
set showmatch                   " Show matching bracket
set hidden                      " Hides current buffer on opening a new file instead of closing
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set laststatus=2                " always show the statusbar.
set t_Co=256                    " set color scheme to 256
command W w                     " use W to (w)rite
command Q q                     " use Q to (q)uit
command Wq wq                   " use W to (w)rite(q)uit
command WQ wq                   " ... 
command Wa wa                   " ...
command Wqa wqa                 " ...
command WQa wqa                 " ...
command WQA wqa                 " ...
command DelTrailing %s/\s\+$//  " command to delete trailing whitespace
set nobackup                    " set no backups


"ignore *.ext files
set wildignore=*.swp,*.bak,*.pyc,*.class
" Set the color of the ColorColomn to
highlight ColorColumn ctermbg=DarkGray
" Set the color of the line number color to Grey
highlight LineNr ctermbg=Black
" Set the SignColumn bg to Black
highlight SignColumn ctermbg=black



" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if has('autocmd')
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=118
endif

" Fix the difficult-to-read default setting for diff text highlighting.  The
" " bang (!) is required since we are overwriting the DiffText setting. The
" highlighting  for Todo also looks nice (yellow) if you don't like the MatchParen
" colors.
highlight! link DiffText MatchParen
