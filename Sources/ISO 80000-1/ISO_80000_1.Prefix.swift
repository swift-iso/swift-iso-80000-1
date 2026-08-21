extension ISO_80000_1 {

    public struct Prefix {

        public let name: String

        public let symbol: String

        public let base: Int

        public let exponent: Int

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

    public var factor: Double {
        let power = (0..<abs(exponent)).reduce(1.0) { product, _ in
            product * Double(base)
        }
        return exponent < 0 ? 1 / power : power
    }
}

extension ISO_80000_1.Prefix {

    public static let deca = Self(name: "deca", symbol: "da", exponent: 1)

    public static let hecto = Self(name: "hecto", symbol: "h", exponent: 2)

    public static let kilo = Self(name: "kilo", symbol: "k", exponent: 3)

    public static let mega = Self(name: "mega", symbol: "M", exponent: 6)

    public static let giga = Self(name: "giga", symbol: "G", exponent: 9)

    public static let tera = Self(name: "tera", symbol: "T", exponent: 12)

    public static let peta = Self(name: "peta", symbol: "P", exponent: 15)

    public static let exa = Self(name: "exa", symbol: "E", exponent: 18)

    public static let zetta = Self(name: "zetta", symbol: "Z", exponent: 21)

    public static let yotta = Self(name: "yotta", symbol: "Y", exponent: 24)

    public static let ronna = Self(name: "ronna", symbol: "R", exponent: 27)

    public static let quetta = Self(name: "quetta", symbol: "Q", exponent: 30)
}

extension ISO_80000_1.Prefix {

    public static let deci = Self(name: "deci", symbol: "d", exponent: -1)

    public static let centi = Self(name: "centi", symbol: "c", exponent: -2)

    public static let milli = Self(name: "milli", symbol: "m", exponent: -3)

    public static let micro = Self(name: "micro", symbol: "µ", exponent: -6)

    public static let nano = Self(name: "nano", symbol: "n", exponent: -9)

    public static let pico = Self(name: "pico", symbol: "p", exponent: -12)

    public static let femto = Self(name: "femto", symbol: "f", exponent: -15)

    public static let atto = Self(name: "atto", symbol: "a", exponent: -18)

    public static let zepto = Self(name: "zepto", symbol: "z", exponent: -21)

    public static let yocto = Self(name: "yocto", symbol: "y", exponent: -24)

    public static let ronto = Self(name: "ronto", symbol: "r", exponent: -27)

    public static let quecto = Self(name: "quecto", symbol: "q", exponent: -30)
}

extension ISO_80000_1.Prefix {

    public static let multiples: [Self] = [
        .deca, .hecto, .kilo, .mega, .giga, .tera,
        .peta, .exa, .zetta, .yotta, .ronna, .quetta,
    ]

    public static let submultiples: [Self] = [
        .deci, .centi, .milli, .micro, .nano, .pico,
        .femto, .atto, .zepto, .yocto, .ronto, .quecto,
    ]

    public static let all: [Self] = submultiples.reversed() + multiples
}
