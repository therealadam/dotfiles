set nocompatible " Just say no to plain vi
syntax enable
set encoding=utf-8
filetype plugin indent on " load file type plugins and indentation
set shell=/bin/sh

"" Live dangerously, don't use a swapfile
set noswapfile

"" Whitespace
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

"" Searching
set hlsearch
set incsearch
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
set wrap " maybe switch to sidescroll instead of wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
nnoremap j gj
nnoremap k gk

"" Invisibles
set list
set listchars=tab:▸\ ,eol:¬

"" Margin line numbers
set number
set numberwidth=6

"" Disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Set some stuff
set scrolloff=1 " Keep 1 line of context around the cursor at all times
set autoindent " Match the next line's indent to the current line
set showmode
set showcmd
set hidden

set wildmenu
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
set wildignore+=*/spec/reports/*,coverage/*

set visualbell
set ttyfast
set ruler
set laststatus=2
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

"" Looks

set background=dark
set t_Co=256
colorscheme badwolf

"" Pathogen
call pathogen#infect()
call pathogen#helptags()

"" Quickly switch to the last file
nnoremap <leader><leader> <c-^>

"" Use the OS X clipboard
" set clipboard=unnamed

"" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" Ack is so great
nnoremap <leader>A :Ack
nnoremap <leader>Aw :Ack <C-r><C-w>

"" Fold HTML tags
nnoremap <leader>ft Vatzf

"" Hard re-wrap paragraphs
nnoremap <leader>q gqip

"" Re-select text that was just yanked
nnoremap <leader>v V`]

"" Bounce out of insert mode
inoremap jj <ESC>

"" Quick split
nnoremap <leader>ww <C-w>v<C-w>l

"" Clojure
let g:vimclojure#ParenRainbow=1
let g:vimclojure#HighlightBuiltins=1
" let g:vimclojure#WantNailgun=1
" let g:vimclojure#SplitPos="bottom"
" let g:vimclojure#SplitSize=10


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

" Powerline
let g:Powerline_symbols = 'fancy'

" Make gvim nice
if has('gui_running')
  set guifont=Menlo:h18
  colorscheme Tomorrow

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
  end

  autocmd GUIEnter * :unmenu DrChip.
  autocmd GUIEnter * :unmenu Plugin.
end

"" vim-slime
let g:slime_target = "tmux"

"" Make windows well-sized. Borrowed from GRB. Not sure if liking.
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
let g:vroom_use_vimux=1
map <leader>t :VroomRunTestFile<cr>
map <leader>tf :VroomRunNearestTest<cr>

"" vimux
map <leader>vp :VimuxPromptCommand<cr>
map <leader>vl :VimuxRunLastCommand<cr>
map <leader>vi :VimuxInspectRunner<cr>
map <leader>vq :VimuxCloseRunner<cr>

"" Finger happiness
command! -buffer -bang -nargs=? G :execute <SNR>39_Git(<bang>0,<q-args>)
map <leader>G :Git 

"" Sometimes, I like to see line numbers
map <leader>l :set number!<cr>

"" Folding

set foldlevelstart=0

nnoremap <Space> za
vnoremap <Space> za

" Refocus folds
nnoremap ,z zMzvzz

" neocomplcache
let g:neocomplcache_enable_cursor_hold_i = 1
let g:neocomplcache_enable_at_startup = 1

" imap <C-k> <Plug>(neocomplcache_snippets_expand)
" smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" inoremap <expr><CR> neocomplcache#smart_close_popup()
inoremap <expr><TAB> pumvisible() ? "\<C-n>": "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

autocmd FileType css setlocal omnifunc=cssComplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" switch.vim

nnoremap - :Switch<cr>

"" TODO
" * Finish porting my old config
" * Customize statusline
"
" coffeescript
" html (ragtag)
" javascript

"" TO PILLAGE
" http://vimcasts.org/episodes/archive
" https://github.com/mislav/vimfiles/blob/master/vimrc
" http://yanpritzker.com/2011/10/26/colorful-vim-ruby-tests-and-debugging/
" http://learnvimscriptthehardway.stevelosh.com/chapters/09.html
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc#L640

