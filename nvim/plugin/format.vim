function! Format(range)
  if exists('b:format_cmd')
    execute '' . a:range . b:format_cmd
  elseif exists('b:format_cmd_function')
    execute '' . a:range . b:format_cmd_function()
  else
    echomsg 'No formatter specified for filetype “' . &filetype . '”'
  endif
endfunction
