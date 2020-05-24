map <F2> :r !wl-paste -p -n<CR>
vmap <F3> :w !wl-copy -p -n<CR><CR>

" syntax highlighting
set encoding=utf-8
syntax on
set ve=all
set autochdir
set title

"highlight Pmenu ctermfg=white ctermbg=darkgrey
"highlight PmenuSel ctermfg=darkmagenta ctermbg=darkgrey
"highlight PmenuSel cterm=bold

"delte previous word
noremap! <C-h> <C-w>

"vim fold config
nnoremap <Space> za
set foldmethod=syntax
set foldlevel=1
highlight Folded ctermbg=none ctermfg=none
"highlight Folded cterm=bold,reverse ctermbg=darkgrey
set foldtext=FoldText()



"default vim split pane
"set splitbelow
"set splitright

" cscope setting
"if has('cscope')
"  set cscopetag "cscopeverbose
"  if has('quickfix')
"	set cscopequickfix=s-,c-,d-,i-,t-,e-
"  endif
"  "command -nargs=0 Cscope cs add $CSCOPE_DB
"  cs add $CSCOPE_DB
"endif

"netrw tree view
"map \ <C-W><C-W>
"map <silent> <C-L> :Lexplore<CR>

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25

"let g:netrw_preview=1
"augroup ProjectDrawer autocmd!  autocmd VimEnter * :Vexplore augroup END
" Toggle Vexplore with Ctrl-E

"turn off modelines
set modelines=0
set nomodeline

"indenting
set autoindent
set smartindent

set number
"set relativenumber

"readable text
set background=dark


let mapleader=','
"paste toggle
"set pastetoggle=<F2>
"toggle tab highlight
nnoremap <leader><Tab> :syntax match Special "\t"<CR>
"toggle trailing space highlight
nnoremap <leader><Space> :syntax match Error "\s\+$"<CR>
"remove trailing space
"nnoremap <leader>d :%s/\s\+$// <CR>
nnoremap <leader>d :%s/\n\{3,}/\r\r/e <CR>

nnoremap <silent> <leader><F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"inoremap <F12><Tab> <C-O>:syntax match Special "\t"<CR>
highlight Special ctermbg=red cterm=NONE
highlight Error ctermbg=red cterm=NONE
"clear highlights for a search
nnoremap <silent> <leader>h :noh<CR>
"toggle cursor line [cursor]
map <silent> <leader>c :set cursorline!<CR>
"toggle displaying newline charaters and tabs [list]
map <silent> <leader>l :set list!<CR>
set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
set listchars=tab:>\ ,trail:•,extends:#,nbsp:.
set listchars=nbsp:¬,tab:»·,trail:·,extends:>
set listchars=nbsp:¬,tab:· ,trail:·,extends:>
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
"set laststatus=2
"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P


"status line with current cursor position
set ruler

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

set undofile
set undodir=/tmp

"set text wrap and linebreak
"set textwidth=80 colorcolumn=-1
"set wrap linebreak nolist tw=80
"set lbr
"set breakindent
"set showbreak="..."

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
autocmd FileType javascript,html,css,php set ai sw=2 ts=2 sts=2 expandtab
let html_use_css = 1
"for HTML programming
"au BufNewFile,BufRead *.html map <tab> Vatzf

"android programming
au BufNewFile,BufRead *.xml set noexpandtab sw=4 ts=4 sts=4 ai
autocmd FileType java set ai sw=4 ts=4 sts=4 noexpandtab

"text, README, markdown files
au! BufNewFile,BufRead *.txt,README,*.md set filetype=markdown
au BufNewFile,BufRead *.txt,README,*.md set ai nonumber norelativenumber formatoptions=tcroqn2 comments=n:&gt;

"python ruby perl
autocmd FileType python set ai noexpandtab sw=4 ts=4 sts=4 nowrap
autocmd FileType ruby set ai noexpandtab sw=2 ts=2 sts=2 nowrap
autocmd FileType perl set ai noexpandtab sw=4 ts=4 sts=4 nowrap

"c/c++/c#
"au BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp set noexpandtab sw=4 ts=4 sts=4 ai nowrap
autocmd FileType cs set ai noexpandtab sw=4 ts=4 sts=4
autocmd FileType c set ai noexpandtab sw=4 ts=4 sts=4 nowrap
autocmd FileType cpp set ai noexpandtab sw=4 ts=4 sts=4 nowrap

"scheme
autocmd FileType scheme set ai noexpandtab sw=2 ts=2 sts=2 nowrap

" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8

"auto completion in command mode
set wildmode=longest,list,full
set wildmenu

" use tab to complete CR to accept, Esc to clear j, k to select
"inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "<CR>"
"inoremap <expr> <Esc> pumvisible() ? "\<C-E>" : "<Esc>"
"inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
"inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
"inoremap <TAB> <C-R>=TabComplete()<CR>
"function! TabComplete()
"	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"		return "\<C-N>"
"	else
"		return "\<Tab>"
"	endif
"endfunction

"Enable incremental search
set incsearch
set showmatch
set hlsearch
"noh

"change dir to the working file
"autocmd BufEnter * lcd %:p:h
"set tags+=./tags
"set autochdir
"set tags=tags;

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

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'jmcantrell/vim-virtualenv'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
"Plug 'ying17zi/vim-live-latex-preview'
call plug#end()

set t_Co=256   " This is may or may not needed.
set background=dark
"colorscheme PaperColor

"airline preference
let g:airline#extensions#tabline#enabled = 1

"toggle for vim plugins
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
map <C-b> :CtrlPMixed<CR>

"map <C-j> <C-W>w
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

"scroll through buffer/tabs
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>

map <F9> :make


let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
