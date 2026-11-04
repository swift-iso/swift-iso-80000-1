# swift-iso-80000-1

Use this package when you need the SI decimal prefixes, from quecto to quetta, with their names, symbols and powers of ten, instead of keeping your own table. Start from `ISO_80000_1.Prefix`.

## Laws

- The set is the 24 decimal prefixes of the SI as of 2022, including ronna, quetta, ronto and quecto. There is no prefix for a power of zero, and there are no binary prefixes such as kibi.
- `ISO_80000_1.Prefix.all` is ordered by ascending exponent, from quecto to quetta. `ISO_80000_1.Prefix.multiples` runs from deca to quetta and `ISO_80000_1.Prefix.submultiples` from deci to quecto.
- The micro symbol is U+00B5 MICRO SIGN, not the Greek letter mu U+03BC.
- A prefix prints as its symbol.
- `ISO_80000_1.Prefix.factor` is a `Double` computed from `base` and `exponent` each time it is read, so quetta and quecto don't overflow. It is built by repeated multiplication. It equals the decimal literal for small exponents such as kilo and milli, but for large ones it may differ from the literal in the last bits.
- Two prefixes are equal only if name, symbol, base and exponent all match.
