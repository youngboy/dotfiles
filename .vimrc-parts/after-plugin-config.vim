set expandtab

map me :tabe<CR>
map m1 1gt
map m2 2gt
map m3 3gt
map m4 4gt
map m5 5gt
"map ff \\f

map mf :Ag
set tw=85

" delimitMate
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

"indentline
let g:indentLine_faster = 1
map <Leader>i :IndentLinesToggle<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Clear last search (,qs)
map <silent> <leader>qs <Esc>:noh<CR>
" map <silent> <leader>qs <Esc>:let @/ = ""<CR>

" Indent/unident block (,]) (,[)
nnoremap <leader>] >i{<CR>
nnoremap <leader>[ <i{<CR>

" quick saving
nmap <silent> <Leader>w :update<CR>

" Paste toggle (,p)
set pastetoggle=<leader>p
map <leader>p :set invpaste paste?<CR>

" NERD Commenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1
let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }

" CtrlP
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
"let g:ctrlp_split_window = 1 " <CR> = New Tab

" Buffer navigation (,,) (,]) (,[) (,ls)
map <Leader>, <C-^>
" :map <Leader>] :bnext<CR>
" :map <Leader>[ :bprev<CR>
map <Leader>ls :buffers<CR>


"set clipboard=unnamed
"
"zg add word to dict, as good
map ms :setlocal spell!<CR>
autocmd BufRead,BufNewFile *.js setlocal spell
autocmd BufRead,BufNewFile *.jsx setlocal spell

"Ignore the path for c-p
"

"map <leader>s :TernRefs<CR>

set foldmethod=indent
set foldlevelstart=99
map z0 :set foldlevel=99 <CR>
map z2 :set foldlevel=1 <CR>
map z3 :set foldlevel=2 <CR>
map z4 :set foldlevel=3 <CR>
map z5 :set foldlevel=4 <CR>
map z6 :set foldlevel=5 <CR>
map z7 :set foldlevel=6 <CR>
map z8 :set foldlevel=7 <CR>

set foldtext=CustomFoldText()
function! CustomFoldText()
     "get first non-blank line
     let fs = v:foldstart
     while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
     endwhile
     if fs > v:foldend
         let line = getline(v:foldstart)
     else
         let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
     endif

     let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
     let foldSize = 1 + v:foldend - v:foldstart
     let foldSizeStr = " " . foldSize . " lines "
     let foldLevelStr = "LEVEL:" . v:foldlevel
     let lineCount = line("$")
     let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
     let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
     return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

let javaScript_fold=1         " JavaScript

map <Leader>w :FixWhitespace<cr>

set term=xterm-256color
set t_Co=256
set termguicolors
set background=dark

let g:Powerline_symbols = 'fancy'

:hi Pmenu ctermfg=236

:hi TabLineFill ctermfg=236
:hi TabLineSel ctermfg=Black ctermbg=251
:hi TabLine ctermfg=250 ctermbg=239
:hi Title ctermfg=Red

set guifont=Fantasque\ Sans\ Mono\ 28


