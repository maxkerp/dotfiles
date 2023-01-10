if &compatible
  set nocompatible
end

" Remove declared plugins
function! s:UnPlug(plug_name)
  if has_key(g:plugs, a:plug_name)
    call remove(g:plugs, a:plug_name)
  endif
endfunction
command!  -nargs=1 UnPlug call s:UnPlug(<args>)
let g:has_async = v:version >= 800 || has('nvim')

call plug#begin('~/.config/nvim/bundle')

" Define bundles via Github repos
Plug 'christoomey/vim-run-interactive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Uncategorized
" --------------

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rhubarb'

" Uncategorized
" --------------
Plug 'wincent/corpus'

" Git
" ----

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'gregsexton/gitv'
Plug 'junkblocker/git-time-lapse'
Plug 'rhysd/git-messenger.vim'

" Formatting and working with text
" ---------------------------------

Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'FooSoft/vim-argwrap'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/tComment'
Plug 'pbrisbin/vim-mkdir'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'

" Finding stuff
" --------------

" Plug 'ctrlpvim/ctrlp.vim' " Temporaily commented out since thoughtbot uses fzf
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'

" Visuals or Focusing
" --------------------

Plug 'junegunn/goyo.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dhruvasagar/vim-zoom'

" Productivity
" --------------------
"  Running from within vim
"
Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test'
Plug 'neomake/neomake'

" Themes
" -------

Plug 'chriskempson/base16-vim'
Plug 'endel/vim-github-colorscheme'
Plug 'hzchirs/vim-material'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline-themes'

" Syntaxes
" ---------

Plug 'cespare/vim-toml'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'rodjek/vim-puppet'
Plug 'slim-template/vim-slim'
Plug 'vim-ruby/vim-ruby'
Plug 'mustache/vim-mustache-handlebars'
Plug 'amiorin/vim-textile'
Plug 'mattn/emmet-vim'

" Languages and Frameworks
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

" Snippet Support
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'garbas/vim-snipmate'
" Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}

" This might be too much bloat...
" Plug 'sheerun/vim-polyglot'

" Deactivated / Testing if needed
" --------------------------------

" Plug 'tpope/vim-commentary'
" Plug 'christoomey/vim-rfactory'
" Plug 'mtth/scratch.vim'
" Plug 'vimwiki/vimwiki'
" Plug 'w0rp/ale'

" Markdown folding
" The following two fold better than the third
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" Plug 'nelstrom/vim-markdown-folding'
if g:has_async
  Plug 'dense-analysis/ale'
endif

call plug#end()
