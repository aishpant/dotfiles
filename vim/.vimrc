" run three types of linters
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint', 'errcheck', 'vet']

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()
