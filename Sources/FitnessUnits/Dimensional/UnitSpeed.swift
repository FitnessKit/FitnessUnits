//
//  UnitSpeed.swift
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

@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension UnitSpeed {

    private struct Symbol {
        static let meterPerHour     = "m/h"
        static let meterPerMinute   = "m/m"
        static let kms              = "km/s"
        static let kpm              = "km/m"
        static let mpm              = "mpm" //Miles Per Minute
        static let mps              = "mps" //Miles Per Second
        static let speedOfLight     = "c"
    }

    private struct Coefficient {
        static let meterPerHour     = 0.0002778
        static let meterPerMinute   = 0.01667
        static let kms              = 1000.0
        static let kpm              = 16.666667
        static let mpm              = 26.82
        static let mps              = 1609.0
        static let speedOfLight     = 299792454.00
    }

    /// Speed in Meters Per Hour (m/h)
    public class var metersPerHour: UnitSpeed {
        get {
            return UnitSpeed(symbol: Symbol.meterPerHour, converter: UnitConverterLinear(coefficient: Coefficient.meterPerHour))
        }
    }

    /// Speed in Meters Per Minute (m/m)
    public class var metersPerMinute: UnitSpeed {
        get {
            return UnitSpeed(symbol: Symbol.meterPerMinute, converter: UnitConverterLinear(coefficient: Coefficient.meterPerMinute))
        }
    }

    /// Speed in Kilometers Per Second (km/s)
    public class var kilometersPerSecond: UnitSpeed {
        get {
            return UnitSpeed(symbol: Symbol.kms, converter: UnitConverterLinear(coefficient: Coefficient.kms))
        }
    }

    /// Speed in Kilometers Per Minute (km/m)
    public class var kilometersPerMinute: UnitSpeed {
        get {
            return UnitSpeed(symbol: Symbol.kpm, converter: UnitConverterLinear(coefficient: Coefficient.kpm))
        }
    }

    /// Speed in Miles Per Minute (mpm)
    public class var milesPerMinute: UnitSpeed {
        get {
            return UnitSpeed(symbol: Symbol.mpm, converter: UnitConverterLinear(coefficient: Coefficient.mpm))
        }
    }

    /// Speed in Miles Per Second (mps)
    public class var milesPerSecond: UnitSpeed {
        get {
            return UnitSpeed(symbol: Symbol.mps, converter: UnitConverterLinear(coefficient: Coefficient.mps))
        }
    }

    /// Speed in Speed of Light (c)
    public class var speedOfLight: UnitSpeed {
        get {
            return UnitSpeed(symbol: Symbol.speedOfLight, converter: UnitConverterLinear(coefficient: Coefficient.speedOfLight))
        }
    }

}
