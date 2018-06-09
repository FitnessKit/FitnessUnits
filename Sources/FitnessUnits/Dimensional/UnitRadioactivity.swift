//
//  UnitRadioactivity.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 4/15/18.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// Units of Radioactivity
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class UnitRadioactivity: Dimension {

    private struct Symbol {
        static let disintegrationsPerMinute     = "dpm"
        static let becquerel                    = "Bq"
        static let kilobecquerel                = "kBq"
        static let megabecquerel                = "MBq"
        static let microcurie                   = "µCi"
        static let millicurie                   = "mCi"
        static let curie                        = "Ci"
        static let rutherford                   = "rd"
    }

    private struct Coefficient {
        static let disintegrationsPerMinute = 0.01667
        static let becquerel                = 1.0
        static let kilobecquerel            = 1000.0
        static let megabecquerel            = 1000000.0
        static let microcurie               = 37000.0
        static let millicurie               = 37000000.0
        static let curie                    = 37000000037.0
        static let rutherford               = 1000000.0
    }

    private init(symbol: String, coefficient: Double) {
        super.init(symbol: symbol, converter: UnitConverterLinear(coefficient: coefficient))
    }

    /// Radioactivity in Disintegrations Per Minute (dpm)
    open class var disintegrationsPerMinute: UnitRadioactivity {
        get {
            return UnitRadioactivity(symbol: Symbol.disintegrationsPerMinute, coefficient: Coefficient.disintegrationsPerMinute)
        }
    }

    /// Radioactivity in Becquerel (Bq)
    open class var becquerel: UnitRadioactivity {
        get {
            return UnitRadioactivity(symbol: Symbol.becquerel, coefficient: Coefficient.becquerel)
        }
    }

    /// Radioactivity in Kilo Becquerel (kBq)
    open class var kilobecquerel: UnitRadioactivity {
        get {
            return UnitRadioactivity(symbol: Symbol.kilobecquerel, coefficient: Coefficient.kilobecquerel)
        }
    }

    /// Radioactivity in Mega Becquerel (MBq)
    open class var megabecquerel: UnitRadioactivity {
        get {
            return UnitRadioactivity(symbol: Symbol.megabecquerel, coefficient: Coefficient.megabecquerel)
        }
    }

    /// Radioactivity in Micro Curie (µCi)
    open class var microcurie: UnitRadioactivity {
        get {
            return UnitRadioactivity(symbol: Symbol.microcurie, coefficient: Coefficient.microcurie)
        }
    }

    /// Radioactivity in Milli Curie (mCi)
    open class var millicurie: UnitRadioactivity {
        get {
            return UnitRadioactivity(symbol: Symbol.millicurie, coefficient: Coefficient.millicurie)
        }
    }

    /// Radioactivity in Milli Curie (mCi)
    open class var curie: UnitRadioactivity {
        get {
            return UnitRadioactivity(symbol: Symbol.curie, coefficient: Coefficient.curie)
        }
    }

    /// Radioactivity in Rutherford (rd)
    open class var rutherford: UnitRadioactivity {
        get {
            return UnitRadioactivity(symbol: Symbol.rutherford, coefficient: Coefficient.rutherford)
        }
    }



    /// Base Unit for UnitRadioactivity
    ///
    /// - Returns: Base Unit
    open override class func baseUnit() -> UnitRadioactivity {
        return UnitRadioactivity.becquerel
    }

    public required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

    open override func encode(with aCoder: NSCoder) { super.encode(with: aCoder) }

}
