if (has("win32") || has("win64") || has("win32unix"))
    let g:isWin = 1
else
    let g:isWin = 0
endif
 
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
"maximize window
if (g:isWin)
    au GUIEnter * simalt ~x
endif

if (g:isGUI)
    set cursorline
    colorscheme wombat256
    hi cursorline guibg=#333333
    hi CursorColumn guibg=#333333
    set guifont=DejaVu_Sans_Mono:h14
endif


"nerdtree settings
" ===========================
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1 

" Automatic reloading of .vimrc
" ==============================
autocmd! bufwritepost .vimrc source %

" General 
" =========
set bg=dark
set encoding=utf-8
set tags=./tags
set mouse=a              
set bs=2                
set wildmode=list:longest " make TAB behave like in a shell


" better copy & paste
" ====================
set pastetoggle=<F2>
set clipboard=unnamed  " Operation such as yy,D and P work with the system clipboard

syntax on
" Rebind <leader> key
let mapleader = ","

" Quicksave command 
noremap <c-z> :update<CR>
vnoremap <c-z> <C-C>:update<CR>
inoremap <C-Z> <C-D>:update<CR>

" Quick quit command
noremap <Leader>e :q<CR> " Quick current window
noremap <Leader>er :q!<CR> 
noremap <Leader>E :qa!<CR>  " Quick all windows


" don't use tabs but spaces
set tabstop=4
set softtabstop=4     "tabs key indent by four spaces  
set shiftwidth=4
set shiftround
set expandtab         "convert tabs to whitespace

" easier moving of code blocks
vnoremap < <gv 
vnoremap > >gv
map <c-a> ggVG  " select all

" filetype
filetype off 
filetype plugin indent on



" Make case search insensitive
set hlsearch 
set incsearch
set ignorecase
set smartcase

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" setup Pathogen to manage your plugins
call pathogen#infect()
call pathogen#helptags()



" settings for powerline
" cd ~/.vim/bundle
" git clone https://github.com/Lokaltog/vim-powerline
set laststatus=2

" settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim
"let g:ctrip_max_height = 30
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|tmp)$',
  \ 'file': '\v\.(exe|so|dll|pdf|jpg|zip|DATä)$',
  \ }
"



" show line numbers and length
set nu
set t_Co =256
set tw=79 " width of document  (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't actomatically wrap text when typing
highlight ColorColumn ctermbg=233
highlight PmenuSel ctermbg=15 guibg=white



" DelimitMate
let delimitMate_expand_cr = 1


" UltiSnips
" =========
"let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-j>"


" Syntastic
" =========
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1

" Settings for jedi-vim
" =====================
let g:jedi#usages_command = "<leader>n"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>



" Close all folds when opening a new buffer
" zR to open all folds
" autocmd BufRead * setlocal foldmethod=marker
" autocmd BufRead * normal zM


let g:user_emmet_leader_key = '<c-y>'


" automatically adding executable bit to bash files
" =================================================
au BufWritePost *.sh silent !chmod +x <afile> 


let g:SuperTabDefaultCompletionType = "context"


" Movement
" =========
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map gf :edit <cfile><CR>

nnoremap <F5> :buffers<CR>:buffer<Space>

"tagbar settings
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'E:\ctags58\ctags'
