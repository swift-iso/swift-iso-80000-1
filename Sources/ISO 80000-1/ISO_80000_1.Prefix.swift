// ISO_80000_1.Prefix.swift
// ISO 80000-1: SI decimal prefixes

extension ISO_80000_1 {
    /// An SI decimal prefix: a power-of-ten multiplier applied to a unit.
    ///
    /// A prefix is modelled by its `base` (always `10` for the SI decimal
    /// prefixes) raised to an integer `exponent`, together with the prefix
    /// `name` and `symbol`. The numeric multiplier is *not* stored: the
    /// largest multiple (10³⁰) overflows fixed-width integers and the
    /// submultiples are fractional, so the multiplier is derived on demand
    /// as a `Double` via ``factor``.
    ///
    /// ```swift
    /// ISO_80000_1.Prefix.kilo.exponent  // 3
    /// ISO_80000_1.Prefix.kilo.factor    // 1000.0
    /// ISO_80000_1.Prefix.milli.factor   // 0.001
    /// ```
    public struct Prefix {
        /// The prefix name (for example `"kilo"`).
        public let name: String

        /// The prefix symbol (for example `"k"`, `"µ"`).
        public let symbol: String

        /// The numeric base. `10` for every SI decimal prefix.
        public let base: Int

        /// The power to which ``base`` is raised (for example `3` for kilo,
        /// `-3` for milli).
        public let exponent: Int

        /// Creates a prefix from its name, symbol, base, and exponent.
        public init(name: String, symbol: String, base: Int = 10, exponent: Int) {
            self.name = name
            self.symbol = symbol
            self.base = base
            self.exponent = exponent
        }
    }
}

extension ISO_80000_1.Prefix: Equatable {}
extension ISO_80000_1.Prefix: Hashable {}
extension ISO_80000_1.Prefix: Sendable {}

extension ISO_80000_1.Prefix: CustomStringConvertible {
    public var description: String { symbol }
}

extension ISO_80000_1.Prefix {
    /// The multiplicative factor `base` raised to `exponent`, derived lazily.
    ///
    /// Returned as `Double` because the SI submultiples are fractional and the
    /// largest multiple (10³⁰) exceeds the range of `UInt64`. The factor is
    /// exact only for the non-negative exponents `0 ... 22`, where every power
    /// of ten is exactly representable in a binary64 `Double`. The submultiples
    /// (negative exponents) are fractional powers of ten — values such as 10⁻³
    /// are *not* exactly representable in binary64 — so their factor is the
    /// correctly rounded nearest `Double`; the same holds for multiples above
    /// 10²².
    public var factor: Double {
        let power = (0..<abs(exponent)).reduce(1.0) { product, _ in
            product * Double(base)
        }
        return exponent < 0 ? 1 / power : power
    }
}

// MARK: - Multiples (10¹ … 10³⁰)

extension ISO_80000_1.Prefix {
    /// deca — 10¹
    public static let deca = Self(name: "deca", symbol: "da", exponent: 1)
    /// hecto — 10²
    public static let hecto = Self(name: "hecto", symbol: "h", exponent: 2)
    /// kilo — 10³
    public static let kilo = Self(name: "kilo", symbol: "k", exponent: 3)
    /// mega — 10⁶
    public static let mega = Self(name: "mega", symbol: "M", exponent: 6)
    /// giga — 10⁹
    public static let giga = Self(name: "giga", symbol: "G", exponent: 9)
    /// tera — 10¹²
    public static let tera = Self(name: "tera", symbol: "T", exponent: 12)
    /// peta — 10¹⁵
    public static let peta = Self(name: "peta", symbol: "P", exponent: 15)
    /// exa — 10¹⁸
    public static let exa = Self(name: "exa", symbol: "E", exponent: 18)
    /// zetta — 10²¹
    public static let zetta = Self(name: "zetta", symbol: "Z", exponent: 21)
    /// yotta — 10²⁴
    public static let yotta = Self(name: "yotta", symbol: "Y", exponent: 24)
    /// ronna — 10²⁷ (added by the 27th CGPM, 2022)
    public static let ronna = Self(name: "ronna", symbol: "R", exponent: 27)
    /// quetta — 10³⁰ (added by the 27th CGPM, 2022)
    public static let quetta = Self(name: "quetta", symbol: "Q", exponent: 30)
}

// MARK: - Submultiples (10⁻¹ … 10⁻³⁰)

extension ISO_80000_1.Prefix {
    /// deci — 10⁻¹
    public static let deci = Self(name: "deci", symbol: "d", exponent: -1)
    /// centi — 10⁻²
    public static let centi = Self(name: "centi", symbol: "c", exponent: -2)
    /// milli — 10⁻³
    public static let milli = Self(name: "milli", symbol: "m", exponent: -3)
    /// micro — 10⁻⁶
    public static let micro = Self(name: "micro", symbol: "µ", exponent: -6)
    /// nano — 10⁻⁹
    public static let nano = Self(name: "nano", symbol: "n", exponent: -9)
    /// pico — 10⁻¹²
    public static let pico = Self(name: "pico", symbol: "p", exponent: -12)
    /// femto — 10⁻¹⁵
    public static let femto = Self(name: "femto", symbol: "f", exponent: -15)
    /// atto — 10⁻¹⁸
    public static let atto = Self(name: "atto", symbol: "a", exponent: -18)
    /// zepto — 10⁻²¹
    public static let zepto = Self(name: "zepto", symbol: "z", exponent: -21)
    /// yocto — 10⁻²⁴
    public static let yocto = Self(name: "yocto", symbol: "y", exponent: -24)
    /// ronto — 10⁻²⁷ (added by the 27th CGPM, 2022)
    public static let ronto = Self(name: "ronto", symbol: "r", exponent: -27)
    /// quecto — 10⁻³⁰ (added by the 27th CGPM, 2022)
    public static let quecto = Self(name: "quecto", symbol: "q", exponent: -30)
}

// MARK: - Collections

extension ISO_80000_1.Prefix {
    /// The multiples, in ascending order of exponent (deca … quetta).
    public static let multiples: [Self] = [
        .deca, .hecto, .kilo, .mega, .giga, .tera,
        .peta, .exa, .zetta, .yotta, .ronna, .quetta,
    ]

    /// The submultiples, in descending order of exponent (deci … quecto).
    public static let submultiples: [Self] = [
        .deci, .centi, .milli, .micro, .nano, .pico,
        .femto, .atto, .zepto, .yocto, .ronto, .quecto,
    ]

    /// Every SI decimal prefix, submultiples then multiples, in ascending
    /// order of exponent (quecto … quetta).
    public static let all: [Self] = submultiples.reversed() + multiples
}
