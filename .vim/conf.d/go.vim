" for Neobundle {{{
NeoBundle 'fatih/vim-go'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'vim-jp/vim-go-extra'
" vim-ft-goは最新版のvimを使えない場合のみ
NeoBundle 'google/vim-ft-go'
set rtp^=$GOPATH/src/github.com/nsf/gocode/vim
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

filetype plugin indent on
syntax on
NeoBundleCheck
" }}}

" for golang {{{
set path+=$GOPATH/src/**
let g:gofmt_command = 'goimports'
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=2 noexpandtab ts=2 completeopt=menu,preview
au BufNewFile,BufRead *.go setf go
au FileType go compiler go
" }}}
