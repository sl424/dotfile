" syntax highlighting
set encoding=utf-8
syntax on
set ve=all

"autocomplete
set omnifunc=syntaxcomplete#Complete
highlight Pmenu ctermfg=white ctermbg=darkgrey
highlight PmenuSel ctermfg=darkmagenta ctermbg=darkgrey
highlight PmenuSel cterm=bold

"delte previous word
noremap! <C-h> <C-w>

"vim fold config
nnoremap <Space> za
set foldmethod=syntax
set foldlevel=1
highlight Folded  ctermbg=none  ctermfg=none
"highlight Folded cterm=bold,reverse ctermbg=darkgrey
set foldtext=FoldText()



"default vim split pane
"set splitbelow
"set splitright

" cscope setting
if has('cscope')
  set cscopetag "cscopeverbose
  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif
  "command -nargs=0 Cscope cs add $CSCOPE_DB
  cs add $CSCOPE_DB
endif

"netrw tree view
"map \ <C-W><C-W> 
"map <silent> <C-L> :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"let g:netrw_preview=1
"augroup ProjectDrawer autocmd!  autocmd VimEnter * :Vexplore augroup END
" Toggle Vexplore with Ctrl-E

"turn off modelines
set modelines=0
set nomodeline

"indenting
set autoindent
set smartindent

"set numbering
"set relativenumber

"readable text
set background=dark

let mapleader=','
"paste toggle
set pastetoggle=<F2>
"toggle tab highlight
nnoremap <leader><Tab>      :syntax match Special "\t"<CR>
"toggle trailing space highlight
nnoremap <leader><Space>    :syntax match Error "\s\+$"<CR>
"remove trailing space
nnoremap <leader><C-D>    :%s/\s*$// <CR>
"inoremap <F12><Tab> <C-O>:syntax match Special "\t"<CR>
highlight Special ctermbg=black cterm=NONE
highlight Error ctermbg=red cterm=NONE
"clear highlights for a search
nnoremap <silent> <leader>h :noh<CR>
"toggle cursor line [cursor]
map <silent> <leader>c :set cursorline!<CR>
"toggle displaying newline charaters and tabs [list]
map <silent> <leader>l :set list!<CR>
"toggle line numbering [number]
map <silent> <leader>n :set number!<CR>
"toggle relativenumbering [relativenumber]
map <silent> <leader>r :set relativenumber!<CR>
"toggle spell checking [spelling]
nmap <silent> <leader>s :set spell!<CR>
"toggle line wrapping [wrap]
"map <leader>w :set wrap!<CR>

"set scrolling buffer
set scrolloff=5

"status bar
set laststatus=2
"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P


"status line with current cursor position
set ruler

"setlocal tabstop=4
"setlocal shiftwidth=4
"setlocal softtabstop=4
"setlocal noexpandtab

"set text wrap and linebreak
set textwidth=80 colorcolumn=-1
set wrap linebreak nolist tw=80
"set lbr
set breakindent
set showbreak="..."

"backspace with indent
set backspace=start,indent,eol

"turn on cursorline
set cursorline

"swap file
set nobackup
set noswapfile
set wildignore=*.swp,*.bak

"search case-sensitivity
set ignorecase
set smartcase

"navigation works on visual lines
map k gk
map j gj

"FileType support
if has("autocmd")
filetype plugin on 
filetype indent on
endif

"web dev
autocmd FileType javascript,html,css,php set ai sw=4 ts=4 sts=4 noexpandtab

"android programming
au BufNewFile,BufRead *.xml set noexpandtab sw=4 ts=4 sts=4 ai
autocmd FileType java set ai sw=4 ts=4 sts=4 noexpandtab 

"For PHP programming auto stuffs
au! BufNewFile,BufRead *.php set filetype=php.html.javascript.css.sql
au BufNewFile,BufRead *.php let php_htmlInStrings=1
au BufNewFile,BufRead *.php let php_sql_query=1
au BufNewFile,BufRead *.php set foldmethod=manual
au BufNewFile,BufRead *.php let g:DisableAutoPHPFolding=1
au BufNewFile,BufRead *.php set comments=sr:/*,mb:*,ex:*/
au BufNewFile,BufRead *.php set fo+=ro
au BufNewFile,BufRead *.php let php_folding=0
au BufNewFile,BufRead *.php map <F5> <Esc>:EnableFastPHPFolds<Cr>

"for HTML programming
au BufNewFile,BufRead *.html map <tab> Vatzf

"text, README, markdown files
au! BufNewFile,BufRead *.txt,README,*.md set filetype=markdown
au BufNewFile,BufRead *.txt,README,*.md set ai nonumber norelativenumber formatoptions=tcroqn2 comments=n:&gt;

"python
autocmd FileType python set ai expandtab sw=4 ts=4 sts=4 nowrap 

"ruby
autocmd FileType ruby set ai expandtab sw=2 ts=2 sts=2 nowrap 
"perl
autocmd FileType perl set ai expandtab sw=4 ts=4 sts=4 nowrap 

autocmd FileType cs set ai expandtab sw=4 ts=4 sts=4
"autocmd FileType c set ai expandtab sw=4 ts=4 sts=4 nowrap 
"autocmd FileType cpp set ai expandtab sw=4 ts=4 sts=4 nowrap 

"scheme
autocmd FileType scheme set ai expandtab sw=2 ts=2 sts=2 nowrap 

"c/c++/c#
au BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp set expandtab sw=4 ts=4 sts=4 ai nowrap

" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8

"auto completion in command mode
set wildmode=longest,list
set wildmenu

" use tab to complete
" CR to accept, Esc to clear
" j, k to select
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-E>" : "<Esc>"
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
inoremap <TAB> <C-R>=TabComplete()<CR>
function! TabComplete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction

"Enable incremental search
"set incsearch
"set showmatch
"set hlsearch
"noh

"change dir to the working file
"autocmd BufEnter * lcd %:p:h
"set tags+=./tags
"set autochdir
set tags=tags;

"linux settings
"autocmd BufRead,BufNewFile /home/chewie/linux-4.8.0/* source ~/.vim/linux.vim

"mozilla settings
"autocmd BufRead,BufNewFile /home/chewie/mozilla-central/* source ~/.vim/mozilla.vim

"FFmpeg settings 
"autocmd BufRead,BufNewFile /home/chewie/FFmpeg/* source ~/.vim/ffmpeg.vim

iab _main() #include<stdlib.h><CR>#include<stdio.h><CR>int main(int argc, char *argv[])<CR>{<CR>exit(EXIT_SUCCESS);<CR>}

" Trailing whitespace and tabs are forbidden, so highlight them.
"highlight ForbiddenWhitespace ctermbg=red guibg=red
"match ForbiddenWhitespace /\s\+$\|\t/

" Do not highlight spaces at the end of line while typing on that line.
"autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/
"
"enable autocompletion
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd Filetype java set omnifunc=javacomplete#Complete
"autocmd FileType html "set omnifunc=htmlcomplete#CompleteTag
"autocmd FileType css "set omnifunc=csscomplete#CompleteCSS
"autocmd FileType c  set omnifunc=syntaxcomplete#Complete
"autocmd FileType cpp set omnifunc=omni#cpp#complete#Main


function! FoldText()
	let l:lpadding = &fdc
	redir => l:signs
	execute 'silent sign place buffer='.bufnr('%')
	redir End
	let l:lpadding += l:signs =~ 'id=' ? 2 : 0

	" expand tabs
	let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
	let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

	let l:info = ' ▶▶ ' . (v:foldend - v:foldstart) . ''
	let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
	let l:width = winwidth(0) - l:lpadding - l:infolen

	let l:separator = ' … '
	let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
	let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
	let l:text = l:start . ' … ' . l:end

	"return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
	return l:text . l:info . repeat(' ', l:width)
endfunction

set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
	   \%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

