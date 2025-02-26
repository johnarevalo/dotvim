function! Imgcat#Encode(filename)
  let b64_data = system('base64 ' . a:filename)
  let imgcat_cmd = "\x1b]1337;File=inline=1:" . b64_data . "\x07\n"
  echohl None
  call echoraw(imgcat_cmd) 
endfunction

command! -nargs=1 Imgcat :call Imgcat#Encode(<args>)
