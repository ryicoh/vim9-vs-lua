lua << EOF
function LuaHeavyTask()
  local items = {}
  for i = 1, 6000 do
    local item = {msg1 = 'hello ' }
    for j = 1, 100 do
      local key = 'msg' .. j
      if item[key] ~= nil then
        item['msg'] = 'key exists'
      end
    end
    item['msg'] = item['msg'] .. 'world'
    items[i] = item
  end

  print(#items, items[1]['msg1'], items[1]['msg'])
end
EOF


function! LuaHeavyTask() abort
    call luaeval("LuaHeavyTask()")
endfunction

def g:ProfileStart(func: string = '')
  profile start /tmp/vim_profile.txt
  profile file *
  execute printf('profile func %s', empty(func) ? '*' : func)
enddef
def g:ProfileStop()
  profile stop
enddef
