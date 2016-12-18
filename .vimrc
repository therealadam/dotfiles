" 0. Load plugins
" ===============

call plug#begin('~/.vim/plugged')

" Basics
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-rooter'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Tools
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rizzatti/dash.vim'

" Syntaxes
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-ragtag'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'
Plug 'othree/javascript-libraries-syntax.vim' " ^ same

" Rails
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-colors-pencil'
Plug 'chriskempson/base16-vim'
Plug 'sjl/badwolf'
" Plug "flazz/vim-colorschemes"

" TODO
" vim-ruby-refactoring
" vim-textobj-rubyblock
" vim-textobj-user
" ack.vim/ctrlp/ctrlp-funky
" vim-fireplace, vim-classpath
" vim-align
" matchit
" paredit
" hardmode
" vim-markdown-folding

call plug#end()

" 1. New home for GUI stuff
if has("gui_macvim")
  nnoremap <D-1> :tabn 1<cr>
  nnoremap <D-2> :tabn 2<cr>
  nnoremap <D-3> :tabn 3<cr>
  nnoremap <D-4> :tabn 4<cr>
  nnoremap <D-5> :tabn 5<cr>
end

" ⍵ Legacy stuff
" =================

set nocompatible " Just say no to plain vi

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
" set number
set numberwidth=4

"" Disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Set some stuff
set showmode
set showcmd
set hidden
set cursorline

set wildmode=list:longest

" what files to ignore when doing filename completion, etc.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=vendor/gems/*,vendor/cache/*,.bundle,.sass-cache/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*
" Disable poop
set wildignore+=*/spec/reports/*,coverage/*,log

set visualbell
set ttyfast
set undofile

"" Load any customizations particular to this old host
" source ~HOME/.local.vim

"" Key binding
let mapleader=","
let maplocalleader=","

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"" Abbreviations

"" Looks
set background=light
colorscheme solarized

"" EasyMotion
let g:EasyMotion_do_shade=0

"" Quickly switch to the last file
nnoremap <leader><space> <c-^>

"" Use the OS X clipboard
" set clipboard=unnamed
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

"" File navigation, standing on GRB's shoulders
" Open files, limited to the directory of the current file, with <leader>gf
" This requires the %% mapping.
map <leader>gf :CtrlP %%<cr>

map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>gp :CtrlP public<cr>
map <leader>gs :CtrlP public/stylesheets<cr>

map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Make gvim nice
if has('gui_running')
  set background=dark
  colorscheme base16-solarized-dark
  set macligatures
  set guifont=Fira\ Code\ Retina:h14
  set columns=120


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
  end

  autocmd GUIEnter * :unmenu DrChip.
  autocmd GUIEnter * :unmenu Plugin.
  autocmd GUIEnter * :unmenu Syntax.
end

" "" Make windows well-sized. Borrowed from GRB. Not sure if liking.
set winwidth=83
set winminwidth=25
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999

"" Dispatch
map <leader>d :Dispatch<cr>

"" Finger happiness
command! -buffer -bang -nargs=? G :execute <SNR>39_Git(<bang>0,<q-args>)
map <leader>G :Git 

"" Often, I like to see line numbers
map <leader>l :set number!<cr>

"" Folding

set foldmethod=indent
set foldlevelstart=1
set foldcolumn=1

nnoremap <Space> za
vnoremap <Space> za

" Refocus folds
nnoremap ,z zMzvzz

" Completion
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer']
let g:deoplete#sources.ruby = ['buffer', 'tag', 'member']
let g:deoplete#sources.javascript = ['buffer', 'tag', 'member']

"" TO PILLAGE
" http://learnvimscriptthehardway.stevelosh.com/chapters/09.html

