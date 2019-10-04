"{{{ Autocommands
"
let mapleader = ","

au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<TODO\>"

" autocmd VimEnter * AirlineTheme term
" autocmd VimEnter * AirlineTheme base16_shell
au VimEnter * highlight MatchParen guifg=#cc6666 guibg=#f0c674

au FileType ruby EnableStripWhitespaceOnSave

"}}}

set background=dark
set expandtab
set nobackup
set noswapfile
set nowrap
set number
set pastetoggle=<F2>
set relativenumber
set shiftwidth=2
set so=999
set tabstop=2
set termguicolors
"set virtualedit=all

nnoremap <leader>9 :setlocal spelllang=de spell<cr>
nnoremap <leader>0 :hi SpellBad ctermfg=1 ctermbg=10 gui=bold guifg=#cc6666 guibg=#282a2e<cr>

nnoremap <leader>ei :tabnew ~/.config/nvim/init.vim<cr>
nnoremap <leader>cp :Goyo<cr>
nnoremap <silent> <leader>cf :let @+=expand("%")<CR>

nnoremap <leader>1 Obinding.pry<ESC>0:w<cr>
nnoremap <leader>2 O<% binding.pry%><ESC>0:w<cr>
nnoremap <leader>3 O- binding.pry<ESC>0:w<cr>

nnoremap <leader>a viwy:Ack! <C-R>" app/ spec/ lib/ config/<cr>

nnoremap <silent> <leader>8 :se tw=80<cr>
nnoremap <leader>o :only<cr>
nnoremap <leader>wo <c-w>T

vnoremap <leader>y "+y
nnoremap <leader>p "+gp
nnoremap <leader>P "+gP

" Visual Mode
" vnoremap > >gv
" vnoremap < <gv

" Quickfix navigation
nnoremap <leader>qo :cw<cr>
nnoremap <leader>qc :ccl<cr>
nnoremap <leader>qq :cn<cr>

" Location List navigation
nnoremap <leader>lo :lw<cr>
nnoremap <leader>lc :lcl<cr>
nnoremap <leader>ll :lne<cr>

" Linting Navigation
" nnoremap <silent> <C-k> :lpr<cr>
" nnoremap <silent> <C-j> :lne<cr>

" Whitespace
nnoremap <leader>sw :StripWhitespace<CR>

" Search for visually selected text
:vnoremap // y/<C-R>"<cr>

nnoremap ; :
nnoremap <C-s> :set hlsearch!<cr>
inoremap jj <ESC>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

":noremap y "+Y
":noremap p "+gP

nnoremap <silent> L :tabnext<cr>
nnoremap <silent> H :tabprevious<cr>
nnoremap <silent> <leader>` :edit /home/taktsoft/Wiki/elSa.md<cr>

" nnoremap <C-l> 3zl
" nnoremap <C-h> 3zh

autocmd FileType nerdtree nmap <buffer> l o
autocmd FileType nerdtree nmap <buffer> h x
autocmd FileType nerdtree nmap <buffer> <Space> o
map <C-n> :NERDTreeToggle<CR>
"}}}

nnoremap <F3> :Tagbar<cr>
"}}}

nnoremap <silent> tn :TestNearest<CR>
nnoremap <silent> tf :TestFile<CR>
nnoremap <silent> tt :TestLast<CR>
nnoremap <silent> tv :TestVisit<CR>

nnoremap <leader>gb :Gblame<cr>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <CR> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set hidden
let g:scratch_no_mappings = 1
"let g:scratch_insert_autohide = 1
let g:scratch_height = 15
let g:scratch_persistence_file = '.buffer.scratch'
nnoremap ss :ScratchPreview<cr>
nnoremap SS :Scratch<cr>
nnoremap <leader>s :ScratchInsert<cr>

set foldmethod=syntax
set foldlevelstart=1

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
" nnoremap <c-z> mzzMzvzz15<c-e>`z

"{{{ Plugins

" Productivity
nnoremap <silent> <leader>w :ArgWrap<CR>

"}}}

" }}}

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

if executable('rg')
  let g:ctrlp_user_command = ['.git', 'cd %s && rg --files-with-matches ".*"', 'find %s -type f']
endif

let g:vimwiki_list = [{'path': '~/Wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_folding = 'syntax'

let g:markdown_fenced_languages = ['html', 'ruby', 'bash=sh']
let g:markdown_syntax_conceal = 0

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '\'
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_tomorrow'

let g:dispatch_compilers = {}
let g:dispatch_compilers['bundle exec rspec'] = 'rspec'
let test#strategy = "neomake"

" GOYO Settings
let g:goyo_width = 160
let g:goyo_height = '95%'
" "let g:goyo_linenr = 1

" Rubocop
let g:airline#extensions#ale#enabled = 1

colorscheme base16-tomorrow-night

let g:better_whitespace_filetypes_blacklist=['md']
let g:better_whitespace_guicolor='#cc6666'

" function! MarkdownLevel2()
"   if getline(v:lnum) =~? '^\s*$'
"       return '-1'
"   endif

"   let header = getline(v:lnum) =~ '^#\+ .*$'

"   if empty(header)
"     return "="
"   else
"     return ">" . len(header)
"   endif
" endfunction

function! MarkdownLevel()
    if getline(v:lnum) =~? '^\s*$'
        return '-1'
    endif

    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif

    return "="
endfunction

au BufWinEnter *.md setlocal foldexpr=MarkdownLevel()
au BufWinEnter *.md setlocal foldmethod=expr
au BufWinEnter *.md setlocal foldtext=MyFoldText()
au BufWinEnter *.md setlocal foldlevel=1


function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

