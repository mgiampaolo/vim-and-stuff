" curl -fLO $HOME/.config/nvim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
set nocompatible	" be iMproved, required
filetype off		" required

source $HOME/.config/nvim/plug/c.vim

let g:mapleader=' '

" Vimspector
 " fun! GotoWindow(id)
 "   :call win_gotoid(a:id)
 " endfun
 " func! AddToWatch()
 "   let word = expand("<cexpr>")
 "   call vimspector#AddWatch(word)
 " endfunction
 " let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
 let g:vimspector_sidebar_width = 60
 nnoremap <leader>da :call vimspector#Launch()<CR>
 nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
 nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
 nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
 nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
 nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
 nnoremap <leader>di :call AddToWatch()<CR>
 nnoremap <leader>dx :call vimspector#Reset()<CR>
 nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
 nnoremap <leader>dk :call vimspector#StepOut()<CR>
 nnoremap <leader>dl :call vimspector#StepInto()<CR>
 nnoremap <leader>dj :call vimspector#StepOver()<CR>
 nnoremap <leader>d_ :call vimspector#Restart()<CR>
 nnoremap <leader>dn :call vimspector#Continue()<CR>
 nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
 nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
 nnoremap <leader>dbc :call vimspector#ToggleConditionalBreakpoint()<CR>

nmap <leader>te :sp<CR> ++ 10<C-W>- ++ :terminal<CR> ++ i
nmap <leader>cn :cnext<CR>
nmap <leader>cp :cprev<CR>
nmap <leader>w :w<CR>
" Coc
nmap <leader>ca :CocAction<CR>
nmap gd <Plug>(coc-definition)
inoremap <C-P> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>

" NERDTree
    " enable line numbers
let NERDTreeShowLineNumbers = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMapActivateNode='l'
let g:NERDTreeMapJumpParent='h'
nmap <leader>ntf :NERDTreeFind<CR>
map <silent> <C-n> :NERDTreeFocus<CR>

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber


" autocmd FileType go g/\<func\>/norm 0f{zfa{zR


" Highlighting
colorscheme gruvbox
syntax on
lua require'nvim-treesitter.configs'.setup { highlight = {enable = true } }


" General settings
inoremap jk <Esc>
nnoremap Y y$
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <CR> :noh<CR>
tnoremap <Esc> <C-\><C-n>
vnoremap < <gv
vnoremap > >gv

set nowrap
set signcolumn=yes
set smartcase
set incsearch hlsearch
set mouse=a
set noerrorbells
set smartindent
set ignorecase
set smartcase
set number relativenumber
set splitbelow splitright
" set wildmode=longest,list,full

" Tabbing
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4 softtabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" ------------------------------
" Maxizimizing
nmap <C-W>m :MaximizerToggle<CR>

" ------------------------------
"
" ------------------------------
" fzf search

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


map <Leader>rg :Rg<CR>
map <Leader>ff :Files<CR>
map <Leader>fl :BLines<CR>
map <Leader>fll :Lines<CR>

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
" let g:go_auto_sameids = 1		   " highlight matching identifiers	
let g:go_def_mapping_enabled = 0   " coc.vim will do `gd`
let g:go_term_enabled = 1          " opens terminal in split when using :GoTest for ex
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
