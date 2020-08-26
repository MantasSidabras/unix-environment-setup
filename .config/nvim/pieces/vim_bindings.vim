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

