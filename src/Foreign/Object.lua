return {
  _copyST = (function(m)
    return function()
      r = {}
      for k, v in pairs(m) do
        r[k] = v
      end
      return r
    end
  end),
  empty = {},
  runST = (function(f)
    f()
  end),
  _fmapObject = (function(m, f)
    r = {}
    for k, v in pairs(m) do
      r[k] = f(v)
    end
  end),
  _mapWithKey = (function(m, f)
    r = {}
    for k, v in pairs(m) do
      r[k] = f(k)(v)
    end
  end),
}
