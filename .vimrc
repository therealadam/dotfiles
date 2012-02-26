set nocompatible " Just say no to plain vi
syntax enable
set encoding=utf-8
filetype plugin indent on " load file type plugins and indentation

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
set nonumber
set numberwidth=5

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
set wildignore+=vendor/gems/*,vendor/cache/*,.bundle/*,.sass-cache/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set visualbell
set ttyfast
set ruler
set laststatus=2
set undofile

"" Load any customizations particular to this old host
source ~/.local.vim

"" Key binding
let mapleader=","
let maplocalleader="\\"

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
" colorscheme Tomorrow-Night-Bright
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
nnoremap <leader>a :Ack
nnoremap <leader>aw :Ack <C-r><C-w>

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

  silent !if [ -d .git ]; then git ls-files -c -o --exclude-standard | ctags -L -; else ctags -R; fi

  if exists(":ClearCtrlPCache") == 2
    ClearCtrlPCache
  endif
endfunction

map <silent> <Leader>r :call Refresh()<CR>

"" Don't let yankring poop in my home directory
let g:yankring_history_dir = '$HOME/.vim/'
let g:yankring_history_file = 'yankring.txt'

"" File finding gizmo (whichever I'm using today)
map <leader>f :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>

"" My own little test runner!
map <leader>tf :call Focus()<cr>

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

"" Make windows well-sized. Borrowed from GRB. Not sure if liking.
set winwidth=80
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999

"" Run RSpec tests. Extract into a plugin thingy. Totally ganked from GRB.

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!bundle exec cucumber " . a:filename
    elseif match(a:filename, '_test\.rb$') != -1
        exec ":!ruby -Ilib:test " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_test.rb\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

map <leader>t :call RunTestFile()<cr>

"" TODO
" * Finish porting my old config
" * Align
" * Customize statusline
"
" VimClojure
" snipmate - https://github.com/msanders/snipmate.vim
" coffeescript
" markdown
" html (ragtag)
" cucumber
" javascript
" scala

"" TO PILLAGE
" http://vimcasts.org/episodes/archive
" https://github.com/mislav/vimfiles/blob/master/vimrc
" http://yanpritzker.com/2011/10/26/colorful-vim-ruby-tests-and-debugging/
" http://learnvimscriptthehardway.stevelosh.com/chapters/09.html
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc#L640
