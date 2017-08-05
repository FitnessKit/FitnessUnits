//
//  UnitCadence.swift
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
/// Cadence Unit
open class UnitCadence: Unit {

    private struct Symbol {
        static let beatsPerMinute       = "BPM"
        static let revolutionsPerMinute = "RPM"
        static let stepsPerMinute       = "steps/min"
        static let stridesPerMinute     = "strides/min"
        static let strokesPerMinute     = "strokes/min"
    }

    public class var beatsPerMinute: UnitCadence {
        get {
            return UnitCadence(symbol: Symbol.beatsPerMinute)
        }
    }

    public class var revolutionsPerMinute: UnitCadence {
        get {
            return UnitCadence(symbol: Symbol.revolutionsPerMinute)
        }
    }

    public class var stepsPerMinute: UnitCadence {
        get {
            return UnitCadence(symbol: Symbol.stepsPerMinute)
        }
    }

    public class var stridesPerMinute: UnitCadence {
        get {
            return UnitCadence(symbol: Symbol.stridesPerMinute)
        }
    }

    public class var strokesPerMinute: UnitCadence {
        get {
            return UnitCadence(symbol: Symbol.strokesPerMinute)
        }
    }

}
