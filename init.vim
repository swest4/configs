call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-scripts/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'OmniSharp/omnisharp-vim'
Plug 'posva/vim-vue'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'tomtom/tcomment_vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'andreshazard/vim-freemarker'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'github/copilot.vim'
Plug 'diepm/vim-rest-console'
call plug#end()

let mapleader = ','
map <C-n> :NERDTreeToggle<CR>
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <C-t> :tabnew split<CR>
inoremap jk <Esc>
nnoremap <leader>q :bp\|bd #<CR>

set mouse=a
source $VIMRUNTIME/mswin.vim

"Open NERDTree if opened without file args
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Close vim if only NERDTree open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set number

let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_enabled = 1

set expandtab shiftwidth=2 softtabstop=2 smarttab
set noshowcmd

let g:airline#extensions#tabline#enabled = 1

let g:strip_whitespace_on_save=1

set wildignore+=*/node_modules/*,*.so,*.swp,*.zip

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
set autoindent
let g:AutoPairsMapBS = 1
