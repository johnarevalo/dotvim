function Tapi_Imgcat(buff_num, b64_data)
  let imgcat_cmd = "\x1b]1337;File=inline=1 width=auto:" . a:b64_data . "\x07\n"
  echohl None
  call echoraw(imgcat_cmd) 
endfunction
" run in python:
" import base64
" with open("baboon.png", "rb") as f:
"    b64 = base64.b64encode(f.read()).decode('utf-8')
" print(f"\x1b]51;[\"call\", \"Tapi_Imgcat\", \"{b64}\"]\x07")
