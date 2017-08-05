//
//  UnitOxygenConsumption.swift
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
/// Osygen Consumption Unit
open class UnitOxygenConsumption: Unit {

    private struct Symbol {
        static let consumption      = "mL/(kg·min)"
        static let vo2              = "VO2"
    }

    /// Oxygen Consumption with symbol of mL/(kg·min)
    public class var consumption: UnitOxygenConsumption {
        get {
            return UnitOxygenConsumption(symbol: Symbol.consumption)
        }
    }

    /// Oxygen Consumption with symbol VO2
    public class var vo2: UnitOxygenConsumption {
        get {
            return UnitOxygenConsumption(symbol: Symbol.vo2)
        }
    }

}


@available(OSX 10.12, *)
public extension UnitOxygenConsumption {

    /// Creates an estimated VO2max Oxygen Consumption Unit using the Multi Stage Fitness Test Equation
    ///
    ///  This test is also know as the pacer test, or the beep test.
    ///
    /// - Parameter velocity: Velocity as a Measurement of UnitSpeed
    /// - Returns: Measurement of UnitOxygenConsumption
    public class func vo2UsingMultiStageFitnessTest(velocity: Measurement<UnitSpeed>) -> Measurement<UnitOxygenConsumption> {

        let speed = velocity.converted(to: .kilometersPerHour)

        let val1 = (speed.value * Double(6.65) - Double(35.8))
        let consumption = val1 * Double(0.95) + Double(0.182)

        let value = Measurement(value: consumption, unit: UnitOxygenConsumption.vo2)
        return value
    }


}
