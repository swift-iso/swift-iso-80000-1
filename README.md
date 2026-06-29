# swift-iso-80000-1

A Foundation-free Swift encoding of the SI decimal prefixes defined in
ISO 80000-1, *Quantities and units — Part 1: General*.

## Overview

ISO 80000-1 adopts the SI prefixes: the decimal multipliers applied to unit
symbols (`km`, `MHz`, `µs`, …). This package encodes them as a faithful,
dependency-free data model. Each prefix carries its name, its symbol, and its
power of ten; the numeric multiplier is derived on demand rather than stored,
because the largest multiple (10³⁰) overflows fixed-width integers and the
submultiples are fractional.

The full current set is included, with the four prefixes adopted by the 27th
General Conference on Weights and Measures in 2022 (ronna, quetta, ronto,
quecto).

## Key features

- The complete SI decimal prefix set — 12 multiples and 12 submultiples.
- Each prefix modelled as `(base: 10, exponent: Int)` plus name and symbol; no
  expanded integer factor is stored, so nothing overflows and the prefix
  definitions stay exact.
- `factor` derived lazily as a `Double` — exact for the non-negative exponents
  up to 10²² (every power of ten in that range is exactly representable in
  binary64); submultiples (negative powers of ten) and multiples above 10²²
  are the correctly rounded nearest `Double`.
- No dependencies beyond the Swift standard library; no `import Foundation`.

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-iso/swift-iso-80000-1.git", branch: "main")
]
```

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "ISO 80000-1", package: "swift-iso-80000-1")
    ]
)
```

## Usage

```swift
import ISO_80000_1

let k = ISO_80000_1.Prefix.kilo
k.name       // "kilo"
k.symbol     // "k"
k.exponent   // 3
k.factor     // 1000.0

ISO_80000_1.Prefix.micro.symbol   // "µ"
ISO_80000_1.Prefix.milli.factor   // 0.001
ISO_80000_1.Prefix.quetta.factor  // 1e30 (a Double — never overflows)

ISO_80000_1.Prefix.all            // every prefix, quecto … quetta
ISO_80000_1.Prefix.multiples      // deca … quetta
ISO_80000_1.Prefix.submultiples   // deci … quecto
```

## The prefixes

| Name | Symbol | Power | | Name | Symbol | Power |
|------|--------|-------|---|------|--------|-------|
| deca | da | 10¹ | | deci | d | 10⁻¹ |
| hecto | h | 10² | | centi | c | 10⁻² |
| kilo | k | 10³ | | milli | m | 10⁻³ |
| mega | M | 10⁶ | | micro | µ | 10⁻⁶ |
| giga | G | 10⁹ | | nano | n | 10⁻⁹ |
| tera | T | 10¹² | | pico | p | 10⁻¹² |
| peta | P | 10¹⁵ | | femto | f | 10⁻¹⁵ |
| exa | E | 10¹⁸ | | atto | a | 10⁻¹⁸ |
| zetta | Z | 10²¹ | | zepto | z | 10⁻²¹ |
| yotta | Y | 10²⁴ | | yocto | y | 10⁻²⁴ |
| ronna | R | 10²⁷ | | ronto | r | 10⁻²⁷ |
| quetta | Q | 10³⁰ | | quecto | q | 10⁻³⁰ |

## Standard

This is an independent implementation of ISO 80000-1:2022. "ISO 80000-1" and
the standard's content are the work of the International Organization for
Standardization (ISO); the SI prefixes it adopts are defined by the Bureau
International des Poids et Mesures (BIPM). This package is not affiliated with
or endorsed by ISO or the BIPM.

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).

## References

- ISO 80000-1:2022 — Quantities and units — Part 1: General.
- SI Brochure, 9th edition (BIPM), as amended by Resolution 3 of the 27th CGPM (2022).
