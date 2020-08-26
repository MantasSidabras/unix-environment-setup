" Explorer
nmap <silent><C-b> :CocCommand explorer<CR>
nmap <silent><leader>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

