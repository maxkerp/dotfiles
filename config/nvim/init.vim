
"{{{ ---------------------- General Settings

" Leader
let mapleader = ","

set encoding=utf-8
set incsearch

set nobackup
set nowritebackup
set noswapfile

" Use maximum history size
set history=10000

" Automatically :write before running commands
set autowrite

" Automatically reload unchanged buffers when the underlying files change
set autoread

" Display incomplete commands
set showcmd

" Always display the status line
set laststatus=2

" Disable modelines as a security precaution
set modelines=0
set nomodeline

" Always use vertical diffs
set diffopt+=vertical

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" From mappings.vim
set background=dark
set nowrap
set pastetoggle=<F2>
set so=100
set termguicolors
set foldmethod=syntax
set foldlevelstart=1



filetype plugin indent on

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

"}}}

"{{{ ---------------------- Visuals


" Show the cursor position all the time
set ruler
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

"}}}

"{{{ ---------------------- Editing


" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
" Backspace deletes like most programs in insert mode
set backspace=2


" Use one space, not two, after punctuation.
set nojoinspaces

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

"}}}

" https://github.com/wincent/corpus#user-content-corpusdirectories
let g:CorpusDirectories = {'~/Documents/Corpus': {'autocommit': 1, 'autoreference': 1, 'autotitle': 1, 'base': './', 'transform': 'local'}}

" ruby integration
let g:ruby_host_prog = 'rvm 2.6.3 do neovim-ruby-host'
let g:fzf_layout = { 'down': '~50%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Fix code folding in sh files
" These autocmds need to appear before 'syntax on'
" Don't know why, but should investigate.
au FileType sh let g:sh_fold_enabled=7
au FileType sh let g:is_bash=1
au FileType sh set foldmethod=syntax

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif


if filereadable(expand("~/.config/nvim/plugs.vim"))
  source ~/.config/nvim/plugs.vim
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

" ALE linting events
augroup ale
  autocmd!

  let g:ale_lint_on_text_changed = 0
  let g:ale_lint_on_insert_leave = 0
  let g:ale_lint_on_enter = 0
  let g:ale_lint_on_save = 0
  let g:ale_lint_on_filetype_change = 0

  if g:has_async
    autocmd VimEnter *
      \ set updatetime=1000 |
    " autocmd CursorHold * call ale#Queue(0)
    " autocmd CursorHoldI * call ale#Queue(0)
    " autocmd InsertEnter * call ale#Queue(0)
    " autocmd InsertLeave * call ale#Queue(0)
  else
    echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
  endif
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1


" Use The Silver Searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" https://dev.to/vinneycavallo/easily-center-content-in-vim?utm_source=pocket_mylist
" centers the current pane as the middle 2 of 4 imaginary columns
" should be called in a window with a single pane
function CenterPane()
  lefta vnew
  wincmd w
  exec 'vertical resize '. string(&columns * 0.75)
endfunction

" optionally map it to a key:
" nnoremap <leader>c :call CenterPane()<cr>

" Extra mappings file
if filereadable($HOME . "/.config/nvim/mappings.vim")
  source ~/.config/nvim/mappings.vim
endif
