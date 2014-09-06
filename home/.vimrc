filetype on
filetype off
call pathogen#infect()
filetype plugin indent on

" disable vi compatibility
set nocompatible

set t_Co=256
" theme stuff
"colors desert256
"colors wombat256
"colors tir_black
if has('gui_running')
  colors calmar256-dark
else
  colors calmar256-dark
endif
syntax on
set cursorline

set guifont=Envy\ Code\ R:h12

"highlight column 80 and 120
"set colorcolumn=80,120
"highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight ColorColumn ctermbg=233 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

" GUI - hide toolbar and scrollbars
set guioptions-=r
set guioptions-=L
set guioptions-=T

" smart indent for easier code formatting
set smartindent

" disable audio bell
set visualbell

" centralize swap files
set backupdir=~/.vim/swap
set directory=~/.vim/swap

" show line numbers
set number
" changed line number color
:highlight LineNr ctermfg=grey

" always keep some lines below the cursor
set scrolloff=5

" make search case-insensitive
set ic

" make searches taht contain a capital letter case-sensitive
set scs

" set up tabbing to use 2-spaces, no tab chars
set expandtab
set shiftwidth=2
set softtabstop=2

" Set the tag file
set tags=./tags;
set tags+=gems.tags
" ctags usage
" ctags -R --exclude=.git --exclude=log *
" <C-]> jumps to definition

" Use Ack instead of grep
set grepprg=ack

" highlight unwanted whitesapce
highligh ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" change <Leader> from \ to ,
let mapleader = ","

" custom key mappings
:imap jj <Esc>
":imap '' <Esc>ZZ
:imap qq <Esc>:NERDTreeToggle<CR>
:imap \\ <C-x><C-o>
:map qq :NERDTreeToggle<CR>
:map ff ZZ
":map <A-l> :tabn<CR>
":map <A-h> :tabp<CR>
":map <A-n> :tabnew<CR>
:map tm0 :tabm 0<CR>
:map tm1 :tabm 1<CR>
:map tm2 :tabm 2<CR>
:map tm3 :tabm 3<CR>
:map tm4 :tabm 4<CR>
:map tm5 :tabm 5<CR>
:map tm6 :tabm 6<CR>
:map tm7 :tabm 7<CR>
:map tm8 :tabm 8<CR>
:map tm9 :tabm 9<CR>
:map <f11> :set number<CR>
:map <f12> :set nonumber<CR>
:map <C-j> :wincmd j<CR>
:map <C-k> :wincmd k<CR>
:map <C-l> :wincmd l<CR>
:map <C-h> :wincmd h<CR>
:map <M-j> :10winc +<CR>
:map <M-k> :10winc -<CR>
:map <M-h> :10winc <<CR>
:map <M-l> :10winc ><CR>
:map <M-=> :winc =<CR>

" vim-rails mappings
":cmap rails Rails s
":cmap rc Rails c
":cmap ec Econtroller 
":cmap emo Emodel 
":cmap ev Eview 

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" git blame visual selection
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" turn off auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
