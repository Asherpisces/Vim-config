"Default My Vim
set number
set mouse=a
set tabstop=4
set smarttab
set shiftwidth=4
"set encoding=utf-8
set termguicolors
set nu rnu
set ignorecase              " Enable case-sensitive 
set guicursor+=a:-Cursor-blinkwait175-blinkoff150-blinkon175

" Disable backup
set nobackup
set nowb
set noswapfile
set termguicolors


" " Optimize 
" set synmaxcol=200
" set lazyredraw
" au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype



syntax on


" ==== Plugin in here ====
call plug#begin('~/local/share/nvim/plugged')

" Code intellisense

Plug 'neoclide/coc.nvim',
\ {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'dense-analysis/ale'
Plug 'pappasam/coc-jedi',                     " Jedi language server 
Plug 'mattn/emmet-vim' 
Plug 'alvan/vim-closetag'                     " Auto close HTML/XML tag 
    \ { 
      \ 'do': 'yarn install '
              \ .'--frozen-lockfile '
              \ .'&& yarn build',
      \ 'branch': 'main' 
    \ }

" File Manager
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Code syntax highlight
Plug 'yuezk/vim-js'                           " Javascript
Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
Plug 'udalov/kotlin-vim'					  " Kotlin
Plug 'StanAngeloff/php.vim'

" Debugging
Plug 'puremourning/vimspector'                " Vimspector

" Source code version control 
Plug 'tpope/vim-fugitive'                     " Git infomation 
Plug 'tpope/vim-rhubarb' 
Plug 'airblade/vim-gitgutter'                 " Git show changes 
Plug 'samoshkin/vim-mergetool'                " Git merge

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'doums/darcula'
Plug 'ryanoasis/vim-devicons' " Icon
Plug 'joshdick/onedark.vim'
Plug 'bluz71/vim-nightfly-colors'
Plug 'ayu-theme/ayu-vim'
" Support Coding
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'          " Comment code 
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vista.vim'           " Function tag bar 
Plug 'nono/vim-handlebars' 		" Handlebars 

" Tag Bar
Plug 'https://github.com/preservim/tagbar'

" Highlight Syntax
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'uiiaoo/java-syntax.vim'
Plug 'https://github.com/ap/vim-css-color'

" Other

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
call plug#end()

" ===================== VIM AIRLINE =================
"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
  
"" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = 'ln'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.colnr='col'"


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#hunks#coc_git = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>)coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else 
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

"Set Folder manager
" We bind it to <leader>e here, feel free to change this
nmap <leader>e :CocCommand explorer<CR>
nmap <space>e <Cmd>CocCommand explorer<CR>

" Option for coc !important 
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

let ayucolor="dark"   " for dark version of theme
colorscheme ayu

hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi Normal guibg=NONE
hi Normal guibg=NONE ctermbg=NONE
" let g:lightline = { 'colorscheme': 'darculaOriginal' }
" let g:airline_theme= 'base16_default_dark'


" Highlight Syntax in Java
hi javaTypedef term=italic cterm=NONE ctermfg=LightGreen ctermbg=NONE gui=bold guifg=#60ff60 guibg=NONE

" Font
let g:enable_italic_font = 1
let g:enable_bold_font = 1

"highlight Comment cterm=italic gui=italic
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <c-p> :Files<cr>


" powerline symbols
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

let g:mustache_abbreviations = 1 " for handlebar

" hi! LineNr  ctermfg=8 ctermbg=NONE guifg=#65737e guibg=NONE

" Coc explorer Config
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }



" Use preset argument to open it
nmap <space>ed <Cmd>CocCommand explorer --preset .vim<CR>
nmap <space>ef <Cmd>CocCommand explorer --preset floating<CR>
nmap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>

" " ==================== LIGHT LINE ==================
" set noshowmode
" let g:lightline = {
"       \ 'colorscheme': 'ayu_mirage',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head'
"       \ },
"       \ }

" NERDTREE configs
"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
