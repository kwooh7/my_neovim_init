set nocompatible
filetype plugin indent on
syntax on

set go+=k
set fileencodings=euc-kr,utf8
set rnu
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set history=1000
set ruler
set showcmd
set wildmenu
set nohls
set nowrap
set eb
set is
set ignorecase
set smartcase
set lbr
set vb t_vb=
set signcolumn=yes
set scrolloff=8
"For autocompletion
set wildmode=list:longest
set laststatus=2
set autochdir
set autoread
set linespace=3
"colorscheme
set termguicolors
set bg=dark
set backspace=indent,eol,start
set splitbelow
set splitright
set nrformats+=alpha
""""
let mapleader=","
map <leader>w :w<CR>

set shell=cmd.exe

tnoremap <ESC> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
inoremap hh <ESC>2li
noremap <leader>y "+y
noremap <leader>p "+p
let g:vim_parinfer_mode = 'paren'


function! s:coc_plugins(hooktype, name) abort
    execute 'packadd ' . a:name " <-- this is the key
    call coc#util#install()
    call coc#util#install_extension(join(get(s:, 'coc_extensions', [])))
endfunction

"=============================================================
packadd minpac
call minpac#init()

call minpac#add('neoclide/coc.nvim', {'do': function('s:coc_plugins')})
call minpac#add('rafi/awesome-vim-colorschemes')
call minpac#add('k-takata/minpac',{'type':'opt'})
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-endwise')
call minpac#add('yggdroot/indentline')
call minpac#add('lambdalisue/fern.vim')
call minpac#add('lambdalisue/nerdfont.vim')
call minpac#add('lambdalisue/fern-renderer-nerdfont.vim')
call minpac#add('lambdalisue/vim-fullscreen')
call minpac#add('antoinemadec/FixCursorHold.nvim')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('vimwiki/vimwiki')
call minpac#add('fatih/vim-go')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('rust-lang/rust.vim')
call minpac#add('tomasiser/vim-code-dark')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('mhinz/vim-startify')
call minpac#add('liuchengxu/space-vim-theme')
call minpac#add('liuchengxu/vista.vim')
call minpac#add('wlangstroth/vim-racket')
call minpac#add('luochen1990/rainbow')
call minpac#add('bhurlow/vim-parinfer')
call minpac#add('dracula/vim', {'type' : 'opt', 'name':'dracula'})

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

packadd dracula
colorscheme dracula
let g:rainbow_active = 1

"Vista.vim settings
let g:vista_default_executive = 'coc'

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"=============================================================================
"coc-explorer settings
nnoremap <space>e :CocCommand explorer<CR>

"vimwiki
let g:vimwiki_list = [{'path': '~\vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.wiki': 'markdown'}
let g:vimwiki_listsyms = '✗○◐●✓'
au FileType markdown,vimwiki noremap <leader>mc :call ToggleConcealLevel()<CR>
function! ToggleConcealLevel()
    if &conceallevel
        setlocal conceallevel=0
    else
        setlocal conceallevel=2
    endif
endfunction

let g:go_def_mapping_enabled = 0
let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"

let g:airline_left_sep = "\uE0C0"
let g:airline_right_sep = "\uE0C2"
let g:airline_section_z = "%p%% : \ue0a1:%l/%L: Col:%c"
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='twofirewatch'
let g:indentLine_color_term = 000
let g:indentLine_gui = '#A4E57E'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:fern#renderer = "nerdfont"
"let g:autofmt_autosave = 1


noremap <silent> <F2> :Fern . -drawer -width=30 -toggle<CR><C-w>=
nnoremap <F5> :buffers<CR>:buffer<Space>

cnoremap <left> <Nop>
cnoremap <right> <Nop>
cnoremap <up> <Nop>
cnoremap <down> <Nop>

inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>

vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>
vnoremap <down> <Nop>

nnoremap <left> <Nop>
nnoremap <right> <Nop>
nnoremap <up> <Nop>
nnoremap <down> <Nop>


let g:python3_host_prog ='C:\Users\PC\AppData\Local\Programs\Python\Python39\python.EXE'

fun! TrimWhitespace()
   let l:save = winsaveview()
   keeppatterns %s/\s\+$//e
   call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
   autocmd!
   autocmd BufWritePre * :call TrimWhitespace()
augroup END


