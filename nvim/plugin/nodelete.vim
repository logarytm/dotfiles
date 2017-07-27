function! NoDeleteAirlineFunc(...)
  let builder = a:1
  let context = a:2
  if exists('b:no_delete')
    call builder.add_section('airline_a_bold', ' WO ')
  endif
  return 0
endfunction

if !exists('no_delete_airline_status_added')
  let no_delete_airline_status_added = 1
  call airline#add_statusline_func('NoDeleteAirlineFunc')
  call airline#add_inactive_statusline_func('NoDeleteAirlineFunc')
endif

let g:no_delete_illegal_mappings = { 's': 'n,v', 'S': 'n,v', 'd': 'n,v', 'D': 'n,v', 'c': 'n,v', 'C': 'n,v', 'x': 'n,v', 'X': 'n,v', '<bs>': 'i', '<del>': 'i', '<c-w>': 'i', '<c-h>': 'i' }

function! InstallNoDeleteMappings()
  let b:no_delete_previous_mappings = {}
  for mapping in keys(g:no_delete_illegal_mappings)
    for mode in split(g:no_delete_illegal_mappings[mapping], ',')
      let b:no_delete_previous_mappings[mapping] = maparg(mapping, mode)
      execute mode . 'noremap <buffer> ' . mapping . ' <nop>'
    endfor
  endfor
  call airline#update_statusline()
endfunction

function! UninstallNoDeleteMappings()
  for mapping in keys(g:no_delete_illegal_mappings)
    for mode in split(g:no_delete_illegal_mappings[mapping], ',')
      let previous = b:no_delete_previous_mappings[mapping]
      if previous ==# ''
        execute mode . 'unmap <buffer> ' . mapping
      else
        execute mode . 'noremap <buffer> ' mapping . ' ' . previous
      endif
    endfor
  endfor
  let b:no_delete_previous_mappings = {}
  call airline#update_statusline()
endfunction

function! ToggleNoDelete()
  if exists('b:no_delete')
    unlet b:no_delete
    call UninstallNoDeleteMappings()
  else
    let b:no_delete = 1
    call InstallNoDeleteMappings()
  endif
endfunction

command! NoDelete call ToggleNoDelete()
