filetype plugin indent on
set laststatus=2

let use_airline = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = 'RO'
" let g:airline_symbols.whitespace = ''let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:airline_symbols.whitespace = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

let mapleader = ","
let maplocalleader = ","

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'ternjs/tern_for_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-scripts/Rename2'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'lervag/vimtex'
Plug 'mtth/scratch.vim'
Plug 'pangloss/vim-javascript'
Plug 'alunny/pegjs-vim'
Plug 'LnL7/vim-nix'
Plug 'editorconfig/editorconfig-vim'
Plug 'moll/vim-bbye'
Plug 'nelsyeung/twig.vim'
Plug 'fsharp/vim-fsharp'
Plug 'syngan/vim-vimlint'
Plug 'ynkdir/vim-vimlparser'
Plug 'cespare/vim-toml'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'posva/vim-vue'
Plug 'jiangmiao/auto-pairs'
Plug 'chaoren/vim-wordmotion'

Plug 'Chiel92/vim-autoformat'

Plug 'Shougo/denite.nvim'

Plug 'padawan-php/deoplete-padawan'
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs'
Plug 'https://github.com/Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

let g:deoplete#enable_at_startup = 1
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:rainbow_active = 0
let g:rainbow_conf = { 'ctermfgs': [1, 3, 2, 6, 4, 5] }
Plug 'luochen1990/rainbow'

let g:neomake_error_sign = { 'text': '▶▶' }
let g:neomake_warning_sign = { 'text': '▶▶' }
Plug 'neomake/neomake'

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_error_symbol = '▶▶'
let g:syntastic_style_error_symbol = '▶▶'
let g:syntastic_warning_symbol = '▶▶'
let g:syntastic_style_warning_symbol = '▶▶'

if use_airline
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline#extensions#whitespace#enabled = 1
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif

let g:easytags_async = 1
set tags=./tags;
let g:easytags_dynamic_files = 1
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

let g:clang_library_path = "/run/current-system/sw/lib"
Plug 'Rip-Rip/clang_complete'

" let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.php = ['omni']
Plug 'shawncplus/phpcomplete.vim'

" let g:deoplete#enable_at_startup = 1
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:pandoc#keyboard#display_motions = 0
let g:pandoc#modules#disabled = ['chdir']
let g:pandoc#syntax#codeblocks#embeds#langs = ["js=javascript", "bash=sh"]
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

set exrc
set secure
set noswapfile

set lazyredraw

set gdefault
set wrap
set textwidth=80
set colorcolumn=80

set shortmess+=I
set noshowmode

set mouse=a
set hidden
set number
set relativenumber
set ignorecase
set incsearch
set nohlsearch
set wildignorecase
set conceallevel=0
set completeopt=menu

set clipboard=unnamedplus

set smartindent

set splitright
set splitbelow

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cinoptions+=:0
set cinoptions+=g0
set list
execute 'set listchars=tab:›\ ,nbsp:█,trail:·'

if !exists('g:syntax')
  let g:syntax = 1
  syntax on
endif

function! ToggleSyntaxHighlighting()
  let g:syntax = 1 - g:syntax
  if g:syntax == 1
    syntax on
  else
    syntax off
  endif
endfunction

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

highlight Search ctermbg=none ctermfg=none cterm=none
highlight IncSearch ctermbg=none ctermfg=none cterm=underline
highlight StatusLine ctermbg=none ctermfg=7
highlight clear WildMenu
highlight WildMenu cterm=reverse
highlight ExtraWhitespace ctermbg=19

nnoremap <silent> <c-b> :Buffers<cr>
noremap  <silent> <C-q> :Commands<cr>
nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <a-d> :Bdelete<cr>
nnoremap <silent> <a-q> :wqa<cr>
nnoremap <silent> <a-w> :update<cr>

nnoremap <silent> <leader>z :Goyo<cr>
nnoremap <silent> <leader>t :terminal<cr>

nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

nnoremap <silent> <s-tab> :bp<cr>
nnoremap <silent> <tab> :bn<cr>

inoremap <silent> <esc> <esc>:silent! update<cr>
inoremap <silent> <c-c> <c-c>:silent! update<cr>

noremap <silent> <space><space> /«<cr>"_cf»

noremap ; l
noremap l gk
noremap k gj
noremap j h
noremap h <nop>
nnoremap QQ gqip
nnoremap Qq gqq
nnoremap K <nop>
noremap $ g$
noremap 0 g^
noremap ^ g^

noremap <up> <nop>
noremap <right> <nop>
noremap <down> <nop>
noremap <left> <nop>

cnoremap <c-a> <home>
cnoremap <c-e> <end>
nnoremap <c-a> ^
nnoremap <c-e> $
inoremap <c-a> <esc>^
inoremap <c-e> <esc>$

nnoremap + <c-a>
nnoremap - <c-x>

nnoremap S i<cr><esc>

function! Tab_Or_Complete()
  if col('.') > 1 && strpart(getline('.'), col('.') - 2, 3) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <silent> <tab> <c-r>=Tab_Or_Complete()<cr>

command! -nargs=1 Tabs set ts=<args> sts=<args> sw=<args> noet
command! -nargs=1 Spaces set ts=10 sts=10 sw=<args> et

augroup FileTypes
  autocmd BufNewFile,BufEnter *.tex,*.cls,*.clo set filetype=tex
  autocmd BufNewFile,BufEnter *.scm,*.lisp RainbowToggleOn
augroup end

augroup Indentation
  autocmd BufNewFile,BufEnter *.tex,*.cls,*.clo Spaces 2
  autocmd BufNewFile,BufEnter *.zsh,*.sh,*.bash Spaces 2
  autocmd BufNewFile,BufEnter *.scm,*.lisp      Spaces 2
augroup end

augroup WriteOnFocusLost
  autocmd BufLeave,FocusLost * silent! wall
augroup end

augroup StripWhitespace
  autocmd BufEnter * EnableStripWhitespaceOnSave
augroup end

let g:last_bufnr = 1
augroup AlternateBuffer
  autocmd BufLeave * let g:last_bufnr = bufnr('%')
augroup end

augroup Xresources
  autocmd BufWrite *.Xresources :silent !xrdb %
augroup end

nnoremap <silent> [] :execute ':b' . g:last_bufnr<cr>

tnoremap <C-\> <C-\><C-n>

command! -bang -nargs=? -complete=file E e<bang> <args>
command! -bang -nargs=? -complete=file W w<bang> <args>
command! -bang -nargs=? -complete=file Wq wq<bang> <args>
command! -bang -nargs=? -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! ReloadFile e!

command! -nargs=1 Sp set spelllang=<args>

nnoremap <leader>f :call Format('%')<CR>

imap <C-q> <C-y>,

inoremap <C-j>u <C-r>=py3eval('str(__import__("uuid").uuid4())')<cr>
inoremap <C-j>d <C-r>=py3eval('str(__import__("datetime").datetime.now().isoformat())')<cr>
nmap sw ysiw

inoremap <leader>; <C-o>A;
