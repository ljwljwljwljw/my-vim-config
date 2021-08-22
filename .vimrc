syntax on

colorscheme torte

set number
set relativenumber
set ruler
set ignorecase
set hlsearch
set incsearch

" Turn off backup, swapfile
set nobackup
set noswapfile

set ai
set si
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
if has("autocmd")
  autocmd FileType make set noexpandtab
endif
set nowrap

let g:netrw_banner=0
command! Ll Lexplore | vertical resize 30

function! StartUpHook()
  if argc() && isdirectory(argv()[0]) && !exists("s:std_in")
    exe 'Ll'
  end
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call StartUpHook()

function TrimWhiteSpaces()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction

" key mappings
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <F2> :ls <CR>
nnoremap <F3> :echo strftime('%c') <CR>
nnoremap <F4> :call TrimWhiteSpaces() <CR>
nnoremap <Leader>l :vertical sbuffer # \| wincmd l <CR>
nnoremap <Leader>h :vertical belowright sbuffer # \| wincmd h <CR>
nnoremap <Leader>p :let @a = expand('%:p') \| echo @a <CR>
nnoremap <Leader>P :let @@ = expand('%:p') \| echo @@ <CR>
