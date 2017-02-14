# RSA HASKELL
# functional programming classes at AGH UST


### Quick start
Dependencies: Cabal, Stack, HUnit, QuickCheck, Haddock

```bash
git clone https://github.com/gjasinski/rsa-haskell.git
cd rsa-haskell
stack build
```

####Generating RSA keys (public and private)
```bash
stack exec rsa-haskell-exe g
```
####Encrypting 
```
stack exec rsa-haskell e toEncryptFile outputFile Public Key
```

Example:
```
stack exec rsa-haskell-exe e test.txt out.txt 2683 25877
```

####Decrypting 
```
stack exec rsa-haskell d toDecryptFile outputFile Private Key
```

Example:
```
stack exec rsa-haskell-exe d out.txt out2.txt 7795 25877
```


#### Launching tests:
```bash
stack test
```

#### License

Copyright © 2017, Grzegorz Jasiński, Wojciech Chmielarz.
Released under the [MIT license](LICENSE).
