" set nocompatible
" filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug bootstrap

call plug#begin('~/.config/nvim/plugged')

if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

""""""""""""""""""""""""""""
" theme
" Plug 'overcache/NeoSolarized'
" Plug 'romainl/flattened'
" Plug 'altercation/vim-colors-solarized'
Plug 'ishan9299/nvim-solarized-lua'
""""""""""""""""""""""""""""
" misc
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-obsession'
" Plug 'neomake/neomake'
Plug 'bfredl/nvim-miniyank'
" Plug 'romainl/vim-cool'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'linktohack/vim-gfortran-compiler'
" Plug 'vhdirk/vim-cmake'
" Plug 'jalcine/cmake.vim' does not work
" Plug 'romainl/vim-qlist'
" Plug 'igankevich/mesonic'
"""""""""""""""""""""""""""""
" file system
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'FelikZ/ctrlp-py-matcher'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
" Plug 'tpope/vim-vinegar'
"""""""""""""""""""""""""""""
" commentaries
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-commentary'
"""""""""""""""""""""""""""""
" status line
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"""""""""""""""""""""""""""""
" snippets
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'honza/vim-snippets'
"""""""""""""""""""""""""""""
" syntax
" " Plug 'dense-analysis/ale'
" " Plug 'hdima/python-syntax'
" " Plug 'gu-fan/riv.vim'
" Plug 'chase/vim-ansible-yaml'
" Plug 'vimjas/vim-python-pep8-indent'
" Plug 'honza/dockerfile.vim'
" Plug 'martinda/Jenkinsfile-vim-syntax'
" Plug 'cespare/vim-toml'
Plug 'sheerun/vim-polyglot'
Plug 'linkinpark342/xonsh-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"""""""""""""""""""""""""""""
" editing
Plug 'wellle/targets.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'justinmk/vim-sneak'
" Plug 'matze/vim-moveovercache
" Plug 'osyo-manga/vim-over'
" Plug 'LaTeX-Box-Team/LaTeX-Box'
"""""""""""""""""""""""""""""
" grepping
Plug 'mhinz/vim-grepper'
" Plug 'mileszs/ack.vim'
" Plug 'ervandew/ag'
"""""""""""""""""""""""""""""
" completion
" Plug 'ycm-core/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'stsewd/sphinx.nvim', { 'do': ':UpdateRemotePlugins' }
"""""""""""""""""""""""""""""
" code navigation
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'bronson/vim-trailing-whitespace'
Plug 'MarcWeber/vim-addon-local-vimrc'
"""""""""""""""""""""""""""""
" testing
Plug 'vim-test/vim-test'
Plug '5long/pytest-vim-compiler'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC.nvim
source ~/dotfiles/vimrc-coc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme
if has("termguicolors")
  set termguicolors
endif

colorscheme solarized
let g:solarized_italics = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight the screen line of the cursor
set cursorline

set number
set hlsearch   " switch on highlighting the last used search pattern.
" set ignorecase
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" python used
" let g:python_host_prog=0
" let g:python3_host_prog="/home/antoine.dechaume/.conda/envs/vim/bin/python"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" do not use history when leavy buffer
set hidden

" leader q to quit without saving
noremap  <leader>q :quit<CR>
vnoremap <leader>q <C-C>:quit<CR>
inoremap <leader>q <Esc>:quit<CR>

" leader w to delete buffer
noremap  <leader>w :bdelete<CR>
vnoremap <leader>w <C-C>:bdelete<CR>
inoremap <leader>w <Esc>:bdelete<CR>

" leader s to save
noremap  <leader>s :update<CR>
vnoremap <leader>s <C-C>:update<CR>
inoremap <leader>s <Esc>:update<CR>

" inoremap jk <Esc>

" no arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" line motion
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

" Source the vimrc file after saving it
au bufwritepost .vimrc source $MYVIMRC

" no automatic backup and no swapfile
set nobackup
set nowritebackup
set noswapfile

" exit insert mode
inoremap <C-c> <Esc>

" indentation
" set smartindent

set completeopt=menuone,longest,preview

" use OS clipboard
set clipboard^=unnamedplus

" set foldmethod=indent

set wildignore+=*.o,*.so,*.pyc,tags
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.tox/*

" center current line on screen
set scrolloff=1000

if exists('&inccommand')
  set inccommand=split
endif

" no double space after . when reformating
set nojoinspaces

" autocmd FileType python setlocal textwidth=0
autocmd FileType python setlocal fo-=t

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
  set guicursor=
  " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grepper
nnoremap <leader>g :Grepper<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
let g:grepper = {}
" let g:grepper.prompt_mapping_tool = '<leader>g'
let g:grepper.tools = ['rg', 'grep', 'git']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
nmap <leader>b :Buffer<CR>
nmap <leader>f :Files<CR>
" nmap <leader>g :GFiles<CR>
nmap <leader>t :Tags<CR>
nmap <leader>h :History<CR>
nmap <leader>c :Commands<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-move
let g:move_key_modifier = 'C'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_linecolumn_prefix = '¶ '
let g:airline#extensions#branch#symbol = '⎇ '
" let g:airline#extensions#paste#symbol = 'ρ'
" let g:airline#extensions#paste#symbol = 'Þ'
let g:airline#extensions#paste#symbol = '∥'
" let g:airline#extensions#whitespace#symbol = 'Ξ'
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-sneak
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" latex box
let g:LatexBox_quickfix = 2
let g:LatexBox_show_warnings = 0
let g:LatexBox_build_dir = './build'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
set tags=./.tags;
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neomake
let g:neomake_open_list = 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" riv
set nofoldenable
let g:riv_disable_folding = 1
let g:riv_fold_auto_update = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dispatch
" nnoremap <leader>b :Dispatch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-miniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-cycle)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc-snippet.nvim

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" let g:coc_snippet_next = '<tab>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sphinx_html_output_dirs = [
      \ '_build/html', 'build/html',
      \ 'doc',
      \]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" treesitter
lua << EOF
  require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-test
nmap <silent> <leader>Tn :TestNearest<CR>
nmap <silent> <leader>Tf :TestFile<CR>
nmap <silent> <leader>Ts :TestSuite<CR>
nmap <silent> <leader>Tl :TestLast<CR>
nmap <silent> <leader>Tv :TestVisit<CR>
let test#strategy = "neovim"
