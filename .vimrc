" 0. Load plugins
" ===============

call plug#begin('~/.vim/plugged')

" Basics
Plug 'tpope/vim-sensible'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Web
Plug 'tpope/vim-ragtag'

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
" iabbrev @@ adam@therealadam.com 
" iabbrev @tra @therealadam
" iabbrev @http http://therealadam.com
" iabbrev @gh http://github.com/therealadam
iabbrev cass cassandra
iabbrev teh the


"" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"" Looks

set background=dark
set t_Co=256
" colorscheme badwolf
" colorscheme Tomorrow-Night
colorscheme solarized

"" EasyMotion
let g:EasyMotion_do_shade=0

"" Quickly switch to the last file
nnoremap <leader><space> <c-^>

"" Use the OS X clipboard
" set clipboard=unnamed

"" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" Ack is so great
nnoremap <leader>A :Ack
nnoremap <leader>Aw :Ack <C-r><C-w>

"" Hard re-wrap paragraphs
nnoremap <leader>q gqip

"" Re-select text that was just yanked
nnoremap <leader>v V`]

"" Bounce out of insert mode
inoremap jj <ESC>

"" Quick split
nnoremap <leader>ww <C-w>v<C-w>l

" dont move cursor after pasting
noremap p p`[
noremap P P`[

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

"" Clojure
let g:vimclojure#ParenRainbow=1
let g:vimclojure#HighlightBuiltins=1

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

""" tagbar
map <silent> <Leader>tb :TagbarToggle<CR>

""" ctags, ctrlp refresh
function! Refresh()
  echo "refreshing tags and files..."

  !if [ -d .git ]; then git ls-files -c -o --exclude-standard | ctags -L -; else ctags -R; fi

  if exists(":ClearCtrlPCache") == 2
    ClearCtrlPCache
  endif
  echo "all the things, refreshed!"
endfunction

map <silent> <Leader>ct :call Refresh()<CR>

"" Don't let yankring poop in my home directory
let g:yankring_history_dir = '$HOME/.vim/'
let g:yankring_history_file = 'yankring.txt'

"" File finding gizmo (whichever I'm using today)
map <leader>f :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"" My own little test runner!
" map <leader>tf :call Focus()<cr>

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
  " set guifont=Cousine:h16
  " colorscheme pencil
  " set guifont=Menlo:h12
  " colorscheme base16-tomorrow
  " set guifont=Droid\ Sans\ Mono:h12
  set background=light
  colorscheme base16-solarized
  set macligatures
  set guifont=Fira\ Code\ Retina:h12
  set columns=90


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

"" vim-slime
let g:slime_target = "tmux"

" "" Make windows well-sized. Borrowed from GRB. Not sure if liking.
set winwidth=80
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999

"" vroom
let g:vroom_use_colors=1
let g:vroom_map_keys=0
let g:vroom_use_vimux=0
let g:vroom_use_dispatch=1
let g:vroom_use_spring=1
" let g:vroom_use_binstubs=1
map <leader>t :VroomRunTestFile<cr>
map <leader>tf :VroomRunNearestTest<cr>

"" vimux
map <leader>vp :VimuxPromptCommand<cr>
map <leader>vl :VimuxRunLastCommand<cr>
map <leader>vi :VimuxInspectRunner<cr>
map <leader>vq :VimuxCloseRunner<cr>
map <leader>vk :VimuxScrollUpInspect<cr>
map <leader>vj :VimuxScrollDownInspect<cr>

"" Dispatch
map <leader>d :Dispatch<cr>

"" Finger happiness
command! -buffer -bang -nargs=? G :execute <SNR>39_Git(<bang>0,<q-args>)
map <leader>G :Git 

"" Often, I like to see line numbers
map <leader>l :set number!<cr>

"" Fix gitgutter color in solarized-dark
highlight clear SignColumn
" highlight SignColumn ctermbg=0
" let g:gitgutter_signs = 0
" let g:gitgutter_highlight_lines = 1

"" Folding

" set foldmethod=indent
" set foldlevelstart=0
" set foldcolumn=3

nnoremap <Space> za
vnoremap <Space> za

" Refocus folds
nnoremap ,z zMzvzz

" neocomplcache
let g:neocomplcache_enable_cursor_hold_i = 1
let g:neocomplcache_enable_at_startup = 1

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" inoremap <expr><CR> neocomplcache#smart_close_popup()
inoremap <expr><TAB> pumvisible() ? "\<C-n>": "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure
autocmd FileType clojure set lispwords+=deftest
autocmd FileType clojure set lispwords+=testing
autocmd FileType clojure set lispwords+=defroutes
autocmd FileType clojure set lispwords+=defcomponent

autocmd FileType go setlocal foldmethod=syntax
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go compiler go
autocmd FileType go setlocal makeprg="go build"
autocmd FileType go set noexpandtab

" switch.vim

" nnoremap - :Switch<cr>

" better tmux/vim movement
let g:tmux_navigator_no_mappings = 1

nmap <silent> <ctrl-h> :TmuxNavigateLeft<cr>
nmap <silent> <ctrl-j> :TmuxNavigateDown<cr>
nmap <silent> <ctrl-k> :TmuxNavigateUp<cr>
nmap <silent> <ctrl-l> :TmuxNavigateRight<cr>
nmap <silent> <ctrl-\> :TmuxNavigatePrevious<cr>

nmap <silent> <leader>ty :Tyank
nmap <silent> <leader>tp :Tput

" NERDTree

map <leader>nc :NERDTreeCWD<cr>
map <leader>nt :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"" TO PILLAGE
" http://learnvimscriptthehardway.stevelosh.com/chapters/09.html
" https://github.com/janko-m/vim-test

