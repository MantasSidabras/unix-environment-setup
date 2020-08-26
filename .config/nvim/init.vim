let mapleader=" "
set timeout timeoutlen=1500

imap jk <Esc>
nmap <M-;> msA;<ESC>`s
" Ctrl + n to clear search highlight
nmap <silent> <C-n> :nohl<CR>
nmap <silent> <CR> :nohl<CR>
" nmap <C-\> :wq<CR>
autocmd InsertEnter * norm zz
nmap <silent> <Esc> :w<CR>
nmap <silent> W :w<CR>
nmap <silent> <C-w> :w<CR>
nmap <silent> Q :q<CR>
nmap <silent> <C-q> :q<CR>

set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set noswapfile  " ignore swap file

set expandtab	" Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab

set splitbelow
set splitright

" copy paste to real clipboard
set clipboard=unnamedplus
" noremap <Leader>y "+y
" noremap <Leader>p "+p
" noremap <Leader>Y "+Y
" noremap <Leader>P "+P

set mouse=a

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd InsertLeave * set relativenumber
  autocmd InsertEnter   * set norelativenumber
  " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  " autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

syntax on
colorscheme gruvbox

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-DOWN> <C-W><C-J>
nnoremap <C-UP> <C-W><C-K>
nnoremap <C-RIGHT> <C-W><C-L>
nnoremap <C-LEFT> <C-W><C-H>

call plug#begin('~/config/nvim/bundle')
  Plug 'w0rp/ale'
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'leafgarland/typescript-vim'
  Plug 'tpope/vim-surround'
  Plug 'machakann/vim-highlightedyank'
  Plug 'junegunn/fzf.vim', {'do': { -> fzf#install() }}

  Plug 'sheerun/vim-polyglot'
  Plug 'numirias/semshi' " python static analysis highlight
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" let g:airline_theme='onehalfdark'

let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 200
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" let g:ale_linters = {
      " \   'python': ['flake8'],
      " \   'javascript': ['eslint'],
      " \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

" Explorer
nmap <silent><C-b> :CocCommand explorer<CR>
nmap <silent><leader>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <F2> <Plug>(coc-rename)
set updatetime=300

" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


set rtp+=~/.fzf
nnoremap <C-f> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

let g:highlightedyank_highlight_duration = 300

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

