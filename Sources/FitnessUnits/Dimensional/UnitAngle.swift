//
//  UnitAngle.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 4/18/17.
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
public extension UnitAngle {

    private struct Symbol {
        static let bradian          = "bradian"
        static let milliradian      = "mrad"
        static let turn             = "turn"
        static let semicircle       = "semi circle"
        static let angularMilNato   = "mil"
    }

    private struct Coefficient {
        static let bradian              = 1.40625
        static let milliradian          = 0.057296
        static let turn                 = 360.0
        static let semicircle           = 1 / 0.0055556
        static let garminSemicircle     = 0.00000008381903171539306640625
        static let angularMilNato       = 1 / 17.778
    }

    /// Bradian Unit of Angle
    public class var bradian: UnitAngle {
        get {
            return UnitAngle(symbol: Symbol.bradian,
                             converter: UnitConverterLinear(coefficient: Coefficient.bradian))
        }
    }

    /// Milliradian Unit of Angle
    public class var milliradian: UnitAngle {
        return UnitAngle(symbol: Symbol.milliradian,
                         converter: UnitConverterLinear(coefficient: Coefficient.milliradian))
    }

    /// Turn Unit of Angle
    ///
    /// This is the same as a `UnitAngle.revolutions`
    public class var turn: UnitAngle {
        return UnitAngle(symbol: Symbol.turn,
                         converter: UnitConverterLinear(coefficient: Coefficient.turn))
    }

    /// Semicircle Unit of Angle
    public class var semicircle: UnitAngle {
        return UnitAngle(symbol: Symbol.semicircle,
                         converter: UnitConverterLinear(coefficient: Coefficient.semicircle))
    }

    /// NATO Angular Mil Unit of Angle
    public class var natoAngularMil: UnitAngle {
        return UnitAngle(symbol: Symbol.angularMilNato,
                         converter: UnitConverterLinear(coefficient: Coefficient.angularMilNato))
    }



}
