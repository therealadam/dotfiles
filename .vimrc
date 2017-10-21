" 0. Load plugins
" ===============

call plug#begin('~/.vim/plugged')

" Basics
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-rooter'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Tools
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Syntaxes
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-ragtag'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ElmCast/elm-vim'

" Rails
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'

" Colorschemes and aesthetics
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'

call plug#end()

" ⍵ Legacy stuff
" =================

set nocompatible " Just say no to plain vi
set autoindent

"" Live dangerously, don't use a swapfile
set noswapfile

"" I like pointing devices
set mouse=a

"" Whitespace
set tabstop=2 shiftwidth=2
set expandtab

"" Searching
set ignorecase
set smartcase
set showmatch
set gdefault
nnoremap / /\v
vnoremap / /\v
nnoremap <CR><CR> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"" Handle long lines
" set wrap
set colorcolumn=80
nnoremap j gj
nnoremap k gk

"" Margin line numbers
set number
set numberwidth=4

"" Disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Set some stuff
set showmode
set showcmd
set hidden

set wildmode=list:longest

" what files to ignore when doing filename completion, etc.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=vendor/gems/*,vendor/cache/*,.bundle,.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=*/spec/reports/*,coverage/*,log

set visualbell
set undofile

"" Key binding
let mapleader=","
let maplocalleader=","

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"" EasyMotion
let g:EasyMotion_do_shade=0

"" Quickly switch to the last file
nnoremap <leader><space> <c-^>

"" Use the OS X clipboard
set clipboard=unnamed
map <leader>y "*y

"" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" Ack is so great
nnoremap <leader>A :Ack
nnoremap <leader>Aw :Ack <C-r><C-w>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"" Re-select text that was just yanked
nnoremap <leader>v V`]

" dont move cursor after pasting
noremap p p`[
noremap P P`[

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

""" surround
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}" " v
let g:surround_35  = "#{\r}" " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"  " -
let g:surround_61 = "<%= \r %>" " =

"" File finding gizmo (whichever I'm using today)
map <leader>f :Files<cr>
map <leader>b :Buffers<cr>

map <leader>e :edit %%

" Make gvim nice
if has('gui_running')
  colorscheme solarized
  set macligatures
  set guifont=Inconsolata:h14
  set columns=140


  " Kill UI cruft
  set go-=T
  set go-=L
  set go-=l
  set go-=r
  set go-=R

  " Different cursors for different modes.
  set guicursor=n-c:block-Cursor-blinkon0
  set guicursor+=v:block-vCursor-blinkon0
  set guicursor+=i-ci:ver20-iCursor

  " Totally stolen from sjl
  if has("gui_macvim")
    " Full screen means FULL screen
    set fuoptions=maxvert,maxhorz

    " Use the normal HIG movements, except for M-Up/Down
    let macvim_skip_cmd_opt_movement = 1
    no   <D-Left>       <Home>
    no!  <D-Left>       <Home>
    no   <M-Left>       <C-Left>
    no!  <M-Left>       <C-Left>

    no   <D-Right>      <End>
    no!  <D-Right>      <End>
    no   <M-Right>      <C-Right>
    no!  <M-Right>      <C-Right>

    no   <D-Up>         <C-Home>
    ino  <D-Up>         <C-Home>
    imap <M-Up>         <C-o>{

    no   <D-Down>       <C-End>
    ino  <D-Down>       <C-End>
    imap <M-Down>       <C-o>}

    imap <M-BS>         <C-w>
    inoremap <D-BS>     <esc>my0c`y

    set foldcolumn=1

    nnoremap <D-1> :tabn 1<cr>
    nnoremap <D-2> :tabn 2<cr>
    nnoremap <D-3> :tabn 3<cr>
    nnoremap <D-4> :tabn 4<cr>
    nnoremap <D-5> :tabn 5<cr>

    autocmd GUIEnter * :unmenu Syntax.
  end
end

"" Make windows well-sized. Borrowed from GRB. Not sure if liking.
set winwidth=90
set winminwidth=35

" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=20
set winminheight=20
set winheight=999

"" Dispatch
map <leader>d :Dispatch<cr>

"" Finger happiness
command! -buffer -bang -nargs=? G :execute <SNR>39_Git(<bang>0,<q-args>)
map <leader>G :Git 

"" Often, I like to see line numbers
map <leader>l :set number!<cr>

nnoremap <Space> za
vnoremap <Space> za

" don't hit escape
inoremap jj <Esc>

" Show whitespace
set listchars=tab:>-,trail:-
set list

" Linting

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

nmap <silent> [l <Plug>(ale_previous_wrap)
nmap <silent> ]l <Plug>(ale_next_wrap)

let g:ale_lint_on_text_changed="never"
let g:ale_lint_on_save=1

" GitGutter

let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" Lightline
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction


function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction


function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction


autocmd User ALELint call s:MaybeUpdateLightline()


" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" XXX add branch name
