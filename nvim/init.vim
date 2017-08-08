filetype plugin indent on
set laststatus=2

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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-scripts/Rename2'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'mtth/scratch.vim'
Plug 'pangloss/vim-javascript'
Plug 'alunny/pegjs-vim'
Plug 'LnL7/vim-nix'
Plug 'editorconfig/editorconfig-vim'
Plug 'moll/vim-bbye'
Plug 'nelsyeung/twig.vim'
Plug 'syngan/vim-vimlint'
Plug 'ynkdir/vim-vimlparser'
Plug 'cespare/vim-toml'

let g:neomake_error_sign = { 'text': '▶▶' }
let g:neomake_warning_sign = { 'text': '▶▶' }
Plug 'neomake/neomake'

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_error_symbol = '▶▶'
let g:syntastic_style_error_symbol = '▶▶'
let g:syntastic_warning_symbol = '▶▶'
let g:syntastic_style_warning_symbol = '▶▶'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
" set infercase
set incsearch
set nohlsearch
set wildignorecase
set conceallevel=2
set completeopt=menu

set clipboard=unnamedplus

set splitright
set splitbelow

set noexpandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cinoptions+=:0
set cinoptions+=g0
set list
execute 'set listchars=tab:›\ '

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

nnoremap <c-b> :Buffers<cr>
nnoremap <c-c> :Commands<cr>
nnoremap <c-p> :Files<cr>
nnoremap <silent> <a-d> :Bdelete<cr>
nnoremap <silent> <a-q> :wqa<cr>
nnoremap <silent> <a-w> :update<cr>

nnoremap <silent> <leader>z :Goyo<cr>
nnoremap <silent> <leader>t :terminal<cr>

nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

nnoremap <s-tab> :bp<cr>
nnoremap <tab> :bn<cr>

nnoremap <c-u> mpgUiw`p
nnoremap <c-l> mpguiw`p
imap <c-u> <esc>mpgUiw`pa
imap <c-l> <esc>mpguiw`pa
inoremap <silent> <esc> <esc>:silent! update<cr>
inoremap <silent> <c-c> <c-c>:silent! update<cr>

inoremap jk <esc>

noremap ; l
noremap l gk
noremap k gj
noremap j h
noremap h <nop>

nnoremap Q vipgqq
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

augroup FileTypes
  autocmd BufNewFile,BufEnter *.tex,*.cls,*.clo set filetype=tex
  autocmd BufNewFile,BufEnter *.zsh,*.sh,*.bash set ts=2 sts=2 sw=2
augroup end

augroup SaveOnFocusLost
  autocmd BufLeave,FocusLost * silent! wall
augroup end

augroup BetterWhitespace
  autocmd BufEnter * EnableStripWhitespaceOnSave
augroup end

augroup FormatCommands
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
