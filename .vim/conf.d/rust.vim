augroup MyVimrc
    autocmd!
augroup END
" racer の設定
let $RUST_SRC_PATH = expand('~/.ghq/github.com/rust-lang/rust/src')

" :QuickRun でファイル保存時にシンタックスチェック
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config['syntax/rust'] = {
            \   'command' : 'rustc',
            \   'cmdopt' : '-Zparse-only',
            \   'exec' : '%c %o %s:p',
            \   'outputter' : 'quickfix',
            \ }
autocmd MyVimrc FileType BufWritePost *.rs QuickRun -type syntax/rust
