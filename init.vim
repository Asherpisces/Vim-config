"Default My Vim
set number
set mouse=a
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set termguicolors
set cursorline
syntax on

" ==== Plugin in here ====
call plug#begin('~/local/share/nvim/plugged')
" {Status bar}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" {Theme}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'tomasiser/vim-code-dark'
" {Terminal}
Plug 'voldikss/vim-floaterm'
" {File Browser}
Plug 'preservim/nerdTree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" {Syntax Highlight}
Plug 'jackguo380/vim-lsp-cxx-highlight'
" {Support Coding}
Plug 'jiangmiao/auto-pairs'
" {Minimap}
Plug 'wfxr/minimap.vim'
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

" {Highlight Syntax}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'uiiaoo/java-syntax.vim'
" {Sever Protocol Python}
Plug 'dense-analysis/ale'
" {Coc}
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Debugging
Plug 'puremourning/vimspector'
" other
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim' 
Plug 'preservim/nerdcommenter' 					" Comment code 
Plug 'liuchengxu/vista.vim' 					" Function tag bar 
call plug#end()

"Set Minimap
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
"Set floaterm
hi Floaterm guibg=Grey15
hi FloatermBorder guifg=Orange guibg=DarkGreen
let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_title = 'Hiep Terminal'
let g:floaterm_rootmerkets = ['.pro']
let g:lsp_cxx_hl_use_text_props = 1
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'


map <silent>	<F5>	:FloatermNew<CR>
map <silent>	<F7>	:below terminal<CR>
"Set nerdTree
map <silent>	<F2>	:NERDTree<CR>
"Set minimap
map <silent>	<F3>	:Minimap<CR>
map <silent>	<F4>	:MinimapClose<CR>
autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



" Default Onedark Theme
set background=dark
colorscheme codedark
let g:one_allow_italic=1

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme

" Highlight Syntax in Java
hi javaTypedef term=italic cterm=NONE ctermfg=LightGreen ctermbg=NONE gui=bold guifg=#60ff60 guibg=NONE






