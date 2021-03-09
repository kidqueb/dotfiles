call plug#begin('~/.vim/plugged')
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	Plug 'mg979/vim-visual-multi'
	Plug 'alvan/vim-closetag'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdcommenter'
  Plug 'sbdchd/neoformat'
  Plug 'pantharshit00/vim-prisma'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
	Plug 'mattn/emmet-vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" base stuff.....
let g:netrw_banner = 0
let mapleader = ";"
filetype plugin on
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
set ignorecase " ignore case of letters
set smartcase  " override the 'ignorecase' when there is uppercase letters
set gdefault   " when on, the :substitute flag 'g' is default on
set number relativenumber
set so=100
set splitbelow
set splitright
set signcolumn=yes:1

let g:NERDCreateDefaultMappings = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Typescript
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
let g:closetag_filenames = '*.html, *.xhtml, *.xml, *.js, *.jsx, *.ts, *.tsx,*.md'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:AutoPairs = {
    \ '(': ')',
    \ '[': ']',
    \ '{': '}',
    \ '`': '`'
    \}

" Keys
nnoremap <C-S> :w<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>q :bp<CR>
nnoremap <Leader>e :bn<CR>
nnoremap <Leader>w :bd<CR>

nnoremap <leader>ff <cmd>Files<cr>
nnoremap <C-p> <cmd>GFiles<cr>

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Prettier 
augroup END

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" Coc
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'virtual'

"=======================
" Theme
set termguicolors
let ayucolor="mirage"
colorscheme ayu
highlight Comment cterm=italic gui=italic
