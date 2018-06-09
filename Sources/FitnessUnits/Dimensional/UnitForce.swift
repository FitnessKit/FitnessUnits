//
//  UnitForce.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 9/1/17.
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

/// Units of Force
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class UnitForce: Dimension {

    private struct Symbol {
        static let dyne             = "dyn"
        static let newton           = "N"
        static let poundForce       = "lbf"
        static let kilogramForce    = "kgf"
    }

    private struct Coefficient {
        static let dyne             = 1e-05
        static let newton           = 1.0
        static let poundForce       = 4.44822
        static let kilogramForce    = 9.80665
    }

    private init(symbol: String, coefficient: Double) {
        super.init(symbol: symbol, converter: UnitConverterLinear(coefficient: coefficient))
    }

    /// Force in Newtons (N)
    open class var newton: UnitForce {
        get {
            return UnitForce(symbol: Symbol.newton, coefficient: Coefficient.newton)
        }
    }

    /// Force in Kilogram Force (kgf)
    open class var kilogramForce: UnitForce {
        get {
            return UnitForce(symbol: Symbol.kilogramForce, coefficient: Coefficient.kilogramForce)
        }
    }

    /// Force in Pound Force (lbf)
    open class var poundForce: UnitForce {
        get {
            return UnitForce(symbol: Symbol.poundForce, coefficient: Coefficient.poundForce)
        }
    }

    /// Force in Dyne (dyn)
    open class var dyne: UnitForce {
        get {
            return UnitForce(symbol: Symbol.dyne, coefficient: Coefficient.dyne)
        }
    }

    /// Base Unit for Force
    ///
    /// - Returns: The Force Base Unit
    open override class func baseUnit() -> UnitForce {
        return UnitForce.newton
    }

    public required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

    open override func encode(with aCoder: NSCoder) { super.encode(with: aCoder) }
}
