if &compatible
  set nocompatible
endif

let dein_plugin_dir=$HOME.'/.vim/dein'
let dein_install_dir=dein_plugin_dir.'/repos/github.com/Shougo/dein.vim'
let &runtimepath.=','.dein_install_dir
if dein#load_state(dein_plugin_dir)
  call dein#begin(dein_plugin_dir)
  call dein#add(dein_install_dir)

  " languages
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('jeroenbourgois/vim-actionscript')
  call dein#add('keith/swift.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('mustache/vim-mustache-handlebars')
  call dein#add('mxw/vim-jsx')
  call dein#add('pangloss/vim-javascript')
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('rust-lang/rust.vim')
  call dein#add('udalov/kotlin-vim')

  " tools
  call dein#add('bling/vim-airline')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('iautom8things/gitlink-vim')
  call dein#add('mileszs/ack.vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('qpkorr/vim-renamer')
  call dein#add('yssl/QFEnter')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" compatibility
set backspace=2
set hidden
set viminfo=
set mouse=a
set ttyfast
set lazyredraw
set splitbelow splitright
set ttymouse=sgr
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
nnoremap <leader>a :Ack!<space>
nnoremap <leader>A :Ack!<CR>
nmap <leader>w :cclose<CR>
let g:ackprg = 'ag --vimgrep'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

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

" QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

map <leader>z :tab split<CR>
