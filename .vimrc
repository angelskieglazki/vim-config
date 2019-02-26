let mapleader=";"
set backspace=indent,eol,start
set t_kD=^[[3~
let NERDTreeIgnore = ['\.o$']
let g:include_paths = "/usr/include/,/usr/local/include/,/usr/include/c++/8/"
set path=/usr/include,/usr/local/include
filetype on
filetype plugin on

nmap LB 0
nmap LE $

vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>

nnoremap nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j
nmap <Leader>M %

autocmd BufWritePost $MYVIMRC source $MYVIMRC
inoremap <leader>; <C-x><C-o>
set incsearch
set ignorecase
set nocompatible
set wildmenu

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'

" FIXME NEED TO CONFIGURATION
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
Plugin 'Evalir/dosbox-vim-colorscheme'
Plugin 'itchyny/landscape.vim'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'rhysd/vim-clang-format'
call vundle#end()
filetype plugin indent on

set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T

let g:clang_format#detect_style_file = 1
"let g:clang_format#code_style = "llvm"
"let g:clang_format#style_options = {
"            \ "Standard" : "C++11",
"            \ "BreakBeforeBraces" : "Linux"}

fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
map <silent> <F11> :call ToggleFullscreen()<CR>
" switch between header/source with F4
map <F4> :call CurtineIncSw()<CR>
"autocmd VimEnter * call ToggleFullscreen()

set laststatus=2
set ruler
set number
set cursorline
set cursorcolumn
set hlsearch
set guifont=YaHei\ Consolas\ Hybrid\ 10.5
set nowrap

let g:Powerline_colorscheme='solarized256'

" <<

" >>
" 语法分析

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" <<

" >>
" 缩进

" 自适应不同语言的智能缩进
filetype indent on

set expandtab
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType c   setlocal tabstop=4 shiftwidth=4 softtabstop=4

" 缩进可视化插件 Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"<<

" >>
" 代码折叠

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" switch header/source FIXME: need configuration
nmap <silent> <Leader>sw :FSHere<cr>


nmap <silent> <F1> :call HLMarks("Marks")<CR>
nmap <silent> <F2> :call clearmatches()<CR>
nmap <silent> <Leader><F2> :call clearmatches()\|:delmarks a-z<CR>
nmap <silent> <F5> :call AddHLMark("Marks")<CR>
nmap <silent> <Leader><F5> :call DelHLMark("Marks")<CR>
" <<

" >>
" 代码收藏

" 自定义 vim-signature 快捷键
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" <<

" >>
" 标签列表

" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=0
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>t :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
"let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
"let g:tagbar_type_cpp = {
"     \ 'ctagstype' : 'c++',
"     \ 'kinds'     : [
"         \ 'c:classes:0:1',
"         \ 'd:macros:0:1',
"         \ 'e:enumerators:0:0', 
"         \ 'f:functions:0:1',
"         \ 'g:enumeration:0:1',
"         \ 'l:local:0:1',
"         \ 'm:members:0:1',
"         \ 'n:namespaces:0:1',
"         \ 'p:functions_prototypes:0:1',
"         \ 's:structs:0:1',
"         \ 't:typedefs:0:1',
"         \ 'u:unions:0:1',
"         \ 'v:global:0:1',
"         \ 'x:external:0:1'
"     \ ],
"     \ 'sro'        : '::',
"     \ 'kind2scope' : {
"         \ 'g' : 'enum',
"         \ 'n' : 'namespace',
"         \ 'c' : 'class',
"         \ 's' : 'struct',
"         \ 'u' : 'union'
"     \ },
"     \ 'scope2kind' : {
"         \ 'enum'      : 'g',
"         \ 'namespace' : 'n',
"         \ 'class'     : 'c',
"         \ 'struct'    : 's',
"         \ 'union'     : 'u'
"     \ }
"\ }

" <<

" >>
" 代码导航
 
" 基于标签的代码导航

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航
map <F9> :YcmCompleter GoToInclude<CR>
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" <<

" >>
" 查找

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

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

" <<

" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

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

let NERDTreeWinSize=22

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


