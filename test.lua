-- fix for compiler typo
os.execute("sed 's/patch_v = patches/patch_v = patches[k]/' output/test.lua > output/test_.lua")
-- I just have no idea what library this is from because it's inlined LMAO
os.execute("sed 's/for str in s:gmatch\\(\"\\(\\[\\^\" \\.\\. sep \\.\\. \"\\]\\+\\)\"\\)/local pattern; if string.len(sep) ~= 0 then pattern = \"([^\" .. sep .. \"]+)\" else pattern = \".\" end; for str in s:gmatch(pattern)/' output/test_.lua > output/test__.lua")
dofile("output/test__.lua").main()
