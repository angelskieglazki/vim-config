" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=80
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set t_Co=256
set colorcolumn=80
syntax on
set syntax=c
set background=dark
colorscheme PaperColor

set backspace=indent,eol,start
set t_kD=^[[3~


call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'            " Project and file navigation


" autocompletion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
"Plug 'Valloric/YouCompleteMe'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'vim-scripts/EasyPeasy'

Plug 'NLKNguyen/papercolor-theme'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
"git
Plug 'airblade/vim-gitgutter'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'ericcurtin/CurtineIncSw.vim'
"LUL

call plug#end()

let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }


"let g:ycm_global_ycm_extra_conf = '/home/max/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 1
"let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
" make YCM compatible with UltiSnips (using supertab)	
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1


let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Ctrl-T - открыть окно ctags
nmap <C-t> :TagbarToggle<cr>
imap <C-t> <esc>:TagbarToggle<cr>i<right>

map <C-r> :NERDTreeToggle<CR>

set path=/usr/include,/usr/local/include
set tags=./tags,tags;$HOME
let g:include_paths = "/usr/include/,/usr/local/include/" 
let g:tag_directory = "~/.vim/tags/"
let g:lvimrc_filename = ".lvimrc"

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

" switch between header/source with F4
map <F4> :call CurtineIncSw()<CR>
" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" create YCM config
"map <F6> :YcmGenerateConfig<CR>
" build using makeprg with <F7>
"map <F7> :make<CR>
" build using makeprg with <S-F7>
"map <S-F7> :make clean all<CR>
"map <F9> :YcmCompleter GoToInclude<CR>

function UpdateCscopeDb()
    let extensions = ["*.cpp", "*.h", "*.hpp", "*.inl", "*.c"]
    let update_file_list = "find . -name " . join(extensions, " -o -name ") . " > ./cscope.files"
    echo update_file_list
    echo system(update_file_list)
    echo system("cscope -b")
    cscope kill 0
    cscope add .
endfunction

nmap <F10> :call UpdateCscopeDb()<cr>
vmap <F10> <esc>:call UpdateCscopeDb()<cr>
imap <F10> <esc>:call UpdateCscopeDb()<cr>
nmap <c-f> :cs find g <c-r>=expand("<cword>")<cr><cr>

" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif



set nospell
