if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif " ==== Plugin in here ====
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

" Code syntax highlight
Plug 'yuezk/vim-js'                           " Javascript
Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
Plug 'udalov/kotlin-vim'					  " Kotlin

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
call plug#end()

