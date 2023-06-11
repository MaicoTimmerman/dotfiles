--  -------------- Plugins ---------
vim.cmd([[
call plug#begin('~/.vim/plugged')
    " Plug 'dense-analysis/ale'
    Plug 'neovim/nvim-lspconfig'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'vim-scripts/tComment'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'lewis6991/gitsigns.nvim'

    Plug 'tjdevries/colorbuddy.nvim'
    Plug 'svrana/neosolarized.nvim'

    Plug 'jiangmiao/auto-pairs'

    Plug 'Yggdroot/indentLine'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


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
call plug#end()
]])

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lualine").setup()
require("colorbuddy").setup()
require("neosolarized").setup()
-- require("lspconfig").pyright.setup()
require("lspconfig").pyright.setup({})
require("lspconfig").volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})

actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>o", telescope.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
vim.keymap.set("n", "<leader><leader>", telescope.buffers, {})
vim.keymap.set("n", "<leader>ts", telescope.treesitter, {})

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "<leader>hs", gs.stage_hunk, { desc = "[H]unk [S]tage" })
		map("n", "<leader>hr", gs.reset_hunk, { desc = "[H]unk [R]eset" })
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "[H]unk [S]tage" })
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "[H]unk [R]eset" })
		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[H]unk [U]nstage" })
		map("n", "<leader>hp", gs.preview_hunk)
		map("n", "<leader>bl", function()
			gs.blame_line({ full = true })
		end, { desc = "[B]lame [L]ine" })
		map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[T]oggle [B]lame " })
		map("n", "<leader>dt", gs.diffthis, { desc = "[D]iff [T]his" })

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wl', function()
		--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Indenting like a boss
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smarttab = true
vim.opt.breakindent = true

vim.opt.backspace = "indent,eol,start" -- allow backspacing over everything in insert mode
vim.opt.ruler = true -- display the current cursor position in bottomleft
vim.opt.showcmd = true -- display incomplete commands
vim.opt.history = 50 -- keep 50 commands 50 patterns in the history
vim.opt.incsearch = true -- do incremental searching
vim.opt.showmatch = true -- Show matching bracket
vim.opt.hidden = true -- Hides current buffer on opening a new file instead of closing
vim.opt.history = 1000 -- remember more commands and search history
vim.opt.undolevels = 1000 -- use many muchos levels of undo
vim.opt.title = true -- change the terminal's title
vim.opt.visualbell = true -- don't beep
vim.opt.errorbells = false -- don't beep
vim.opt.laststatus = 2 -- always show the statusbar.
vim.opt.backup = false -- set no backups
vim.opt.number = true -- set line numbers
vim.opt.cursorline = true -- highlight current cursor line.
vim.opt.pastetoggle = "<F2>" --
vim.opt.hlsearch = true --
vim.opt.mouse = "a"
vim.opt.exrc = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.listchars = "tab:»-,eol:¬" -- Chars show in list mode
vim.opt.conceallevel = 0
vim.opt.foldenable = false
vim.opt.linebreak = true
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true

vim.g.vim_markdown_conceal = 0

-- undofile - This allows you to use undos after exiting and restarting
-- This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
-- :help undo-persistence
vim.cmd([[
if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
endif
]])
vim.opt.undodir = "./.vim-undo//"
vim.opt.undodir:append({ "~/.vim/undo//" })
vim.opt.undofile = true

-- ignore *.ext files
vim.opt.wildignore:append({ "*.so,*.swp,*.zip,*.exe,*.dll,*.pyc,*.pdf,*.dvi,*.aux" })
vim.opt.wildignore:append({ "*.png,*.jpg,*.gif,*.class,*.o,*.so,*.a,*.lib,*obj" })

-- TODO Highlight merge conflict markers
-- vim.cmd("match Todo '\v^(\<|\=|\>){7}([^=].+)?$'")

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("WQA", "wqa", {})

-- Navigate splits easier with control + navigation keys.
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- Set escape to remove highlighting
vim.keymap.set("n", "<leader>/", ":nohls <CR>", { noremap = true, silent = true })
vim.keymap.set("n", ";", ":", { noremap = true })

-- Dont stop visual mode on block (un)indent
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- Jump to next/previous merge conflict marker
-- vim.keymap.set("n", "]c", "", { noremap = true, silent = true })
-- vim.keymap.set("n", "]c", "", { noremap = true, silent = true })

-- map j to gj and k to gk, so line navigation ignores line wrap
-- but only if the count is undefined
-- (otherwise, things like 4j break if wrapped LINES are present)
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true })
vim.keymap.set("x", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true })
vim.keymap.set("x", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true })

-- Fix shitty python behaviour of jumping to start of rule when entering '#'
vim.keymap.set("i", "#", "#<BS>#", { noremap = true })

-- Navigate splits more easily
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})

-- Space pasting and yanking is to clipboard
vim.keymap.set("n", "<leader>y", "+yy", {})
vim.keymap.set("n", "<leader>d", "+dd", {})
vim.keymap.set("n", "<leader>p", "+p", {})
vim.keymap.set("n", "<leader>P", "+P", {})
vim.keymap.set("v", "<leader>y", "+y", {})
vim.keymap.set("v", "<leader>d", "+d", {})
vim.keymap.set("v", "<leader>p", "+p", {})
vim.keymap.set("v", "<leader>P", "+P", {})
vim.keymap.set("n", "<leader>w", ":w<cr>", {})

-- No last command windows!
vim.keymap.set("n", "q:", ":q<CR>", { noremap = true })

-- No execute mode, instead text format the paragraph
vim.keymap.set("n", "Q", "gqip", { noremap = true })

-- Enable spell check
vim.keymap.set("n", "<leader>s", ":set spell<CR>", { noremap = true })

vim.keymap.set("n", "<leader>gf", ":vsp <cfile><CR>", { noremap = true })

vim.cmd([[
" For all text files set 'textwidth' to 78 characters.
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt,tex} setl spell colorcolumn=0

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
    \   if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~ 'gitcommit'  |
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


let g:extesions_ignore = ['exe'
            \'bcf', 'bbl', 'blg', 'fdb_latexmk', 'gls', 'glg', 'alg', 'acr',
            \'run.xml', 'ist', 'glo', 'upb', 'upa', 'acn', 'svg', 'jpeg', 'jpg',
            \'png', 'dll', 'pyc', 'class', 'o', 'so', 'obj', 'dvi', 'aux']
let g:ignore_dirs = ['build', 'node_modules', 'venv', 'python2_source',
            \'_minted-', '.sass-cache', 'dist',
            \'.git', '.svn', '.hg']

let $FZF_DEFAULT_COMMAND = 'ag --hidden ' .
            \'--ignore "*.' . join(g:extesions_ignore, '" --ignore "*.') . '" ' .
            \'--ignore "' . join(g:ignore_dirs, '" --ignore "') . '" ' .
            \'-g ""'

"disable syntastic on a per buffer basis (some work files blow it up)
function! SyntasticDisableBuffer()
    let b:syntastic_mode = "passive"
    SyntasticReset
    echo 'Syntastic disabled for this buffer'
endfunction

command! SyntasticDisableBuffer call SyntasticDisableBuffer()
]])
vim.opt.secure = true
