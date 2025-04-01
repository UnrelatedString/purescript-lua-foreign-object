return {
  new = (function()
    return {}
  end),
  peekImpl = (function(just, nothing, k, m)
    return function()
      if m[k] == nil then
        return nothing
      else
        return just(m[k])
    end
  end),
  pokeImpl = (function(k, v, m)
    return function()
      m[k] = v
      return m
    end
  end),
  deleteImpl = (function(k, m)
    return function()
      m[k] = nil
      return m
    end
  end),
}
