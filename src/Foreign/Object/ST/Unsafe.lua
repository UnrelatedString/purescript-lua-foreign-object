return {
  unsafeFreeze = (function(m)
    return function()
      return m
    end
  end)
}
