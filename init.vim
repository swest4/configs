call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'posva/vim-vue'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
" Plug 'tomtom/tcomment_vim'
" Plug 'neoclide/vim-jsx-improve'
Plug 'numToStr/Comment.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'andreshazard/vim-freemarker'
" Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
" Plug 'barrett-ruth/import-cost.nvim', { 'do': './sh rtp/install.sh yarn' }
Plug 'github/copilot.vim'
Plug 'diepm/vim-rest-console'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'mcchrish/nnn.vim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'ap/vim-css-color'
Plug 'brenoprata10/nvim-highlight-colors'
" Themes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'navarasu/onedark.nvim'
call plug#end()

let mapleader = ','
map <C-n> :Neotree<CR>
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <C-t> :tabnew split<CR>
inoremap jk <Esc>
nnoremap <leader>q :bp\|bd #<CR>
nnoremap <C-p> :Telescope find_files hidden=true<cr>
nnoremap <C-g> :Telescope live_grep<cr>
nnoremap <C-f> :Telescope file_browser<cr>
nnoremap <C-j> :GitGutterNextHunk<cr>
inoremap <C-c> "+y
inoremap <silent> <C-j> <Plug>(copilot-next)
inoremap <silent> <C-k> <Plug>(copilot-prev)
inoremap <silent> <C-/> <Plug>(copilot-dismiss)

set mouse=a
source $VIMRUNTIME/mswin.vim

set number

" Disable Coc at startup (using Copilot currently)
let g:coc_start_at_startup = v:false

let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_enabled = 1
let g:ale_virtualtext_cursor=0
let g:copilot_node_command = 'node'

set expandtab shiftwidth=2 softtabstop=2 smarttab
set noshowcmd

let g:airline#extensions#tabline#enabled = 1

let g:strip_whitespace_on_save=1

set wildignore+=*/node_modules/*,*.so,*.swp,*.zip

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
set autoindent
let g:AutoPairsMapBS = 1

set clipboard=unnamed

" colorscheme darkblue
" colorscheme catppuccin-macchiato " catppuccin-latte, catppuccin-frappe, catppuccin, catppuccin-mocha
" colorscheme catppuccin-mocha
colorscheme tokyonight-night
" colorscheme tokyonight-storm
" colorscheme tokyonight-moon

highlight ALEWarning ctermbg=none cterm=underline
highlight ALEError ctermbg=none cterm=underline

let g:neo_tree_remove_legacy_commands = 1

set t_Co=256
set termguicolors

" Use <c-space> to trigger completiodn
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

lua << EOF
require("neo-tree").setup({
  window = {
    width = 32
  }
})
require('Comment').setup()
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "rust", "tsx" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})
-- require('onedark').setup {
--     style = 'deep'
-- }
-- require('onedark').load
require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
require('nvim-highlight-colors').setup {}
require("telescope").load_extension "file_browser"

EOF
