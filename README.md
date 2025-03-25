# purescript-lua-foreign-object

[![CI](https://github.com/UnrelatedString/purescript-lua-foreign-object/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/UnrelatedString/purescript-lua-foreign-object/actions/workflows/ci.yml)
![Latest Version Tag](https://img.shields.io/github/v/tag/UnrelatedString/purescript-lua-foreign-object )
[![Pursuit](https://pursuit.purescript.org/packages/purescript-lua-foreign-object/badge?)](https://pursuit.purescript.org/packages/purescript-lua-foreign-object)

Functions for working with homogeneous Lua tables from PureScript. Similar to using `Map String a` but simply reusing Lua tables, with the same API as `foreign-object` for the default JavaScript backend.

## Installation

```
spago install foreign-object
```

## Example

```purs
example = do
  let
    -- make an empty Object
    empty = FO.empty

    -- insert to an empty Object
    inserted = FO.insert "a" 1 empty

    -- or: use the singleton function
    -- singleton FO.singleton "a" 1

  -- lookup values for existing in the Object as a result of Maybe
  let lookup = FO.lookup "a" inserted
  Assert.assertEqual { actual: lookup, expected: Just 1 }

  -- delete a value from an Object
  let deleted = FO.delete "a" inserted
  Assert.assertEqual { actual: deleted, expected: FO.empty }

  let
    -- convert homogeneous records to Object
    converted = FO.fromHomogeneous { a: 1, b: 2, c: 3}
    -- check that the converted is equal to a regularly built Object
    built
      = FO.empty
      # FO.insert "a" 1
      # FO.insert "b" 2
      # FO.insert "c" 3

  Assert.assertEqual { actual: converted, expected: built }
```

See the [tests](test/Main.purs) for more examples.

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-foreign-object).
