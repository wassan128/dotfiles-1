let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.config/nvim')
let s:dein_repo_dir = expand('~/.cache/dein.vim')

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

" call dein#load_state(s:dein_repo_dir)
if !dein#load_state(s:dein_repo_dir)
  finish
endif

let s:toml = s:dein_dir . '/dein.toml'
let s:toml_lazy = s:dein_dir . '/dein_lazy.toml'

call dein#begin(s:dein_repo_dir, [expand('<sfile>'), s:toml, s:toml_lazy])

call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:toml_lazy, {'lazy': 1})

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
