return {
  _copyST = (function(m)
    return function()
      local r = {}
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
    local r = {}
    for k, v in pairs(m) do
      r[k] = f(v)
    end
  end),

  _mapWithKey = (function(m, f)
    local r = {}
    for k, v in pairs(m) do
      r[k] = f(k)(v)
    end
  end),

  __foldM = (function(bind, f, mz, m)
    local acc = mz
    for k, v in pairs(m) do
      acc = bind(acc)(function(z)
        return f(z)(k)(v)
      end)
  end),

  _foldSCObject = (function(m, z, f, fromMaybe)
    local acc = z
    for k, v in pairs(m) do
      local maybeR = f(acc)(k)(v)
      -- I don't like this, but I'll implement it as it is in the JS for now
      -- then clean it up once I can actually test it!
      local r = fromMaybe(nil)(maybeR)
      if r == nil then
        return acc
      else
        acc = r
      end
    end
    return acc
  end),

  all = (function(m, f)
    for k, v in pairs(m) do
      if f(k)(v) == false then
        return false
      end
    end
    return true
  end),

  size = (function(m)
    local s = 0
    for k, v in pairs(m) do
      s += 1
    end
    return s
  end),

  _lookup = (function(no, yes, k, m)
    -- uhhhh. I really hope this works because this seems way too weird to be correct 😬
    if m[k] == nil then
      return no
    else
      return yes(m[k])
    end
  end),

  _lookupST = (function(no, yes, k, m)
    return function()
      if m[k] == nil then
        return no
      else
        return yes(m[k])
      end
    end
  end),

  toArrayWithKey = (function(f, m)
    
  end),

  keys = (function()
  end),
}
