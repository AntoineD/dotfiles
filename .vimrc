set nocompatible
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle bootstrap

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'hdima/python-syntax'
Plugin 'matze/vim-move'
Plugin 'bling/vim-airline'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'wellle/targets.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/ag'
Plugin 'Chiel92/vim-autoformat'
" Plugin 'justinmk/vim-sneak'
" Plugin 'osyo-manga/vim-over'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme
set t_Co=16 " Explicitly tell Vim that the terminal supports 16 colors

" set background=light
set background=dark
colorscheme solarized
" let g:solarized_termcolors=256

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
let g:syntastic_error_symbol='E'
let g:syntastic_warning_symbol='W'
let g:syntastic_style_error_symbol='SE'
let g:syntastic_style_warning_symbol='SW'
" let g:syntastic_mode_map = { 'mode': 'active',
"                            \ 'active_filetypes': ['python'],
"                            \ 'passive_filetypes': [] }
" let g:syntastic_auto_loc_list=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
set wildignore+=*.o,*.so,*.pyc,tags
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 
let g:ctrlp_max_height = 30
let g:ctrlp_extensions = ['tag']
:nmap <C-B> :CtrlPBuffer<CR>
:nmap <C-T> :CtrlPTag<CR>

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

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
