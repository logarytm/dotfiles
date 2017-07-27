function! s:Astyle()
  return '!astyle'
endfunction

let b:format_cmd_function = function('<SID>Astyle')
setlocal commentstring=//\ %s
