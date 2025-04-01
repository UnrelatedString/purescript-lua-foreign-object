module Foreign.Object.Unsafe
  ( unsafeIndex
  ) where

import Foreign.Object (Object)
import Data.Function.Uncurried (Fn2, runFn2)

-- | Unsafely get the value for a key in a object.
-- |
-- | This function does not check whether the key exists in the object.
unsafeIndex :: forall a. Object a -> String -> a 
unsafeIndex = runFn2 _unsafeIndex

foreign import _unsafeIndex :: forall a. Fn2 (Object a) String a
