let mapleader=";"
set nocompatible               " be improved, required
filetype off                   " required
let NERDTreeIgnore = ['\.lo$', '\.o$', '\.swp$'] 

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()            " required
Plugin 'VundleVim/Vundle.vim'  " required

" ===================
" my plugins here
" ===================
Plugin 'Lokaltog/vim-powerline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kshenoy/vim-signature'
Plugin 'preservim/tagbar'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/landscape.vim'


" Need to config
Plugin 'preservim/nerdcommenter'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
"vim-scripts/DrawIt
"ericcurtin/CurtineIncSw.vim
"derekwyatt/vim-protodef
"gcmt/wildfire.vim
"sjl/gundo.vim
"Lokaltog/vim-easymotion
"suan/vim-instant-markdown
"bfrg/vim-cpp-modern
Plugin 'dyng/ctrlsf.vim'
"JBakamovic/cxxd-vim
"cloudhead/neovim-fuzzy

"COMPLETION
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}


" ===================
" end of plugins
" ===================
call vundle#end()               " required

filetype plugin indent on       " required
syntax enable
syntax on
set expandtab


" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect
" path to directory where libclang.so can be found
"let g:ncm2_pyclang#library_path = '/usr/lib/llvm-10/lib'
" or path to the libclang.so file
"let g:ncm2_pyclang#library_path = '/usr/lib/x86_64-linux-gnu/libclang-10.so.1'


" majutsushi/tagbar
let tagbar_left=0
nnoremap <Leader>t :TagbarToggle<CR>
let tagbar_width=64


" nerdtree
nmap <Leader>fl :NERDTreeToggle<CR>


"vim-scripts/DoxygenToolkit.vim
"Create documentation for function
nnoremap <Leader>dx :Dox<CR>


" dyng/ctrlsf.vim search in project
nnoremap <Leader>sp :CtrlSF<CR>


" YCM 补全

map <F9> :YcmCompleter GoToInclude<CR>
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

let g:ycm_clangd_binary_path = "/usr/bin/clangd-10"
let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0


let g:ycm_collect_identifiers_from_tags_files=0
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags

inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

"colorscheme primary
colorscheme z666

autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType c   setlocal tabstop=4 shiftwidth=4 softtabstop=4

