function! s:Astyle()
  return '!astyle'
endfunction

let b:format_cmd_func = function('<SID>Astyle')
setlocal commentstring=//\ %s
