//
//  UnitConcentrationMass.swift
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

@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension UnitConcentrationMass { /// Base unit - gramsPerLiter

    private struct Symbol {
        static let gramPerMilliliter        = "g/mL"
        static let kilogramPerMilliliter    = "kg/mL"
        static let milligramPerLiter        = "mg/L"
        static let kilogramPerLiter         = "kg/L"
    }

    private struct Coefficient {
        static let gramPerMilliliter        = 1000.0
        static let kilogramPerMilliliter    = 1000000.00
        static let milligramPerLiter        = 0.001
        static let kilogramPerLiter         = 1000.0
    }

    /// Concentraion of Mass in Grams Per Milliliter (g/mL)
    public class var gramsPerMilliliter: UnitConcentrationMass {
        get {
            return UnitConcentrationMass(symbol: Symbol.gramPerMilliliter, converter: UnitConverterLinear(coefficient: Coefficient.gramPerMilliliter))
        }
    }

    /// Concentraion of Mass in Kilograms Per Milliliter (kg/mL)
    public class var kilogramsPerMilliliter: UnitConcentrationMass {
        get {
            return UnitConcentrationMass(symbol: Symbol.kilogramPerMilliliter, converter: UnitConverterLinear(coefficient: Coefficient.kilogramPerMilliliter))
        }
    }

    /// Concentraion of Mass in Milligram Per Liter (mg/L)
    public class var milligramsPerLiter: UnitConcentrationMass {
        get {
            return UnitConcentrationMass(symbol: Symbol.milligramPerLiter, converter: UnitConverterLinear(coefficient: Coefficient.milligramPerLiter))
        }
    }

    /// Concentraion of Mass in Kilogram Per Liter (kg/L)
    public class var kilogramsPerLiter: UnitConcentrationMass {
        get {
            return UnitConcentrationMass(symbol: Symbol.kilogramPerLiter, converter: UnitConverterLinear(coefficient: Coefficient.kilogramPerLiter))
        }
    }

}
