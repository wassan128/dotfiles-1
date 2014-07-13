" vi 互換ではなくVim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化
filetype off
" neobundleでプラグインを管理
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'
" 以下のプラグインをバンドル
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'taichouchou2/vim-rsense'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kana/vim-submode'
" PHP
NeoBundle 'pasela/unite-fuel'
" NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'tobyS/pdv'
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates"
"nnoremap <C-p> :call pdv#DocumentCurrentLine()<CR>
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
" inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
" nnoremap <C-P> :call PhpDocSingle()<CR>
" vnoremap <C-P> :call PhpDocRange()<CR>
NeoBundle 'tobyS/vmustache'
NeoBundle 'SirVer/ultisnips'

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'bbatsov/rubocop'
" coffee-script syntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'
" シンタックス系プラグインをバンドル
" NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'violetyk/neocomplete-php.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" 実行プラグインをバンドル
NeoBundle 'thinca/vim-quickrun'
" 編集履歴管理
NeoBundle "sjl/gundo.vim"
" カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
let g:hybrid_use_iTerm_colors = 1
colorscheme jellybeans
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'
" ファイラー関連
nnoremap <Leader>e :VimFilerExplorer<CR>
nnoremap <Leader>g :GundoToggle<CR>
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_as_default_explorer = 1
"mru,reg,buf
" noremap :um :Unite file_mru -buffer-name=file_mru
" noremap :ur :Unite register -buffer-name=register
" noremap :ub :Unite buffer -buffer-name=buffer
" nnoremap <C-u>m  :Unite file_mru<CR>
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" タブ関連 http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap t <Nop>
nnoremap tj <C-w>j
nnoremap tk <C-w>k
nnoremap tl <C-w>l
nnoremap th <C-w>h
nnoremap tJ <C-w>J
nnoremap tK <C-w>K
nnoremap tL <C-w>L
nnoremap tH <C-w>H
nnoremap tn gt
nnoremap tp gT
nnoremap tr <C-w>r
nnoremap t= <C-w>=
nnoremap tw <C-w>w
nnoremap tz <C-w>_<C-w>|
nnoremap tZ <C-w>=
nnoremap tN :<C-u>bn<CR>
nnoremap tP :<C-u>bp<CR>
nnoremap tc :<C-u>tabnew<CR>
nnoremap tt :<C-u>Unite tab<CR>
nnoremap t" :<C-u>sp<CR>
nnoremap t<Bar> :<C-u>vs<CR>
nnoremap tm :<C-u>q<CR>
nnoremap tX :<C-u>bd<CR>
nnoremap tb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap tB :<C-u>Unite buffer -buffer-name=file<CR>
call submode#enter_with('bufmove', 'n', '', 't>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 't<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 't+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 't-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" コロンとセミコロンを入れ替え
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" 環境設定系
" オートインデント
set autoindent
" インデントのタイミング
set indentkeys=!^F,o,O,0<Bar>,0=where
" Shift+Tabでアンインデント
imap <S-Tab> <C-o><<
" インデントに空白を使用(タブキー入力はC-v <TAB>)
set expandtab
" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブキーでの幅、0=tabstop値
set softtabstop=0
" シンタックスハイライト
syntax on
" エンコード
set encoding=utf8
" ファイルエンコード
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" バックスペースで各種消せるようにする
set backspace=eol,start
" ビープ音を消す
set vb t_vb=
set novisualbell
" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed
" 不可視文字を表示
set list
" 行番号を表示
set number
" 右下に表示される行・列の番号を表示する
set ruler
" compatibleオプションをオフにする
set nocompatible
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=3
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" 文字がない場所にもカーソルを移動できるようにする
" set virtualedit=all
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
:set hlsearch
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" マウスモード有効
set mouse=a
" xtermとscreen対応
set ttymouse=xterm2
" コマンドを画面最下部に表示する
set showcmd
" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
        \   'right': [ [ 'syntastic', 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'component_expand': {
        \   'syntastic': 'SyntasticStatuslineFlag'
        \ },
        \ 'component_type': {
        \   'syntastic': 'error'
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ },
        \ 'component': {
        \   'readonly': '%{&readonly?"\u2b64":""}',
        \ },
        \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
        \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction
set laststatus=2

" カラー設定
set t_Co=256

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" vを二回で行末まで選択
vnoremap v $h
" TABにて対応ペアにジャンプ
nnoremap &lt;Tab&gt; %
vnoremap &lt;Tab&gt; %
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed,autoselect
endif

"表示行単位で行移動する
nnoremap <silent> j gj
nnoremap <silent> k gk
"インサートモードでも移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
"<space>j, <space>kで画面送り
noremap [Prefix]j <c-f><cr><cr>
noremap [Prefix]k <c-b><cr><cr>

" PHP用設定
" PHP辞書ファイル指定
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
" :makeでPHP構文チェック
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
" PHPの関数やクラスの折りたたみ
let php_folding = 0
" 文字列の中のSQLをハイライト
let php_sql_query = 1
" Baselibメソッドのハイライト
let php_baselib = 1
" HTMLもハイライト
let php_htmlInStrings = 1
" <? を無効にする→ハイライト除外にする
let php_noShortTags = 1
" ] や ) の対応エラーをハイライト
let php_parent_error_close = 1
let php_parent_error_open = 1
" SQLのPHP文字リテラルへの整形(:Sqltop, :Sqlfromp)
function! SQLToPHP()
%s/^\(.\+\)$/"\1 " \./g

normal G$
execute "normal ?.&lt;CR&gt;"
normal xxggVG
echo "Convert to PHP String is finished."
endfunction
command! Sqltop :call SQLToPHP()
function! SQLFromPHP()
%s/^"\(.\+\) " *\.*$/\1/g

normal ggVG
echo "Convert from PHP String is finished."
endfunction
command! Sqlfromp :call SQLFromPHP()
" ハイライト色設定
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'perl' : $HOME . '/.vim/dict/perl.dict',
    \ 'php' : $HOME . '/.vim/dict/php.dict'
\ }

" for neocomplete-php
let g:neocomplete_php_locale = 'ja'

" Neosnippet設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Perl用設定
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
" coffee-script設定
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

" Enable snipMate compatibility feature.↲
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets/snippets'

" Java用設定
"SQLのJava文字リテラルへの整形(:Sqltoj, :Sqlfromj)
function! SQLToJava()
%s/^\(.\+\)$/"\1 " \+/g

normal G$
execute "normal ?+\&lt;CR&gt;"
normal xxggVG
echo "Convert to Java String is finished."
endfunction
command! Sqltoj :call SQLToJava()
function! SQLFromJava()
%s/^"\(.\+\) " *+*$/\1/g

normal ggVG
echo "Convert from Java String is finished."
endfunction
command! Sqlfromj :call SQLFromJava()

" Ruby用設定
autocmd FileType ruby     setlocal sw=2 sts=2 ts=2 et
" :makeでRuby構文チェック
au FileType ruby setlocal makeprg=ruby\ -c\ %
au FileType ruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Scala用設定
" ファイルタイプの追加
augroup filetypedetect
autocmd! BufNewFile,BufRead *.scala setfiletype scala
autocmd! BufNewFile,BufRead *.sbt setfiletype scala
augroup END
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

" 行末、行の最初への移動のキーマップ設定
nmap <C-a> 0
nmap <C-e> $
imap <C-a> <C-o>0
imap <C-e> <C-o>$

" Ctrl+dで$、Ctrl+aで@
" inoremap <C-d> $
" inoremap <C-a> @

" \ + rでスクリプト実行
nmap <Leader>r <plug>(quickrun)

" 全角スペースのハイライトを設定
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

