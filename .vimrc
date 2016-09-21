call pathogen#infect()

function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction

" ------------------------------------------------------------------
"  General vim config
" ------------------------------------------------------------------
syntax on
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set showmode
set ruler             " Show line and column number
set colorcolumn=80    " Show vertical line at 80 characters
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set visualbell
set synmaxcol=500
set modeline
set history=1000
set cmdheight=1

" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Autocomplete
" ------------------------------------------------------------------
set completeopt=menuone,menu,longest
set completeopt+=longest

" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Whitespace
" ------------------------------------------------------------------
set nowrap                        " don't wrap lines
set softtabstop=2
set tabstop=2                     " a tab is four spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set autoindent
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set tw=80                         " automatic word wrapping
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
set guioptions-=r
set guioptions-=L

if GetRunningOS() == "mac"
  set guifont=Hack:h10
else
  set guifont=Courier\ New\ 10
endif

"set noantialias
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
set wildmode=longest,list,full
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Solarized Colorscheme Config
" ------------------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
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

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Makefile-specific tab config
" ------------------------------------------------------------------
au FileType make setlocal noexpandtab
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

" ------------------------------------------------------------------
"  Ag config
" ------------------------------------------------------------------
let g:ackprg = 'ag --vimgrep'
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  File type specific tab/space config
" ------------------------------------------------------------------
autocmd Filetype clean setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype tex setlocal ts=2 sts=2 sw=2 expandtab
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  File type specific tab/space config
" ------------------------------------------------------------------
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  GHC mod
" ------------------------------------------------------------------
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Supertab
" ------------------------------------------------------------------
if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  Tabularize
" ------------------------------------------------------------------
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
" ------------------------------------------------------------------

" ------------------------------------------------------------------
"  CtrlP
" ------------------------------------------------------------------
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
" ------------------------------------------------------------------


autocmd FileType haskell set expandtab
