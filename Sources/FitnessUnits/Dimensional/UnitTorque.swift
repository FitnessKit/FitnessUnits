//
//  UnitTorque.swift
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

/// Units of Torque
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public final class UnitTorque: Dimension {
    private struct Symbol {
        static let kilogramForceMeter   = "kgf·m"
        static let newtonMeter          = "N·m"
        static let footPoundForce       = "lbf·ft"
    }

    private struct Coefficient {
        static let kilogramForceMeter   = 0.101972
        static let newtonMeter          = 1.0
        static let footPoundForce       = 1.3558
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

    /// Torque in Newton Meter (N·m)
    public class var newtonMeter: UnitTorque {
        get {
            return UnitTorque(symbol: Symbol.newtonMeter, coefficient: Coefficient.newtonMeter)
        }
    }

    /// Torque in Foot Pound Force (lbf·ft)
    public class var footPoundForce: UnitTorque {
        get {
            return UnitTorque(symbol: Symbol.footPoundForce, coefficient: Coefficient.footPoundForce)
        }
    }

    /// Torque in Kilogram Force Meter (kgf·m)
    public class var kilogramForceMeter: UnitTorque {
        get {
            return UnitTorque(symbol: Symbol.kilogramForceMeter, coefficient: Coefficient.kilogramForceMeter)
        }
    }

    /// Base Unit for UnitTorque
    ///
    /// - Returns: Base Unit
    public override class func baseUnit() -> UnitTorque {
        return .newtonMeter
    }

    public required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

    /// Encodes the receiver using a given archiver
    ///
    /// - Parameter aCoder: An archiver object.
    public override func encode(with aCoder: NSCoder) { super.encode(with: aCoder) }
    
    public override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? UnitTorque else {
            return false
        }
        
        if self === other {
            return true
        }
        
        return super.isEqual(object)
    }
}
