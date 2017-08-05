//
//  UnitAngularVelocity.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 4/1/17.
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
/// Angular Velocity Unit
open class UnitAngularVelocity: Dimension {

    private struct Symbol {
        static let degress      = "deg/s"
        static let radians      = "rad/s"
    }

    private struct Coefficient {
        static let degress          = 1.0
        static let radians          = 57.2958
    }


    private init(symbol: String, coefficient: Double) {
        super.init(symbol: symbol, converter: UnitConverterLinear(coefficient: coefficient))
    }

    open class var degressPerSecond: UnitAngularVelocity {
        get {
            return UnitAngularVelocity(symbol: Symbol.degress, coefficient: Coefficient.degress)
        }
    }

    open class var radiansPerSecond: UnitAngularVelocity {
        get {
            return UnitAngularVelocity(symbol: Symbol.radians, coefficient: Coefficient.radians)
        }
    }

    open override class func baseUnit() -> UnitAngularVelocity {
        return UnitAngularVelocity.degressPerSecond
    }

    public required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    open override func encode(with aCoder: NSCoder) { super.encode(with: aCoder) }
    
}
