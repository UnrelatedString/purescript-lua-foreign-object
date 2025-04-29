-- fix for compiler typo
os.execute("sed 's/patch_v = patches/patch_v = patches[k]/' output/test.lua > output/test_.lua")
dofile("output/test_.lua").main()
