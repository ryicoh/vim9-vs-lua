# Performance comparison between lua and vim9script

Results:

```
FUNCTION  Vim9HeavyTask()
    Defined: /private/tmp/vim9-vs-lua/vim9.vim:3
Called 1 time
Total time:   0.243176
 Self time:   0.243176

count  total (s)   self (s)
                              # final items: list<dict<string>> = 6000->range()->map((_, _) => ({'msg1': 'hello'}))
                              # final keys: list<string> = 100->range()->map((i, _) => 'msg' .. i)
                            
    1              0.000000   final items: list<dict<string>> = []
    1              0.000001   for i in range(6000)
 6000              0.001612     final item = {'msg1': 'hello ' }
 6000              0.000349     for j in range(100)
600000              0.133252       final key = 'msg' .. j
600000              0.059444       if item->has_key(key)
 6000              0.000951         item['msg'] = 'key exists'
 6000              0.000081       endif
600000              0.010502     endfor
 6000              0.002773     item['msg'] ..= item->get('msg', '') .. 'world'
 6000              0.000574     items[i] = item
 6000              0.000096   endfor
                            
    1              0.000025   echomsg len(items) items[0]['msg1'] items[0]['msg']
```

```
FUNCTION  LuaHeavyTask()
    Defined: /private/tmp/vim9-vs-lua/lua.vim:21
Called 1 time
Total time:   0.053802
 Self time:   0.053802

count  total (s)   self (s)
    1              0.053801     call luaeval("LuaHeavyTask()")
```
