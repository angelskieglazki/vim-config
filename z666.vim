" Vim color file
" Maintainer:  Bram Moolenaar <Bram@vim.org>
" Last Change: 2001 Jul 23
" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.
" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&
" Remove all existing highlighting and set the defaults.
hi clear
" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "z666"
let s:disable_italic = get(g:,'colorscheme_primary_disable_italic', 0)

"Console Vim
if &t_Co == 256
  "Set color palette with 256 colors
  let s:RED    = '167'
  let s:GREEN  = '71'
  let s:YELLOW = '220'
  let s:BLUE   = '69'
  let s:BLACK  = '16'
  let s:DGREY  = '241'
  let s:LGREY  = '255'
  let s:WHITE  = '231'
else
  "Set color palette with color names
  let s:RED    = 'red'
  let s:GREEN  = 'green'
  let s:YELLOW = 'yellow'
  let s:BLUE   = 'blue'
  let s:BLACK  = 'black'
  let s:DGREY  = 'grey'
  let s:LGREY  = 'LightGrey'
  let s:WHITE  = 'white'
endif

"Set terminal mode and italics (if supported)
let s:M = 'cterm'
let s:I = 'none'
if !s:disable_italic
  let s:terms = ['rxvt', 'gnome-terminal']
  for s:term in s:terms
    if $TERM_PROGRAM =~ s:term
      let s:I = 'italic'
    endif
  endfor
endif

let s:GREY0  = s:WHITE
let s:GREY1  = s:LGREY
let s:GREY2  = s:DGREY
let s:BG     = s:BLACK
let s:GREYX = s:BLACK
let s:GREYY = s:GREY1

exe 'hi Visual       '.s:M.'bg='.s:GREYY.' '.s:M.'fg='.'NONE' .' '.s:M.'=none'
exe 'hi Pmenu        '.s:M.'bg='.s:GREYY.' '.s:M.'fg='.s:GREYX.' '.s:M.'=none'
exe 'hi Normal       '.s:M.'bg='.s:BG.' '.s:M.'fg='.'251'.' '.s:M.'=none'

