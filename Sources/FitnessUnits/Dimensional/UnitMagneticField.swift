//
//  UnitMagneticField.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 4/23/17.
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

/// Units of Magnetic Field
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class UnitMagneticField: Dimension {

    private struct Symbol {
        static let nanoTesla    = "nT"
        static let milliGauss   = "mG"
        static let microTesla   = "µT"
        static let gauss        = "G"
        static let tesla        = "T"
    }

    private struct Coefficient {
        static let nanoTesla    = 0.000000001
        static let milliGauss   = 0.0000001
        static let microTesla   = 0.000001
        static let gauss        = 0.0001
        static let tesla        = 1.0
    }

    #if os(Linux)
    required public init(symbol: String) {
        super.init(symbol: symbol)
    }
    
    required public init(symbol: String, converter: UnitConverter) {
        super.init(symbol: symbol, converter: converter)
    }
    #endif

    private init(symbol: String, coefficient: Double) {
        super.init(symbol: symbol, converter: UnitConverterLinear(coefficient: coefficient))
    }

    /// Magnetic Field in Tesla (T)
    open class var tesla: UnitMagneticField {
        get {
            return UnitMagneticField(symbol: Symbol.tesla, coefficient: Coefficient.tesla)
        }
    }

    /// Magnetic Field in Mico Tesla (µT)
    open class var microTesla: UnitMagneticField {
        get {
            return UnitMagneticField(symbol: Symbol.microTesla, coefficient: Coefficient.microTesla)
        }
    }

    /// Magnetic Field in Nano Tesla (nT)
    open class var nanoTesla: UnitMagneticField {
        get {
            return UnitMagneticField(symbol: Symbol.nanoTesla, coefficient: Coefficient.nanoTesla)
        }
    }

    /// Magnetic Field in Gauss (G)
    open class var gauss: UnitMagneticField {
        get {
            return UnitMagneticField(symbol: Symbol.gauss, coefficient: Coefficient.gauss)
        }
    }

    /// Magnetic Field in Milli Gauss (mG)
    open class var milliGauss: UnitMagneticField {
        get {
            return UnitMagneticField(symbol: Symbol.milliGauss, coefficient: Coefficient.milliGauss)
        }
    }

    /// Base unit for MagneticField
    ///
    /// - Returns: Base Unit
    open override class func baseUnit() -> UnitMagneticField {
        return UnitMagneticField.tesla
    }

    public required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

    /// Encodes the receiver using a given archiver
    ///
    /// - Parameter aCoder: An archiver object.
    open override func encode(with aCoder: NSCoder) { super.encode(with: aCoder) }
}
