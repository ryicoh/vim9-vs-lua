vim9script noclear

def g:Vim9HeavyTask()
  # final items: list<dict<string>> = 6000->range()->map((_, _) => ({'msg1': 'hello'}))
  # final keys: list<string> = 100->range()->map((i, _) => 'msg' .. i)

  final items: list<dict<string>> = []
  for i in range(6000)
    final item = {'msg1': 'hello ' }
    for j in range(100)
      final key = 'msg' .. j
      if item->has_key(key)
        item['msg'] = 'key exists'
      endif
    endfor
    item['msg'] ..= item->get('msg', '') .. 'world'
    items[i] = item
  endfor

  echomsg len(items) items[0]['msg1'] items[0]['msg']
enddef

defcompile g:Vim9HeavyTask

def g:ProfileStart(func: string = '')
  profile start /tmp/vim_profile.txt
  profile file *
  execute printf('profile func %s', empty(func) ? '*' : func)
enddef
def g:ProfileStop()
  profile stop
enddef
