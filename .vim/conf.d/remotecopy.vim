function! s:Paste64Copy() range
  let l:tmp = @@
  silent normal gvy
  let l:selected = @@
  let l:i = 0
  let l:len = strlen(l:selected)
  let l:escaped = ''
  while l:i < l:len
    let l:c = strpart(l:selected, l:i, 1)
    let l:escaped .= printf("\\u%04x", char2nr(l:c))
    let l:i = l:i + 1
  endwhile
  if $TMUX != ""
    "tmuxのとき
    call system('printf "\x1bPtmux;\x1b\x1b]52;;%s\x1b\x1b\\\\\x1b\\" `echo -en "' . l:escaped . '" | base64` > /dev/tty')
  elseif $TERM == "screen"
    "GNU Screenのとき
    call system('printf "\x1bP\x1b]52;;%s\x07\x1b\\" `echo -en "' . l:escaped . '" | base64` > /dev/tty')
  else
    call system('printf "\x1b]52;;%s\x1b\\" `echo -en "' . l:escaped . '" | base64` > /dev/tty')
  endif
  redraw!
endfunction

command! -range Paste64Copy :call s:Paste64Copy()
