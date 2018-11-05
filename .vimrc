" echom ">^.^<"
filetype off
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Vundle begin
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'



" PLUGIN LIST
" ===========

" Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'vim-balakai'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ap/vim-buftabline'
Plugin 'junegunn/fzf.vim' " requires FZF. install via brew
Plugin 'itchyny/lightline.vim'
Plugin 'mileszs/ack.vim' " requires ACK and silver searcher. install via brew
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'marcweber/vim-addon-mw-utils' " vim-snipmate depedency
Plugin 'tomtom/tlib_vim' " vim-snipmate depedency
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'digitaltoad/vim-pug'
Plugin 'xolox/vim-misc' " vim-session dependency
Plugin 'xolox/vim-session'
Plugin 'qpkorr/vim-bufkill'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
" Plugin 'wavded/vim-stylus'
Plugin 'iloginow/vim-stylus'
" Plugin 'vim-scripts/vim-stylus'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'alampros/vim-styled-jsx'
" Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'vim-scripts/BufOnly.vim'
" php indentation solution
" https://stackoverflow.com/questions/459478/correct-indentation-of-html-and-php-using-vim/5997430#5997430
" Plugin 'Valloric/MatchTagAlways' # this plugin requires python apparently
Plugin 'godlygeek/tabular'

" Vundle end
call vundle#end()



" START
" =====

filetype plugin indent on
syntax on
colorscheme balakai



" MAPPINGS
" ========

" Nmap and nnoremap only work on normal mode
" Map and noremap work on visual, insert, replace

" Insert newline in normal mode
nmap <leader><Enter> o<Esc>
" Remap Space as leader
nmap <SPACE> <leader>
" Remove search highlight
nmap <leader>h :noh<cr>
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
" Go to end of character
vnoremap <c-l> g_
nnoremap <c-l> g_
" Go to beginning of character
nnoremap <c-h> ^
vnoremap <c-h> ^
" Move line one up
nnoremap <c-k> :m-2<cr>
" Move line one down
nnoremap <c-j> :m+1<cr>
" Open new terminal buffer
" nnoremap <c-t> :vs+te<cr>i
nnoremap <silent> <c-w><c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-w><c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-w><c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-w><c-l> :TmuxNavigateRight<cr>
" Map colon as semicolon
nnoremap ; :
" Open FZF with c-p shortcut
nnoremap <silent> <c-p> :FZF<cr>
" Open Ag with c-g shortcut
nnoremap <c-g> :Ag<cr>
" Kill buffer without leaving split window, ! is used to force kill terminal
map <c-c> :BD!<cr>
" only kill window if there are two windows
" map <c-x> :bp<bar>sp<bar>bn<bar>bd<CR>
" Escape terminal from nvim
" tnoremap <c-\><c-\> <c-\><c-n>
" NERDTreeToggle shortcut
map <c-n> :NERDTreeToggle<cr>
" Buftabline buffers list shortcut
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" keep yanked content in register
" https://stackoverflow.com/questions/10723700/how-can-vim-keep-the-content-of-register-when-pasting-over-selected-text
vnoremap <leader>p "_dP



" GLOBAL VARIABLES
" ================

" Tmux mappings doesn't work in vim. Vim has its own
let g:tmux_navigator_no_mappings=1
" FZF ignore folders based on .gitignore
let $FZF_DEFAULT_COMMAND='ag -g ""'
" Ordinal number, not buffer number
let g:buftabline_numbers=2
" Silver searcher
let g:ackprg='ag --nogroup --nocolor --column'
let g:ackprg="ag --vimgrep"
" Use JSX syntax in JS file. Vim-jsx
let g:jsx_ext_required=0
" Emmet settings
let g:user_emmet_settings={
\ 'javascript.jsx' : {
\		'extends' : 'jsx'
\	}
\}
let g:user_emmet_install_global=0
" Vim emmet remap leader key, only works in normal mode
let g:user_emmet_expandabbr_key='<Tab>'
let g:user_emmet_leader_key='<c-q>'
" REMEMBER VIM TREATS <TAB> AND <C-I> THE SAME https://www.reddit.com/r/vim/comments/3dauvp/i_cant_inoremap_tab_and_ci_to_different_things
let g:use_emmet_complete_tag=1
" Pretty nerdtree
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
" Disable html checker on syntastic
let g:syntastic_html_checkers=['']
" Buftabline indicator
" let g:buftabline_indicators=1



" ALL SETS
" ========

set hidden
" FZF vim runtime path
set rtp+=/usr/local/opt/fzf
" Set new vertical split to the right
set splitright
" Highlight search results
set hlsearch
" Ignore case
set ignorecase
" Already jump to the first hit during a search process
set incsearch
" NO backup and swap files
set nobackup
set noswapfile
" Disable bell
set vb t_vb=
" Show current command in the lower right corner
set showcmd
" Allow pattern matching with special characters (ie: newline) 
set magic
" Hide mode
set noshowmode
" Disable auto hide double quotes
set conceallevel=0
set noexpandtab 
set smartindent 
set autoindent  
set softtabstop=2
set tabstop=2
set shiftwidth=2
set laststatus=2
" Show relative number
set relativenumber
" Show line number
set number
" Tab, space, end of line, indicator
set listchars=tab:·\ ,trail:·,nbsp:_
" set listchars=tab:·\ ,trail:·,eol:¬,nbsp:_
set list



" AUTOCMDS
" ========

" Jsx comment for vim-commentary
autocmd FileType php.php setlocal commentstring={<!--\ %s\ -->}
autocmd FileType stylus setlocal commentstring=//\ %s
autocmd fileType javascript setlocal tabstop=2
autocmd FileType html,css,javascript.jsx,php EmmetInstall
autocmd FileType nerdtree setlocal relativenumber
" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set filetype as phtml on php files
" au BufNewFile,BufRead *.php set filetype=phtml
" autocmd filetype php set filtype=phtml



" FUNCTIONS
" =========

" Function to highlight cursorline and cursorlinenr
function! BufferNotActive()
	setlocal nocursorline nocursorcolumn
endfunction

function! BufferIsActive()
	setlocal cursorline
endfunction

" Execute macro over visual range
xnoremap @ :<c-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction



" AUTOGROUPS
" ==========

" Highlight current line only on active buffer
augroup CursorLine
	autocmd!
	au VimEnter,WinEnter,BufWinEnter * call BufferIsActive()
	au WinLeave * call BufferNotActive()
augroup END
" Make Esc happen without waiting for timeoutlen
augroup FastEscape
	autocmd!
	au InsertEnter * set timeoutlen=0
	au InsertLeave * set timeoutlen=1000
augroup END



" COLOR SETTINGS
" ==============

" Buftabline color settings
hi BufTabLineHidden guibg=#626262 ctermbg=241
hi BufTabLineCurrent guibg=#afdf00 guifg=#005f00 gui=bold ctermbg=148 ctermfg=22 cterm=bold
hi BufTabLineActive guibg=#ffffff guifg=#585858 gui=bold ctermbg=white ctermfg=240 cterm=bold
hi BufTabLineFill guibg=#626262 ctermbg=241
" Background transparent, iterm2 background will be visible
hi Normal guibg=none ctermbg=none
" Line number
hi LineNr guifg=#555555 guibg=none ctermfg=240 ctermbg=none
hi CursorLine ctermbg=237
" hi CursorLineNr guifg=#ffffff ctermfg=white ctermbg=236
hi CursorLineNr guifg=#ffffff ctermfg=white ctermbg=none
hi NonText guibg=none ctermbg=none
hi VertSplit guibg=#626262 guifg=#626262 ctermbg=241 ctermfg=241
hi NonText guifg=#555555 ctermfg=240
