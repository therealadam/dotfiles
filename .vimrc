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
nnoremap <leader><space><space> :noh<cr>
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
set scrolloff=3 " Keep three lines of context around the cursor at all times
set autoindent " Match the next line's indent to the current line
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set laststatus=2
set undofile

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

set background=light
set t_Co=256
color Tomorrow

"" Pathogen
call pathogen#infect()
call pathogen#helptags()

"" File finding gizmo (whichever I'm using today)
cnoremap %% :CtrlP<C-R>=expand('%:h').'/'<cr>

map <leader>f :CtrlP<cr>
map <leader>rf :CtrlPMRU<cr>
map <leader>b :CtrlPBuffer<cr>

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.swp,*.un*

"" Window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" Quickly switch to the last file
nnoremap <leader><leader> <c-^>

"" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" Ack is so great
nnoremap <leader>a :Ack

"" Fold HTML tags
nnoremap <leader>ft Vatzf

"" Hard re-wrap paragraphs
nnoremap <leader>q gqip

"" Re-select text that was just yanked
nnoremap <leader>v V`]

"" Bounce out of insert mode
inoremap jj <ESC>

"" Quick split
nnoremap <leader>w <C-w>v<C-w>l

"" Clojure
let g:vimclojure#ParenRainbow=1

"" Run RSpec tests. Extract into a plugin thingy. Totally ganked from GRB.

map <leader>t :call RunTestFile()<cr>

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

"" TODO
" * Finish porting my old config
"
" VimClojure
" vim-repeat - https://github.com/tpope/vim-repeat
" vim-fugitive - https://github.com/tpope/vim-fugitive
" snipmate - https://github.com/msanders/snipmate.vim
" yankring - http://www.vim.org/scripts/script.php?script_id=1234
" sparkup - https://github.com/rstacruz/sparkup
" vim-textobj-rubyblock - https://github.com/nelstrom/vim-textobj-rubyblock
" tComment - https://github.com/tomtom/tcomment_vim
" align - ??
" copy-as-rtf - ???
" gist - ??
" coffeescript
" git
" markdown
" html
" cucumber
" javascript
" scala
" go

"" TO PILLAGE
" http://vimcasts.org/episodes/archive
" https://github.com/mislav/vimfiles/blob/master/vimrc
" http://yanpritzker.com/2011/10/26/colorful-vim-ruby-tests-and-debugging/
" http://learnvimscriptthehardway.stevelosh.com/chapters/09.html
