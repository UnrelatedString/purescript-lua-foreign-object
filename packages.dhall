let pslua-upstream =
      https://github.com/Unisay/purescript-lua-package-sets/releases/download/psc-0.15.15-20240829/packages.dhall
        sha256:02f528496825bbdd181c03b7f3907c75be4ff1644894f71ec1587c9e46b74ef3

let agnostic-upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.15-20250402/packages.dhall
        sha256:26fe324d4486e5c196a84a409994bebd9ea809ae95529af4d78f48782b748c36

let hack =
  { strings = pslua-upstream.strings //
      { repo = "https://github.com/UnrelatedString/purescript-lua-strings.git"
      }
  }


in  { packages = agnostic-upstream // pslua-upstream // hack
    , compiler = Text/replace "v" "" agnostic-upstream.metadata.version
    , version = "0.0.1"
    }
