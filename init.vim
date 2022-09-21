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
"set guicursor+=a:-Cursor-blinkwait175-blinkoff150-blinkon175

" Disable backup
set nobackup
set nowb
set noswapfile

" Optimize 
set synmaxcol=200
set lazyredraw
au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype


syntax on


" ==== Plugin in here ====
call plug#begin('~/local/share/nvim/plugged')

" File search
Plug 'junegunn/fzf', 
    \ { 'do': { -> fzf#install() } }            " Fuzzy finder 
Plug 'junegunn/fzf.vim'

" Code intellisense
Plug 'neoclide/coc.nvim', 
    \ {'branch': 'release'}                     " Language server protocol (LSP) 
Plug 'pappasam/coc-jedi',                     " Jedi language server 
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim' 
Plug 'alvan/vim-closetag'                     " Auto close HTML/XML tag 
    \ { 
      \ 'do': 'yarn install '
              \ .'--frozen-lockfile '
              \ .'&& yarn build',
      \ 'branch': 'main' 
    \ }

" Code syntax highlight
Plug 'yuezk/vim-js'                           " Javascript
Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
  
" Debugging
Plug 'puremourning/vimspector'                " Vimspector

" Source code version control 
Plug 'tpope/vim-fugitive'                     " Git infomation 
Plug 'tpope/vim-rhubarb' 
Plug 'airblade/vim-gitgutter'                 " Git show changes 
Plug 'samoshkin/vim-mergetool'                " Git merge

" {Status bar}
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" {Theme}
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'doums/darcula'
Plug 'ryanoasis/vim-devicons'
" {Status bar}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" {Support Coding}
Plug 'jiangmiao/auto-pairs'

" {Tag Bar}
Plug 'https://github.com/preservim/tagbar'

" {Highlight Syntax}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'uiiaoo/java-syntax.vim'
Plug 'https://github.com/ap/vim-css-color'
" {Sever Protocol Python}
Plug 'dense-analysis/ale'
" {Coc}
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" {Other}
Plug 'alvan/vim-closetag'
Plug 'preservim/nerdcommenter' 					" Comment code 
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vista.vim' 					" Function tag bar 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
call plug#end()


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

colorscheme darcula
let g:lightline = { 'colorscheme': 'darculaOriginal' }
let g:airline_theme= 'base16_default_dark'


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

" hi! LineNr  ctermfg=8 ctermbg=NONE guifg=#65737e guibg=NONE

