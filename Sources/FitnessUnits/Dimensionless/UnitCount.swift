//
//  UnitCount.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 12/1/19.
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

/// Counts Unit
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class UnitCount: Unit {

    private struct Symbol {
        static let counts   = "Counts"
        static let cycles   = "Cycles"
        static let dives    = "Dives"
        static let floors   = "Floors"
        static let goals    = "Goals"
        static let jumps    = "Jumps"
        static let laps     = "Laps"
        static let lengths  = "Lengths"
        static let punches  = "Punches"
        static let steps    = "Steps"
        static let strides  = "Strides"
        static let strikes  = "Strikes"
        static let strokes  = "Strokes"
    }

    /// Counts
    public class var counts: UnitCount {
        return UnitCount(symbol: Symbol.counts)
    }

    /// Cycles
    public class var cycles: UnitCount {
        return UnitCount(symbol: Symbol.cycles)
    }
    
    /// Dives
    public class var dives: UnitCount {
        return UnitCount(symbol: Symbol.dives)
    }

    /// Floors
    public class var floors: UnitCount {
        return UnitCount(symbol: Symbol.floors)
    }

    /// Goals
    public class var goals: UnitCount {
        return UnitCount(symbol: Symbol.goals)
    }

    /// Jumps
    public class var jumps: UnitCount {
        return UnitCount(symbol: Symbol.jumps)
    }

    /// Laps
    public class var laps: UnitCount {
        return UnitCount(symbol: Symbol.laps)
    }

    /// Lengths
    public class var lengths: UnitCount {
        return UnitCount(symbol: Symbol.lengths)
    }

    /// Punches
    public class var punches: UnitCount {
        return UnitCount(symbol: Symbol.punches)
    }

    /// Steps
    public class var steps: UnitCount {
        return UnitCount(symbol: Symbol.steps)
    }

    /// Strides
    public class var strides: UnitCount {
        return UnitCount(symbol: Symbol.strides)
    }

    /// Strikes
    public class var strikes: UnitCount {
        return UnitCount(symbol: Symbol.strikes)
    }

    /// Strokes
    public class var strokes: UnitCount {
        return UnitCount(symbol: Symbol.strokes)
    }

}
