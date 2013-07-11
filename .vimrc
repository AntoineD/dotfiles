set nocompatible
filetype indent plugin on
syntax on

" VAM install location:
let plugin_root_dir = expand('$HOME/.vim/vim-addons')

let &rtp.=(empty(&rtp)?'':',').plugin_root_dir.'/vim-addon-manager'

call vam#ActivateAddons([
\ 'Solarized',
\ 'unimpaired',
\ 'UltiSnips',
\ 'sleuth', 
\ 'ctrlp',
\ 'Syntastic',
\ 'Powerline',
\ 'tComment',
\ 'YouCompleteMe',
\ 'python%790'],
\ {'auto_install' : 0})


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme
set t_Co=16 " Explicitly tell Vim that the terminal supports 16 colors

" let g:solarized_termcolors=256
colorscheme solarized
" set background=light
set background=dark


set number
" set ruler       " show the cursor position all the time
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set incsearch       " do incremental searching
set hlsearch   " switch on highlighting the last used search pattern.
set ignorecase

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl s to save
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>

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
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Source the vimrc file after saving it
au bufwritepost .vimrc source $MYVIMRC

" no automatic backup and no swapfile
set nobackup
set nowritebackup
set noswapfile

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" exit insert mode
inoremap <C-c> <Esc>

" Highlight the screen line of the cursor
" set cursorline

" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ 
" set listchars=
set list

" indentation
set smartindent
set autoindent

" keep the cursor centered in the window
set scrolloff=10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 textwidth=79
" For full syntax highlighting
let python_highlight_all=1
" Folding based on indentation
" set foldmethod=indent
let g:python_version_2 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .fsui stuff
au BufRead,BufNewFile *.fsui setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
set completeopt=menuone,longest,preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_colorscheme = 'solarized'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python'],
                           \ 'passive_filetypes': [] }
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" let g:syntastic_error_symbol='X'
" let g:syntastic_warning_symbol='!'
" let g:syntastic_auto_loc_list=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
set wildignore+=*.o,*.so,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 
let g:ctrlp_max_height = 30
let g:ctrlp_extensions = ['tag']
:nmap <C-B> :CtrlPBuffer<CR>
:nmap <C-T> :CtrlPTag<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-jedi
let g:jedi#use_tabs_not_buffers = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnip
" to get ultisnip to work with YCM
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
" let g:ycm_key_invoke_completion = '<TAB>'
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
