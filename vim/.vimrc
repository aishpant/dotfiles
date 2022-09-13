let mapleader = ","
syntax enable
filetype plugin indent on
syn on se title
set number
set tabstop=8
set softtabstop=8
set shiftwidth=8
set expandtab
set clipboard=unnamed
set textwidth=80
set smarttab
set smartindent
set autoindent
set showmode
set autoread
set autowrite
set modelines=0
set nomodeline

au BufNewFile,BufRead *.c set tabstop=8 set softtabstop=8 set shiftwidth=8

"" Python specific formatting
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set t_Co=256
let g:color_coded_enabled = 1


" go-vim config
let g:go_list_type = "quickfix"
let g:go_list_type = "locationlist"
let g:go_list_type_commands = {"GoBuild": "quickfix"}
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" ctrl-p config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set runtimepath^=~/.vim/bundle/ctrlp.vim

set backspace=indent,eol,start

" vim-go extra syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" import go libraries on saving
let g:go_fmt_command = "goimports"

" run three types of linters
"let g:go_debug=['shell-commands']
let g:go_metalinter_command = 'gometalinter'
"let g:go_metalinter_command = ""
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['golint', 'errcheck', 'vet']
let g:go_metalinter_autosave_enabled = ['golint', 'errcheck', 'vet']

let g:go_metalinter_deadline = "10s"
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100
"let g:go_auto_sameids = 1
execute pathogen#infect()

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF<CR>

let g:deoplete#enable_at_startup = 1

set background=light
" colorscheme solarized

" ==================== Completion + Snippet ====================
" Ultisnips has native support for SuperTab. SuperTab does omnicompletion by
" pressing tab. I like this better than autocompletion, but it's still fast.
let g:SuperTabDefaultCompletionType = "context"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"  
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 
