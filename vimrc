" include plugins
execute pathogen#infect()

" compatibility
set nocompatible
set backspace=2
set hidden
set viminfo=
set mouse=a
set ttyfast
set lazyredraw
set splitbelow splitright
" copy mode, allows selection in a graphical terminal
nnoremap <leader>y :set nonumber<CR> :set mouse=<CR>
nnoremap <leader>Y :set number<CR> :set mouse=a<CR>
" toggle paste mode
nnoremap <leader>p :set paste!<CR>

" syntax
filetype plugin indent on
syntax enable

" indent
set expandtab
set autoindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" search
set wildmode=longest,list,full
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <leader>q :nohlsearch<CR>
nnoremap <leader>a :Ag!<space>
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" movement
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 5

" statusbar
set laststatus=2
set noshowmode

" decoration
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
set number
set relativenumber
set cursorline
set so=10
let g:airline#extensions#tabline#enabled = 1
set listchars=eol:↩,tab:→·,trail:~,extends:>,precedes:<,space:·
set list

" trailing spaces and tabs
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$\|\t\+/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\|\t\+/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\|\t\+/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\|\t\+/
autocmd BufWinLeave * call clearmatches()
function TrimWhitespace()
  let _s=@/
  %s/\s\+$//e
  let @/=_s
endfunction
nmap <leader>t :call TrimWhitespace()<CR>

" temp files
let g:netrw_dirhistmax = 0
set backupdir=~/.vimtmp/backup/
set directory=~/.vimtmp/swap/
set undodir=~/.vimtmp/undo/

" git link
function! CopyGitLink(...) range
  redir @+
  silent echo gitlink#GitLink(get(a:, 1, 0))
  redir END
endfunction
nmap <leader>gl :call CopyGitLink()<CR>
vmap <leader>gl :call CopyGitLink(1)<CR>
