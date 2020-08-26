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

