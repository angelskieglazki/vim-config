let mapleader=";"
set backspace=indent,eol,start
set t_kD=^[[3~
let NERDTreeIgnore = ['\.lo$', '\.o$', '\.swp$'] 


filetype on
filetype plugin on

nmap LB 0
nmap LE $

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

autocmd BufWritePost $MYVIMRC source $MYVIMRC

set incsearch
set ignorecase
set nocompatible
set wildmenu

set foldmethod=syntax 
set foldnestmax=10
set nofoldenable
set foldlevel=2
set hidden

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'ericcurtin/CurtineIncSw.vim'


" indexer, vimprj and DfrankUtil must used together
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/vimprj'
"Plugin 'vim-scripts/DfrankUtil'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'itchyny/landscape.vim'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'rhysd/vim-clang-format'
call vundle#end()

"vim-scripts/DoxygenToolkit.vim
"Create documentation for function
nnoremap <Leader>dx :Dox<CR>

"ericcurtin/CurtineIncSw.vim
"switch beetween header/sourse c
map <F4> :call CurtineIncSw()<CR>

"derekwyatt/vim-fswitch
"switch header/source cpp FIXME: need configuration
nmap <silent> <Leader>sw :FSHere<cr>

" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
set laststatus=2
set ruler
set number
set cursorline
set cursorcolumn
set hlsearch
set guifont=YaHei\ Consolas\ Hybrid\ 10.5
set nowrap

let g:Powerline_colorscheme='solarized256'
let g:multi_cursor_quit_key = '<C-q>'

filetype plugin indent on
syntax enable
syntax on

set expandtab
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType c   setlocal tabstop=4 shiftwidth=4 softtabstop=4


" majutsushi/tagbar
let tagbar_left=0
nnoremap <Leader>t :TagbarToggle<CR>
let tagbar_width=64

" dyng/ctrlsf.vim search in project
nnoremap <Leader>sp :CtrlSF<CR>


" 基于语义的代码导航
map <F9> :YcmCompleter GoToInclude<CR>
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>


" multicursor

" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>


" SirVer/ultisnips
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<C-z>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"




" >>
" YCM 补全


highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900


let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0


let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags


inoremap <leader>; <C-x><C-o>


set completeopt-=preview


let g:ycm_min_num_of_chars_for_completion=1


let g:ycm_cache_omnifunc=0


let g:ycm_seed_identifiers_with_syntax=1


 




let g:disable_protodef_sorting=1





 

source $VIMRUNTIME/ftplugin/man.vim


nmap <Leader>man :Man 3 <cword><CR>







nmap <Leader>fl :NERDTreeToggle<CR>

let NERDTreeWinSize=40

let NERDTreeWinPos="left"

let NERDTreeShowHidden=1

let NERDTreeMinimalUI=1

let NERDTreeAutoDeleteBuffer=1





 

map <Leader>bl :MBEToggle<cr>


map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>








set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"


set undodir=~/.undo_history/
set undofile



map <leader>ss :mksession! my.vim<cr>



map <leader>rs :source my.vim<cr>


 
nmap <Leader>m :wa<CR>:make<CR><CR>:cw<CR>
"nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
"nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>



 

map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)


let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]




nnoremap <Leader>ud :GundoToggle<CR>
set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme landscape 


highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/
highlight ColorColumn ctermbg=red
set colorcolumn=100

"set pastetoggle=<F10>
set nosmarttab

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

