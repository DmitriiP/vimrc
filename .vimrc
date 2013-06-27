"Load modules from bundle 
"
syntax on
call pathogen#infect()

set nu
set tabstop=8 expandtab shiftwidth=4 softtabstop=4


filetype plugin indent on
" filetype plugin on

autocmd FileType python set complete+=k~/.vim/syntax/python.vim "isk+=.,(

au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
set modeline
set foldmethod=indent
set foldlevel=99
set hlsearch

set laststatus=2
set statusline=%#Comment#%{GitBranch()}\ %t%y%r%=\ %{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ line\:\ %l\/%L\ column\:\ %c

au FileType python set omnifunc=pythoncomplete#Complete
"Close documentation buffer automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType python compiler pylint

set t_Co=256
set background=dark
colorscheme zenburn
"Away awfull pink background for omnicomplete
highlight Pmenu ctermbg=238 gui=bold

set cursorline

let g:pylint_onwrite = 0

nnoremap <F5> :bn!<CR>
nnoremap <F6> :bp!<CR> 
nmap <F8> :TagbarToggle<CR>

nnoremap fq <ESC> :call CleanClose(1)<CR>
nnoremap fc <ESC>:call CleanClose(0)<CR>

function! CleanClose(tosave)
	if (a:tosave == 1)
		    w!
	endif
	let todelbufNr = bufnr("%")
	let newbufNr = bufnr("#")
	if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
	        exe "b".newbufNr
	else
		bnext
	endif

	if (bufnr("%") == todelbufNr)
		new
	endif
	exe "bd".todelbufNr
	"call Buftabs_show()
endfunction




"Error showing
let g:syntastic_enable_signs=1


"Nerd tree
let NERDTreeIgnore=['\.pyc','\~']

"01/11/2012 changes
"One tags file for all projects
set tags=~/tags
"Extended python highlighting
let python_highlight_all = 1

"Remove trailing whitespaces from lines
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
