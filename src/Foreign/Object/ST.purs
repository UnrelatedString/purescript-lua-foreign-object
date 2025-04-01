-- | Helper functions for working with mutable objects using the `ST` effect.
-- |
-- | This module can be used when performance is important and mutation is a
-- | local effect.

module Foreign.Object.ST
  ( STObject
  , new
  , peek
  , poke
  , delete
  ) where

import Control.Monad.ST (ST, Region)
import Data.Maybe (Maybe(..))
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4)

-- | A reference to a mutable object
-- |
-- | The first type parameter represents the memory region which the map belongs
-- | to. The second type parameter defines the type of elements of the mutable
-- | object.
-- |
-- | The runtime representation of a value of type `STObject r a` is the same as
-- | that of `Object a`, except that mutation is allowed.
foreign import data STObject :: Region -> Type -> Type

type role STObject nominal representational

-- | Create a new, empty mutable object
foreign import new :: forall a r. ST r (STObject r a)

-- | Get the value for a key in a mutable object
peek :: forall a r. String -> STObject r a -> ST r (Maybe a)
peek = runFn4 peekImpl Just Nothing

foreign import peekImpl :: forall a b r. Fn4 (a -> b) b String (STObject r a) (ST r b)

-- | Update the value for a key in a mutable object
poke :: forall a r. String -> a -> STObject r a -> ST r (STObject r a)
poke = runFn3 pokeImpl

foreign import pokeImpl :: forall a r. Fn3 String a (STObject r a) (ST r (STObject r a))

-- | Remove a key and the corresponding value from a mutable object
delete :: forall a r. String -> STObject r a -> ST r (STObject r a)
delete = runFn2 deleteImpl

foreign import deleteImpl :: forall a r. Fn2 String (STObject r a) (ST r (STObject r a))
