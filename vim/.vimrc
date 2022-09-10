set nocompatible

" dein begin
"
" `git clone https://github.com/Shougo/dein.vim
" ~/.cache/dein/repos/github.com/Shougo/dein.vim`
let dein_plugin_dir=$HOME.'/.cache/dein'
let dein_install_dir=dein_plugin_dir.'/repos/github.com/Shougo/dein.vim'
if isdirectory(dein_install_dir)
  let &runtimepath.=','.dein_install_dir
  call dein#begin(dein_plugin_dir)
  call dein#add(dein_install_dir)

  " languages
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('hashivim/vim-terraform')
  call dein#add('jeroenbourgois/vim-actionscript')
  call dein#add('keith/swift.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('mustache/vim-mustache-handlebars')
  call dein#add('mxw/vim-jsx')
  call dein#add('pangloss/vim-javascript')
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('rust-lang/rust.vim')
  call dein#add('udalov/kotlin-vim')

  call dein#add('ctrlpvim/ctrlp.vim')
  let g:ctrlp_match_window = 'bottom,order:ttb'
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'rg --files --hidden --color=never --glob "" %s'
  let g:ctrlp_working_path_mode = 0

  call dein#add('iautom8things/gitlink-vim')
  function! CopyGitLink(...) range
    redir @+
    silent echo gitlink#GitLink(get(a:, 1, 0))
    redir END
  endfunction
  nmap <leader>gl :call CopyGitLink()<CR>
  vmap <leader>gl :call CopyGitLink(1)<CR>

  call dein#add('mileszs/ack.vim')
  let g:ackprg = 'rg --vimgrep'
  nnoremap <leader>a :Ack!<space>
  nnoremap <leader>A :Ack!<CR>
  nmap <leader>w :cclose<CR>

  call dein#add('morhetz/gruvbox')
  let g:gruvbox_italic=1
  set background=dark
  colorscheme gruvbox

  call dein#add('vim-airline/vim-airline')
  let g:airline#extensions#tabline#enabled = 1

  call dein#add('yssl/QFEnter')
  let g:qfenter_keymap = {}
  let g:qfenter_keymap.vopen = ['<C-v>']
  let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
  let g:qfenter_keymap.topen = ['<C-t>']

  " dein end
  call dein#end()
  if dein#check_install()
    call dein#install()
  endif
endif

" enable filetypes after all plugins
filetype plugin indent on
syntax enable

" mouse
set mouse=a
set ttymouse=sgr

" split in sane direction
set splitbelow
set splitright

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

" statusbar
set laststatus=2
set noshowmode

" line numbers
set number
set relativenumber
set scrolloff=10

" decoration
set cursorline
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
set viminfo=
set backupdir=~/.vimtmp/backup//
set directory=~/.vimtmp/swap//
set undodir=~/.vimtmp/undo//

map <leader>z :tab split<CR>
