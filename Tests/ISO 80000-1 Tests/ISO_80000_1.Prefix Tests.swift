// ISO_80000_1.Prefix Tests.swift

import ISO_80000_1
import Testing

extension ISO_80000_1.Prefix {
    @Suite("ISO 80000-1 Prefix")
    struct Tests {

        @Test func `the full SI decimal prefix set has 24 members`() {
            #expect(ISO_80000_1.Prefix.all.count == 24)
            #expect(ISO_80000_1.Prefix.multiples.count == 12)
            #expect(ISO_80000_1.Prefix.submultiples.count == 12)
        }

        @Test func `every prefix is decimal`() {
            for prefix in ISO_80000_1.Prefix.all {
                #expect(prefix.base == 10)
            }
        }

        @Test func `multiples have positive exponents and submultiples negative`() {
            for prefix in ISO_80000_1.Prefix.multiples {
                #expect(prefix.exponent > 0)
            }
            for prefix in ISO_80000_1.Prefix.submultiples {
                #expect(prefix.exponent < 0)
            }
        }

        @Test func `canonical exponents match the standard`() {
            #expect(ISO_80000_1.Prefix.deca.exponent == 1)
            #expect(ISO_80000_1.Prefix.hecto.exponent == 2)
            #expect(ISO_80000_1.Prefix.kilo.exponent == 3)
            #expect(ISO_80000_1.Prefix.mega.exponent == 6)
            #expect(ISO_80000_1.Prefix.giga.exponent == 9)
            #expect(ISO_80000_1.Prefix.tera.exponent == 12)
            #expect(ISO_80000_1.Prefix.peta.exponent == 15)
            #expect(ISO_80000_1.Prefix.exa.exponent == 18)
            #expect(ISO_80000_1.Prefix.zetta.exponent == 21)
            #expect(ISO_80000_1.Prefix.yotta.exponent == 24)
            #expect(ISO_80000_1.Prefix.ronna.exponent == 27)
            #expect(ISO_80000_1.Prefix.quetta.exponent == 30)

            #expect(ISO_80000_1.Prefix.deci.exponent == -1)
            #expect(ISO_80000_1.Prefix.centi.exponent == -2)
            #expect(ISO_80000_1.Prefix.milli.exponent == -3)
            #expect(ISO_80000_1.Prefix.micro.exponent == -6)
            #expect(ISO_80000_1.Prefix.nano.exponent == -9)
            #expect(ISO_80000_1.Prefix.pico.exponent == -12)
            #expect(ISO_80000_1.Prefix.femto.exponent == -15)
            #expect(ISO_80000_1.Prefix.atto.exponent == -18)
            #expect(ISO_80000_1.Prefix.zepto.exponent == -21)
            #expect(ISO_80000_1.Prefix.yocto.exponent == -24)
            #expect(ISO_80000_1.Prefix.ronto.exponent == -27)
            #expect(ISO_80000_1.Prefix.quecto.exponent == -30)
        }

        @Test func `canonical symbols match the standard`() {
            #expect(ISO_80000_1.Prefix.deca.symbol == "da")
            #expect(ISO_80000_1.Prefix.kilo.symbol == "k")
            #expect(ISO_80000_1.Prefix.mega.symbol == "M")
            #expect(ISO_80000_1.Prefix.giga.symbol == "G")
            #expect(ISO_80000_1.Prefix.ronna.symbol == "R")
            #expect(ISO_80000_1.Prefix.quetta.symbol == "Q")
            #expect(ISO_80000_1.Prefix.milli.symbol == "m")
            #expect(ISO_80000_1.Prefix.micro.symbol == "µ")
            #expect(ISO_80000_1.Prefix.nano.symbol == "n")
            #expect(ISO_80000_1.Prefix.ronto.symbol == "r")
            #expect(ISO_80000_1.Prefix.quecto.symbol == "q")
        }

        @Test func `factor is derived exactly for small exponents`() {
            #expect(ISO_80000_1.Prefix.deca.factor == 10.0)
            #expect(ISO_80000_1.Prefix.hecto.factor == 100.0)
            #expect(ISO_80000_1.Prefix.kilo.factor == 1000.0)
            #expect(ISO_80000_1.Prefix.mega.factor == 1_000_000.0)
            #expect(ISO_80000_1.Prefix.deci.factor == 0.1)
            #expect(ISO_80000_1.Prefix.centi.factor == 0.01)
            #expect(ISO_80000_1.Prefix.milli.factor == 0.001)
            #expect(ISO_80000_1.Prefix.micro.factor == 1e-6)
        }

        @Test func `factor handles large exponents without overflow`() {
            // 10³⁰ overflows UInt64 — the Double-derived factor stays finite.
            #expect(ISO_80000_1.Prefix.quetta.factor.isFinite)
            #expect(ISO_80000_1.Prefix.quetta.factor > 1e29)
            #expect(ISO_80000_1.Prefix.quecto.factor > 0)
            #expect(ISO_80000_1.Prefix.quecto.factor < 1e-29)
        }

        @Test func `description is the symbol`() {
            #expect(ISO_80000_1.Prefix.kilo.description == "k")
            #expect("\(ISO_80000_1.Prefix.micro)" == "µ")
        }

        @Test func `all is ordered by ascending exponent`() {
            let exponents = ISO_80000_1.Prefix.all.map(\.exponent)
            #expect(exponents == exponents.sorted())
            #expect(exponents.first == -30)
            #expect(exponents.last == 30)
        }
    }
}
