scriptencoding utf-8

" LICENCE PUBLIQUE RIEN À BRANLER
" Version 1, Mars 2009
"
" Copyright (C) 2009 Sam Hocevar
" 14 rue de Plaisance, 75014 Paris, France
"
" La copie et la distribution de copies exactes de cette licence sont
" autorisées, et toute modification est permise à condition de changer
" le nom de la licence.
"
" CONDITIONS DE COPIE, DISTRIBUTON ET MODIFICATION
" DE LA LICENCE PUBLIQUE RIEN À BRANLER
"
" 0. Faites ce que vous voulez, j’en ai RIEN À BRANLER.

if exists('g:loaded_sentences') || &cp
  finish
endif
let g:loaded_sentences = 1

let s:keepcpo         = &cpo
set cpo&vim

" ------------------------------------------------------------------------------
command! -range=% -bar ChopSentences call sentences#chop(<line1>, <line2>)

nnoremap <silent> <plug>(ChopSentences) :<C-U>set  opfunc=sentences#chop<CR>g@
xnoremap <silent> <plug>(ChopSentences) :<C-U>call sentences#chop("'<", "'>")<CR>

if !hasmapto('<Plug>(ChopSentences)', 'n')
  silent! nmap <unique> gw <plug>(ChopSentences)
endif
if !hasmapto('<Plug>(ChopSentences)', 'x')
  silent! xmap <unique> gw <plug>(ChopSentences)
endif

if hasmapto('gw', 'n')
  onoremap     <SID>(underline) _
  silent! nmap <unique><expr> gww  'gw' . v:count1 . '<SID>(underline)'
  silent! nmap <unique>       gwgw gww
endif

" ------------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo