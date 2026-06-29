// ISO_80000_1.swift
// ISO 80000-1: Quantities and units — Part 1: General

/// ISO 80000-1 namespace.
///
/// ISO 80000-1 is the general part of the ISO 80000 series, *Quantities and
/// units*. Among other general provisions it adopts the SI prefixes — the
/// decimal multipliers (kilo, mega, milli, micro, …) applied to unit symbols.
///
/// This package encodes the SI decimal prefixes as a faithful data model:
/// each prefix carries its name, symbol, and power of ten. The full set,
/// including the 2022 CGPM additions (ronna, quetta, ronto, quecto), is
/// available as ``Prefix`` constants.
///
/// ## Usage
///
/// ```swift
/// import ISO_80000_1
///
/// let k = ISO_80000_1.Prefix.kilo
/// k.symbol        // "k"
/// k.exponent      // 3
/// k.factor        // 1000.0
///
/// ISO_80000_1.Prefix.all          // every prefix
/// ISO_80000_1.Prefix.multiples    // deca … quetta
/// ISO_80000_1.Prefix.submultiples // deci … quecto
/// ```
///
/// ## Reference
///
/// ISO 80000-1:2022 — Quantities and units — Part 1: General. The SI prefix
/// set follows the 9th edition of the SI Brochure (BIPM) as amended by
/// Resolution 3 of the 27th CGPM (2022).
public enum ISO_80000_1 {}
