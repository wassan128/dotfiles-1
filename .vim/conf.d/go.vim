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
