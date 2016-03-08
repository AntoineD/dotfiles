set nocompatible
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug bootstrap

call plug#begin('~/.vim/plugged')

" Plug 'jalcine/cmake.vim' does not work
Plug 'vhdirk/vim-cmake'
" Plug 'altercation/vim-colors-solarized'
Plug 'romainl/flattened'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'hdima/python-syntax'
Plug 'matze/vim-move'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'hynek/vim-python-pep8-indent'
Plug 'wellle/targets.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'mileszs/ack.vim'
Plug 'ervandew/ag'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'majutsushi/tagbar'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ludovicchabant/vim-gutentags'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'tmux-plugins/vim-tmux'
Plug 'linktohack/vim-gfortran-compiler'
" Plug 'rdnetto/YCM-Generator'
" Plug 'Chiel92/vim-autoformat'
" Plug 'justinmk/vim-sneak'
" Plug 'osyo-manga/vim-over'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme
set t_Co=16 " Explicitly tell Vim that the terminal supports 16 colors
" set term=screen-256color

" set background=light
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
colorscheme flattened_dark

set number
set hlsearch   " switch on highlighting the last used search pattern.
" set ignorecase

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" do not history when leavy buffer
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

" Highlight the screen line of the cursor
set cursorline

" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬
"set listchars=tab:▸\ 
"set list

" indentation
" set smartindent

set completeopt=menuone,longest,preview

" use OS clipboard
set clipboard^=unnamedplus

let g:tex_flavor = "latex"
" set foldmethod=indent

if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

set wildignore+=*.o,*.so,*.pyc,tags
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 

" center current line on screen
set scrolloff=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
let g:syntastic_error_symbol='E'
let g:syntastic_warning_symbol='W'
let g:syntastic_style_error_symbol='SE'
let g:syntastic_style_warning_symbol='SW'
" let g:syntastic_mode_map = { 'mode': 'active',
"                            \ 'active_filetypes': ['python'],
"                            \ 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_max_height = 30
let g:ctrlp_extensions = ['tag']
:nmap <C-B> :CtrlPBuffer<CR>
:nmap <C-T> :CtrlPTag<CR>

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" if executable("ag")
"   let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnip
" to get ultisnip to work with YCM
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F6> :YcmDiags<CR>
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
" let g:ycm_semantic_triggers = {
"       \  'tex'  : ['{', '\'],
"       \ }
" function! g:UltiSnips_Complete()
"     call UltiSnips_ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips_JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction
" 
" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" au BufEnter * exec "snoremap <silent> " . g:UltiSnipsExpandTrigger . " <Esc>:call UltiSnips_ExpandSnippetOrJump()<cr>"

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
" replace f with sneak
" nmap f <Plug>Sneak_s
" nmap F <Plug>Sneak_S
" xmap f <Plug>Sneak_s
" xmap F <Plug>Sneak_S
" omap f <Plug>Sneak_s
" omap F <Plug>Sneak_S

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
let g:gutentags_ctags_options_file = '$HOME/.ctags'

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
endif

