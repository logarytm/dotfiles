" hack-o-ramma to allow long abbreviations with semicolon
" source: https://stackoverflow.com/a/1680834/2212455
function! s:Expr(default, repl)
  if getline('.')[col('.')-2]=='\'
    return "\<bs>".a:repl
  else
    return a:default
  endif
endfunction

function! s:DefIab(nore, ...)
  let opt = ''
  let i = 0
  while i != len(a:000)
    let arg = a:000[i]
    if arg !~? '<buffer>\|<silent>'
      break
    endif
    let opt .= ' '.arg
    let i += 1
  endwhile

  if i+2 != len(a:000)
    throw "Invalid number of arguments"
  endif
  let lhs = a:000[i]
  let rhs = a:000[i+1]

  execute 'i'.a:nore.'ab'.opt.' '.lhs.' <c-r>=<sid>Expr('.string(lhs).', '.string(rhs).')<cr>'
endfunction

command! -nargs=+ InoreabWithBackslash call s:DefIab('nore', <f-args>)

inoreab \b \textbf
inoreab \i \textit
inoreab \t \texttt
inoreab \q \enquote
InoreabWithBackslash ch \chapter
InoreabWithBackslash sec \section
InoreabWithBackslash sub \subsection
InoreabWithBackslash subs \subsubsection

setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

onoremap <buffer> ig i{

nnoremap <buffer> <c-q> a<c-q>
inoremap <buffer> <c-q>a \begin{align*}<cr><++><cr>\end{align*}<esc>?<++><cr>"_c4l
