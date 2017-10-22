syntax on
call pathogen#infect()

set nu
set tabstop=8 expandtab shiftwidth=4 softtabstop=4

filetype plugin indent on

au FileType html setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
au FileType htmldjango setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
set foldmethod=indent
set foldlevel=99

set laststatus=2
" autocmd FileType python compiler pylint
"Close documentation buffer automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set t_Co=256
set background=dark
colorscheme zenburn
"Away awfull pink background for omnicomplete
highlight Pmenu ctermbg=238 gui=bold

set cursorline

nnoremap <F5> :bn!<CR>
nnoremap <F6> :bp!<CR> 
nmap <F8> :TagbarToggle<CR>

nnoremap fq <ESC> :call CleanClose(1)<CR>
nnoremap fc <ESC>:call CleanClose(0)<CR>
nnoremap <C-F12> <ESC> :call CleanClose(1)<CR>
nnoremap <C-F1> <ESC>:call CleanClose(0)<CR>

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

let g:pylint_onwrite = 1
let NERDTreeIgnore=['\.pyc','\~']
let python_highlight_all = 1
let g:virtualenv_directory = '~/code/venvs'

let g:rainbow_active = 1
let g:vim_json_syntax_conceal = 0

let g:airline_powerline_fonts = 1

" let g:jedi#auto_initialization = 0

let g:typescript_compiler_options = '--jsx react'
