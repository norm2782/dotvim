call pathogen#infect()

" ------------------------------------------------------------------
"  General vim config
" ------------------------------------------------------------------
syntax on
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Whitespace
" ------------------------------------------------------------------
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  List characters
" ------------------------------------------------------------------
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Searching
" ------------------------------------------------------------------
set hlsearch    " highlight matches
set incsearch   " incremental searching
" set ignorecase  " searches are case insensitive...
" set smartcase   " ... unless they contain at least one capital letter
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Wildcard settings
" ------------------------------------------------------------------
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Backgrup and swap files
" ------------------------------------------------------------------
set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Tab and indenting configuration
" ------------------------------------------------------------------
set smarttab
set smartindent
filetype plugin indent on
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  GUI configuration options
" ------------------------------------------------------------------
set guioptions-=T
set guifont=Monaco:h10
set noantialias
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Clipboard and mouse integration
" ------------------------------------------------------------------
set clipboard=unnamed
set mouse=a
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Wildmenu configuration
" ------------------------------------------------------------------
set wildmenu
set wildmode=longest,full
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Solarized Colorscheme Config
" ------------------------------------------------------------------
syntax enable
set background=dark
colorscheme solarized
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Language and spelling configuration
" ------------------------------------------------------------------
setlocal spell spelllang=en_gb
set nospell
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Omnifunc configuration
" ------------------------------------------------------------------
setlocal omnifunc=necoghc#omnifunc
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  UHC- and Haskell-specific language mapping
" ------------------------------------------------------------------
au BufNewFile,BufRead *.{cag,hsc,chs,core*} set filetype=haskell
au BufNewFile,BufRead *.lhs  set filetype=tex
au BufNewFile,BufRead *.{cjs,mjs} set filetype=javascript
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Makefile-specific tab config
" ------------------------------------------------------------------
au FileType make setlocal noexpandtab
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Highlighting for long lines and certain keywords
" ------------------------------------------------------------------
au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%<111v.\%>80v', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', 'TODO', -1)
au BufWinEnter * let w:m3=matchadd('ErrorMsg', 'FIXME', -1)
au BufWinEnter * let w:m4=matchadd('ErrorMsg', 'undefined', -1)
au BufWinEnter * let w:m5=matchadd('ErrorMsg', 'hole', -1)
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Git-specific configuration
" ------------------------------------------------------------------
 " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Sudo
" ------------------------------------------------------------------
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Status bar configuration
" ------------------------------------------------------------------
set laststatus=2  " always show the status bar

" Start the status line
set statusline=%f\ %m\ %r
set statusline+=Line:%l/%L[%p%%]
set statusline+=Col:%v
set statusline+=Buf:#%n
set statusline+=[%b][0x%B]
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  NERDCommenter config
" ------------------------------------------------------------------
map <leader>/ <plug>NERDCommenterToggle<CR>
imap <leader>/ <Esc><plug>NERDCommenterToggle<CR>i
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  NERDTree config
" ------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
" ------------------------------------------------------------------
