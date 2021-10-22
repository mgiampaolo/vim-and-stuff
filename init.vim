" curl -fLO $HOME/.config/nvim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
set nocompatible	" be iMproved, required
filetype off		" required

call plug#begin('~/.config/nvim/plugged')
" Visual
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

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

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'} " Recommendation: updating the parsers on update
Plug 'nvim-treesitter/playground'

" Snippets
		" Track the engine.
Plug 'SirVer/ultisnips'

		" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Completion and GD
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
endif

"Plug 'mikelue/vim-maven-plugin'
cal plug#end()

" Coc
nmap gd <Plug>(coc-definition)



" NERDTree
" enable line numbers
let NERDTreeShowLineNumbers = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMapActivateNode='l'
let g:NERDTreeMapJumpParent='h'

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
map <silent> <C-n> :NERDTreeFocus<CR>


" Highlighting
colorscheme gruvbox
syntax on
lua require'nvim-treesitter.configs'.setup { highlight = {enable = true } }

let g:mapleader=' '

" General settings
inoremap jk <Esc>
nnoremap Y y$
nnoremap <leader>y "+y
vnoremap <leader>y "+y
tnoremap <Esc> <C-\><C-n>


set nowrap
set signcolumn=yes
set smartcase
set hlsearch
set noerrorbells
set smartindent
set number relativenumber
set mouse=a

" Tabbing
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4 softtabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" ------------------------------
" New Plugin

" ------------------------------
" ------------------------------
" Ulti Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ------------------------------

" ------------------------------
" vim-go
let g:go_list_type = "quickfix"    " error lists are of type quickfix
let g:go_fmt_command = "goimports" " automatically format and rewrite imports
let g:go_auto_sameids = 1		   " highlight matching identifiers	
let g:go_def_mapping_enabled = 0   " coc.vim will do `gd`
let g:go_term_enabled = 1
" ------------------------------

" ------------------------------
" Coc
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> rn <Plug>(coc-rename)

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-java'
  \ ]


" Smooth scrolling
function SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 7m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <silent> <C-U> :call SmoothScroll(1)<Enter>
nnoremap <silent> <C-D> :call SmoothScroll(0)<Enter>
inoremap <silent> <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <silent> <C-D> <Esc>:call SmoothScroll(0)<Enter>i
