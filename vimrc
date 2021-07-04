syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set rnu
set smartcase
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set exrc
set secure

set colorcolumn=80
highlight ColorColumn ctermbg=30 guibg=lightgrey

filetype plugin on
set nocompatible

" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O



" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar


"if &term =~ '^xterm'
"    autocmd VimEnter * silent !echo -ne "\<Esc>[1 q"
"    " normal mode
"    let &t_EI .= "\<Esc>[1 q"
"    " insert mode
"    let &t_SI .= "\<Esc>[1 q"
"endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" Plugin for R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

" Vim 8 only
if !has('nvim')
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" Optional: for snippet support
" Further configuration might be required, read below
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:"
Plug 'honza/vim-snippets'

" Optional: better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end() 

colorscheme gruvbox
set background=dark

" Allow rg to always detect your root
" Also, use your .gitignore for faster searching
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let g:ctrlp_use_caching=0

" UltiSnips keymaps
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" Vimwiki configuration
" set path to vimwiki and make the syntax markdown
let g:vimwiki_list = [{'path': '/mnt/c/Users/kweedop/OneDrive\ -\ Research\ Triangle\ Institute/workwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" Associate the various file extensions to markdow syntax
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown', '.wiki': 'markdown'}
" Makes vimwiki markdown links as [text](text.md) rather than [text](text)
let g:vimwiki_markdown_link_ext = 1
" To use alternating colors for the heading levels
let g:vimwiki_hl_headers = 1

""" vim-markdown configuration
let g:markdown_folding = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" External command for date
nnoremap <leader>now i <C-r>=strftime('%Y%m%d')<CR>
" Go to the left window
nnoremap <leader>h :wincmd h<CR>
" Go to the right window
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Show the undotree
nnoremap <leader>u :UndoTreeShow<CR>
" Open directory and resize window to 30%
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" Rip grep 
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" Terminal shortcut
nnoremap <leader>tt :term<CR>

" vimwiki shortcuts
nnoremap <leader>ws :VimwikiSearch<SPACE>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
let g:ycm_filetype_blacklist = {}
" Probably move to php.vim
nnoremap <leader>a a->
nnoremap <leader>kv a<space>=><space>
