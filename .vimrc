" echom ">^.^<"
filetype off

call plug#begin('~/.vim/plugged')

" VIM STYLING
Plug 'tomasr/molokai'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'

" VIM ESSENTIALS
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc' " needs vim-session
Plug 'vim-scripts/BufOnly.vim'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" CODE STYLING
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'

let g:polyglot_disabled = ['vue']

" TMUX
Plug 'christoomey/vim-tmux-navigator'

call plug#end()



" START
" =====

" SETS
filetype plugin indent on
syntax enable
set updatetime=100 " vim-gitgutter needs lower updatetime to update file diff quicker

"set termguicolors
colorscheme molokai
let g:molokai_original = 1



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
" NERDTreeToggle shortcut
map <c-n> :NERDTreeToggle<cr>
" set tab to go to the next tab
" nnoremap <tab> :bnext<CR>
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
" let g:ackprg='ag --nogroup --nocolor --column'
" let g:ackprg="ag --vimgrep"
" Use JSX syntax in JS file. Vim-jsx

autocmd FileType html,css,javascript.jsx,php EmmetInstall
let g:user_emmet_mode='n'
let g:user_emmet_leader_key='<C-z>'
" REMEMBER VIM TREATS <TAB> AND <C-I> THE SAME https://www.reddit.com/r/vim/comments/3dauvp/i_cant_inoremap_tab_and_ci_to_different_things
 "let g:use_emmet_complete_tag=1

" Pretty nerdtree
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
" Buftabline indicator
let g:buftabline_indicators=1



" ALL SETS
" ========

set rtp+=/usr/local/opt/fzf
set hidden
set splitright
set hlsearch
set ignorecase
set incsearch
set nobackup
set noswapfile
set vb t_vb=
set showcmd
set magic
set noshowmode
set conceallevel=0
set noexpandtab 
set softtabstop=2
set tabstop=2
set shiftwidth=2
set laststatus=2
set relativenumber
set number
set showbreak=↪\ 
set list
set listchars=tab:·\ ,trail:·,nbsp:_


" AUTOCMDS
" ========

" Jsx comment for vim-commentary
autocmd FileType php setlocal commentstring={<!--\ %s\ -->}
autocmd FileType stylus setlocal commentstring=//\ %s
autocmd fileType javascript setlocal tabstop=2
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



" COLOR SETTINGS
" ==============

" Buftabline color settings

hi BufTabLineHidden guibg=#626262 ctermbg=241
hi BufTabLineCurrent guibg=#afdf00 guifg=#005f00 gui=bold ctermbg=148 ctermfg=22 cterm=bold
hi BufTabLineActive guibg=#ffffff guifg=#585858 gui=bold ctermbg=white ctermfg=240 cterm=bold
hi BufTabLineFill guibg=#626262 ctermbg=241
hi VertSplit guibg=#626262 guifg=#626262 ctermbg=241 ctermfg=241

"hi CursorLine ctermbg=237
"hi LineNr guifg=#555555 guibg=#000000 ctermfg=240 ctermfg=gray
"hi CursorLineNr guifg=#ffffff ctermfg=white ctermbg=black

" CHANGE CURSOR UPON ENTERING INSERT MODE
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

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







" Linting
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" let g:prettier#autoformat = 0
" autocmd BufWritePre *.html,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync



" COC VIM SETTINGS

" command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
\'coc-tsserver',
\'coc-phpls',
\'coc-json',
\'coc-ultisnips',
\'coc-tailwindcss',
\'coc-css'
\]

" \'coc-prettier',

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
