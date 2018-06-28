
call plug#begin('~/.vim/plugged')
" NERD tree 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" vim-easy-align
Plug 'junegunn/vim-easy-align'
" Startify
Plug 'mhinz/vim-startify'
" Easy Motion
Plug 'easymotion/vim-easymotion'
" Surround
Plug 'tpope/vim-surround'
" Source Insight Modle
Plug 'wesleyche/SrcExpl'
" Use [ga] to format the code 
Plug 'junegunn/vim-easy-align' 
" Airline
Plug 'vim-airline/vim-airline'
" Airline-themes
Plug 'vim-airline/vim-airline-themes'
Plug 'jnurmine/Zenburn'


call plug#end()

set runtimepath+=~/.vim

set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start  " make that backspace key work the way it should
set nocompatible                " vi compatible is LAME
set showmode                    " show the current mode
set mouse=a                     " mouse enable
set showcmd                     " show the current cmd
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows

set nu     " Set the line number
syntax on  " Syntax highlighting

set t_Co=256
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab


set autoindent  " Copy indent from current line when starting a new line
set smartindent
set cindent
set virtualedit=all


set hlsearch  " Highlight the search result
set incsearch  " Real-time search
set ignorecase
set smartcase
set showmatch 


set list
set listchars=tab:>-,trail:-


set foldmethod=syntax
set foldlevel=100

" EasyAlign Plugin
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:tabular_loaded = 1


let Tlist_Show_One_File   = 1
let Tlist_WinWidth        = 45
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Left_Window = 1


let g:airline_powerline_fonts                   = 1
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled     = 0
let g:airline#extensions#whitespace#symbol      = '!'


" Set SPACE As My <Leader>    
let mapleader = "\<Space>"

nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

colorscheme  desert


set background=dark
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorline
set hlsearch
set relativenumber
set splitbelow
set splitright

"Vim GUI Config 
set guifont=Consolas:h12
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
set guioptions-=e
set nolist

set autoindent
set smartindent
set expandtab
syntax on

set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'

map <F2> :Tlist<CR>
map <F2> :TlistToggle<CR>
let g:List_Exit_OnlyWindow=1


map <F3> :NERDTree<CR>
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="Right"
let g:NERDTreeWinSize=35
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1


map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "set fileencoding=utf-8"
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -DLOCAL -o  %<"
        exec "!./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++11 -DLOCAL -Dxiaoai -o    %<"
        exec "!./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'html'
        exec "!chrome % &"
    endif
endfunc

"SET Comment START

autocmd BufNewFile *.php,*.js,*.cpp,*.sh,*.py exec ":call SetComment()" |normal 10Go
func SetComment()
    if expand("%:e") == 'php'
        call setline(1, "<?php")
    elseif expand("%:e") == 'js'
        call setline(1, '//JavaScript file')
    elseif expand("%:e") == 'cpp'
        call setline(1, '//C++ file')
    elseif expand("%:e") == 'sh'
        call setline(1, '#!/bin/sh')
    elseif expand("%:e") == 'py'
        call setline(1, '#!/bin/python')
    endif
    call append(1, '#***********************************************')
    call append(2, '#')
    call append(3, '#      Filename: '.expand("%"))
    call append(4, '#')
    call append(5, '#        Author:   VACUUMSONG@163.com')
    call append(6, '#   Description: ---')
    call append(7, '#        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(8, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(9, '#***********************************************')
    "    call append(10, '')
endfunc
map <F4> :call SetComment()<CR>:10<CR>o
"SET Comment END

"SET Last Modified Time START
func DataInsert()
    call cursor(9,1)
    if search ('Last Modified') != 0
        let line = line('.')
        call setline(line, '# Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    endif
endfunc

autocmd FileWritePre,BufWritePre *.php,*.js,*.cpp,*.sh,*.py ks|call DataInsert() |'s
" Ali: to indent json files on save
autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool

" SET Last Modified Time END
" // The switch of the Source Explorer 
nmap <F8> :SrcExplToggle<CR> 
" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 
" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_" 
        \ ] 
" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
" // Set "<F9>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F9>" 
" // Set "<F10>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F10>" 
" // Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>" 
