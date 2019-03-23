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

/// Units of Angular Velocity
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class UnitAngularVelocity: Dimension {

    private struct Symbol {
        static let degress      = "deg/s"
        static let radians      = "rad/s"
    }

    private struct Coefficient {
        static let degress      = 1.0
        static let radians      = 57.2958
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

    /// Angular Velocity in Degrees per Second (deg/s)
    open class var degreesPerSecond: UnitAngularVelocity {
        get {
            return UnitAngularVelocity(symbol: Symbol.degress, coefficient: Coefficient.degress)
        }
    }

    /// Angular Velocity in Radians per Second (rad/s)
    open class var radiansPerSecond: UnitAngularVelocity {
        get {
            return UnitAngularVelocity(symbol: Symbol.radians, coefficient: Coefficient.radians)
        }
    }

    /// Base unit for UnitAngularVelocity
    ///
    /// - Returns: Base Unit
    open override class func baseUnit() -> UnitAngularVelocity {
        return UnitAngularVelocity.degreesPerSecond
    }

    public required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

    /// Encodes the receiver using a given archiver
    ///
    /// - Parameter aCoder: An archiver object.
    open override func encode(with aCoder: NSCoder) { super.encode(with: aCoder) }
}
