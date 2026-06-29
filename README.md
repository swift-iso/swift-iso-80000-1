# ISO 80000-1

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The SI decimal prefixes of ISO 80000-1, *Quantities and units — Part 1: General*, for Swift — kilo, mega, milli, micro and the full set through quetta and quecto, each modelled by name, symbol, and power of ten. Foundation-free, with zero platform dependencies.

---

## Quick Start

`ISO_80000_1.Prefix` is the complete SI decimal prefix set as data: the twelve multiples (deca … quetta) and the twelve submultiples (deci … quecto), including the four prefixes adopted by the 27th General Conference on Weights and Measures in 2022 (ronna, quetta, ronto, quecto). Each prefix carries its `name`, its `symbol`, and its power of ten.

```swift
import ISO_80000_1

let kilo = ISO_80000_1.Prefix.kilo
kilo.name        // "kilo"
kilo.symbol      // "k"
kilo.exponent    // 3
kilo.factor      // 1000.0
```

The multiplier is exposed through `factor` as a `Double`, derived on demand from the stored exponent rather than kept as an expanded integer. Storing the exponent is what keeps the extremes representable: the largest multiple (10³⁰) overflows fixed-width integers, and every submultiple is fractional.

```swift
ISO_80000_1.Prefix.milli.factor    // 0.001
ISO_80000_1.Prefix.micro.symbol    // "µ"
ISO_80000_1.Prefix.quetta.factor   // 1e30  — a Double, so it never overflows
ISO_80000_1.Prefix.quecto.factor   // 1e-30
```

Iterate the canonical sets instead of hardcoding a prefix table of your own:

```swift
for prefix in ISO_80000_1.Prefix.all {
    print(prefix.symbol, prefix.exponent)   // q -30, r -27, … R 27, Q 30
}

ISO_80000_1.Prefix.multiples       // deca … quetta
ISO_80000_1.Prefix.submultiples    // deci … quecto
```

A `Prefix` is `Equatable`, `Hashable`, and `Sendable`, and prints as its symbol through `CustomStringConvertible`.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-iso/swift-iso-80000-1.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "ISO 80000-1", package: "swift-iso-80000-1")
    ]
)
```

Requires Swift 6.2 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Prefixes

| Name | Symbol | Power | | Name | Symbol | Power |
|-------|--------|-------|---|-------|--------|-------|
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

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Standard

This is an independent encoding of ISO 80000-1:2022. "ISO 80000-1" and the standard's content are the work of the International Organization for Standardization (ISO); the SI prefixes it adopts are defined by the Bureau International des Poids et Mesures (BIPM). This package is not affiliated with or endorsed by ISO or the BIPM.

The prefix set follows the 9th edition of the SI Brochure (BIPM), as amended by Resolution 3 of the 27th General Conference on Weights and Measures (2022).

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
