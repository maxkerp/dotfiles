"{{{ ---------------------- Autocommands

au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<TODO\>"

" autocmd VimEnter * AirlineTheme term
" autocmd VimEnter * AirlineTheme base16_shell
au VimEnter * highlight MatchParen guifg=#cc6666 guibg=#f0c674

au FileType vim set foldmethod=marker foldlevel=0
au FileType ruby EnableStripWhitespaceOnSave

augroup MagitCustom
  autocmd!

  au FileType magit set scrolloff=100
  " TODO figure out how to unmap a plugin mapping
  " au FileType magit nunmap L
  " au FileType magit nnoremap <silent> L :tabnext<cr>
  au FileType magit nnoremap <silent> H :tabprevious<cr>
augroup END

"}}}

"{{{ ---------------------- General Settings

nnoremap <leader>9 :setlocal spelllang=de spell<cr>
nnoremap <leader>0 :hi SpellBad ctermfg=1 ctermbg=10 gui=bold guifg=#cc6666 guibg=#282a2e<cr>
nnoremap <silent> <leader>8 :se tw=80<cr>

nnoremap <leader>o :only<cr>
nnoremap <leader>wo <c-w>T

nnoremap <leader>ei :tabnew ~/.config/nvim/init.vim<cr>
nnoremap <leader>em :tabnew ~/.config/nvim/mappings.vim<cr>
nnoremap <leader>ep :tabnew ~/.config/nvim/plugs.vim<cr>
nnoremap <leader>si :source ~/.config/nvim/init.vim<cr>\| :echom "init.vim reloaded"<cr>

" TODO Open a projects' WIKI page dynamically
nnoremap <silent> <leader>` :edit /home/taktsoft/Wiki/elSa.md<cr>

nnoremap ; :
nnoremap <C-s> :set hlsearch!<cr>
inoremap jj <ESC>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

" Copy file path to clipboard
nnoremap <silent> <leader>cf :let @+=expand("%")<CR>

" Toggle folds with space
nnoremap <Space> za
" TODO: I'd rather make <C-Space> work again.
nnoremap <M-C-Space> zc
vnoremap <Space> za

"}}}

"{{{ ---------------------- Syntax
nnoremap <leader>1 Obinding.pry<ESC>0:w<cr>
nnoremap <leader>2 O<% binding.pry%><ESC>0:w<cr>
nnoremap <leader>3 O- binding.pry<ESC>0:w<cr>
"}}}

"{{{ ---------------------- Finding stuff


" Search for word under cursor in project
nnoremap <leader>a viwy:Ack! <C-R>" app/ lib/ config/<cr>
nnoremap <leader>s viwy:Ack! <C-R>" spec/<cr>

" Search for visually selected text in project
vnoremap <leader>a y:Ack! "<C-R>"" app/ lib/ config/<cr>
vnoremap <leader>s y:Ack! "<C-R>"" spec/<cr>

nnoremap <leader>fb :Ack! 'binding\.pry' **/*.{rb,erb} <cr>


" Search for visually selected text in file
vnoremap // y/<C-R>"<cr>

" Search for text in files with fzf
nnoremap <c-\> :Rg<cr>

"}}}

"{{{ ---------------------- Windows/Panes

" Move viewport vertically
nnoremap <C-f> 3zl
nnoremap <C-b> 3zh

" Move through tabs
nnoremap <silent> L :tabnext<cr>
nnoremap <silent> H :tabprevious<cr>

" Resize panes
nnoremap <Left> <c-w><
nnoremap <Right> <c-w>>
nnoremap <Up> <c-w>+
nnoremap <Down> <c-w>-

nnoremap <C-w>v :vnew<cr>

"}}}

"{{{ ---------------------- Navigating Files

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

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

"}}}

"{{{ ---------------------- Navigating Text

"}}}

"{{{ ---------------------- Working with Text

" Copy/Paste
vnoremap <leader>y "+y
nnoremap <leader>p "+gp
nnoremap <leader>P "+gP

" Moving
vnoremap > >gv
vnoremap < <gv

" Joining
nnoremap <C-u> Jx

" Whitespace
nnoremap <leader>sw :StripWhitespace<CR>

" Focus on the text
nnoremap <leader>cp :Goyo<cr>

"}}}

"{{{ ---------------------- Plugins

" Open/Close directories and or files with l,h, and space
autocmd FileType nerdtree nmap <buffer> l o
autocmd FileType nerdtree nmap <buffer> h x
autocmd FileType nerdtree nmap <buffer> <Space> o

" Toggle file tree wich <C-n>
map <C-n> :NERDTreeToggle<CR>

nnoremap <F3> :Tagbar<cr>

nnoremap <leader>gb :Git credit<cr>

" Start ArgWrap
nnoremap <silent> <leader>w :ArgWrap<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <CR> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}

"{{{ ---------------------- Mappings from Thoughbot

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>ta :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<Space>

" Quicker window movement
" Disabled since we are using TmuxNavigation
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>
"}}} ---------------------- 

"{{{ ---------------------- Running Stuff

"}}}

"{{{ ---------------------- DISABLED

" nnoremap <silent> tn :TestNearest<CR>
" nnoremap <silent> tf :TestFile<CR>
" nnoremap <silent> tt :TestLast<CR>
" nnoremap <silent> tv :TestVisit<CR>

"}}}

"{{{ ---------------------- Snippets Mapping
"
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
"}}}
"
"{{{ ---------------------- Template

"}}}


" -------------------------
"
" Lines beneath this comment still need to be moved in the right section
" or to a different file.
"
" -------------------------

set hidden
let g:scratch_no_mappings = 1
"let g:scratch_insert_autohide = 1
let g:scratch_height = 15
let g:scratch_persistence_file = '.buffer.scratch'
nnoremap ss :ScratchPreview<cr>
nnoremap SS :Scratch<cr>



nnoremap zO zczO

" Make zO recursively open whatever fold we're in, even if it's partially open.
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
let test#strategy = "dispatch"

" GOYO Settings
let g:goyo_width = '50%'
let g:goyo_height = '100%'
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

