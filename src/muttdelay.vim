" MUTTDELAY

function! MuttDelay()
  write
  let l:curfile = expand('%:p') 
  execute '!muttdelay vim "' . l:curfile . '"'
endfunction

