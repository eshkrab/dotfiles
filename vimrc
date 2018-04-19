""""pathogen
execute pathogen#infect()
filetype plugin on

" IMPORTANT: Uncomment one of the following lines to force
" " using 256 colors (or 88 colors) if your terminal supports it,
" " but does not automatically use 256 colors by default.
set t_Co=256
" "set t_Co=88
" let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
" colorscheme apprentice

"COLORSCHEME
syntax enable
set background=dark
colorscheme base16-ateliersavanna
" or, for the light background mode:
" set background=light
" colorscheme base16-atelierdune
" or any of the other schemes:
" colorscheme base16-atelierforest
" colorscheme base16-atelierplateau
" colorscheme base16-atelierheath
" colorscheme base16-ateliercave
" colorscheme base16-ateliersulphurpool
" colorscheme base16-atelierlakeside
" colorscheme base16-atelierseaside
" colorscheme base16-atelierdune
" colorscheme base16-atelierestuary
let g:airline_theme='one'

" let g:csv_autocmd_arrange = 1

syn on
syntax enable
set number
" Be smart when using tabs ;)
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2

set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
set history=1000                " Store a ton of history (default is 20)

set showmode                    " display the current mode

if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
set noshowmode

" Linebreak on 500 characters
"set lbr
"set tw=500

set autoindent
" set si "Smart indent
set wrap "Wrap lines
set incsearch                   " find as you type search
set backspace=indent,eol,start  " backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " show matching brackets/parenthesis
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full
set wildignore=*.meta
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
" set foldenable                  " auto fold code
set list
set listchars=tab:,.,extends:#,nbsp:. " Highlight problematic whitespace

" make . work with visually selected lines
xnoremap . :norm.<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :w<CR>
nnoremap <Leader><Space> :w<CR>
       
"new line above or below
nnoremap <Leader>L :pu! _<CR>:']+1<CR>
nnoremap <Leader>l :pu  _<CR>:'[-1<CR>

" "Dash search
" :nmap <silent> <leader>d <Plug>DashSearch

"MOVEMENT
nnoremap j gj
nnoremap k gk

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"CAPS->HELP->ESC?
map  <Help> <Esc>
map! <Help> <Esc>
map  <Insert> <Esc>
map! <Insert> <Esc>

"toggle line numbers
nmap \1 :setlocal number!<CR>
"toggle paste
nmap \p :set paste!<CR>

cmap w!! w !sudo tee % >/dev/null

"ARDUINO
au BufRead,BufNewFile *.ino set filetype=arduino
call tcomment#DefineType('arduino', '//%s')

"C
au BufRead,BufNewFile *.c set filetype=c
call tcomment#DefineType('c', '//%s')

nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>; :CtrlPBuffer<CR>
" nnoremap <silent> <leader>r :CtrlPClearAllCaches<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dll$' }
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_mruf_relative = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:netrw_silent = 1

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" " shell for syntax highlighting purposes.
let g:is_posix = 1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


"Gundo
nnoremap <F5> :GundoToggle<CR>

"next and previous buffer
nmap <leader>n :bn<CR>
nmap <leader>b :bp<CR>

"more natural split opening
set splitbelow
set splitright

"Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v
nnoremap <silent> zz <C-w>n

"fzf
set rtp+=/usr/local/opt/fzf

""""""""""""""""""""""""""""""""""
"Vimux
""""""""""""""""""""""""""""""""""
let g:VimuxUseNearest =1
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

" Close normal app & run command
nnoremap <Leader>r :w<CR> :call VimuxSendKeys("^C")<CR> :VimuxRunLastCommand<CR>
" Close esp32 monitor & run command
nnoremap <Leader>u :w<CR> :call VimuxSendKeys("^]")<CR> :VimuxRunLastCommand<CR>

" Kill normal command
nnoremap <Leader>vk :call VimuxSendKeys("^C")<CR>
" Kill esp32 monitor
nnoremap <Leader>v] :call VimuxSendKeys("^]")<CR>

let g:tmux_navigator_save_on_switch =1
let g:tmux_navigator_disable_when_zoomed = 1

"try the built-in make
nnoremap <Leader>m :make<CR>
autocmd QuickFixCmdPost * copen

autocmd FileType python setlocal expandtab shiftwidth=4

" " autosource vimrc
" augroup VimrcSource
"   " autocmd! " Remove all autocmd's for the VimrcSource group
"   autocmd BufWritePost .vimrc source $MYVIMRC
" augroup END

set viminfo^=%


