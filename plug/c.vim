call plug#begin('~/.config/nvim/plugged')
" Visual
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'

" Marks
Plug 'kshenoy/vim-signature'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Commanding
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Exploring
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'airblade/vim-rooter'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'} " Recommendation: updating the parsers on update
Plug 'nvim-treesitter/playground'

" For writing in 'focus' mode
Plug 'junegunn/goyo.vim'

" Snippets
		" Track the engine.
Plug 'SirVer/ultisnips'

		" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Debugging
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Completion and GD
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lspconfig'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
endif

"Plug 'mikelue/vim-maven-plugin'
cal plug#end()
