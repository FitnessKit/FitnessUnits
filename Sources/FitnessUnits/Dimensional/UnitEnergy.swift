//
//  UnitEnergy.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 8/8/17.
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
public extension UnitEnergy {

    private struct Symbol {
        static let megajoule        = "MJ"
        static let wattHours        = "Wh"
        static let electronVolt     = "eV"
        static let btu              = "BTU"
        static let therm            = "thm"
    }

    private struct Coefficient {
        static let megajoule        = 1000000.0
        static let wattHours        = 3600.0
        static let electronVolt     = 1.6022e-19
        static let btu              = 1055.06
        static let therm            = 1.055e+8
    }

    private convenience init(symbol: String, coefficient: Double) {
        self.init(symbol: symbol, converter: UnitConverterLinear(coefficient: coefficient))
    }

    /// Energy in MegaJoule (MJ)
    public class var megajoule: UnitEnergy {
        get {
            return UnitEnergy(symbol: Symbol.megajoule, coefficient: Coefficient.megajoule)
        }
    }

    /// Energy in Watt Hours (Wh)
    public class var wattHours: UnitEnergy {
        get {
            return UnitEnergy(symbol: Symbol.wattHours, coefficient: Coefficient.wattHours)
        }
    }

    /// Energy in Electron Volts (ev)
    public class var electronVolt: UnitEnergy {
        get {
            return UnitEnergy(symbol: Symbol.electronVolt, coefficient: Coefficient.electronVolt)
        }
    }

    /// Energy in British Thermal Units (BTU)
    public class var btu: UnitEnergy {
        get {
            return UnitEnergy(symbol: Symbol.btu, coefficient: Coefficient.btu)
        }
    }

    /// Energy in Therms (thm)
    public class var therm: UnitEnergy {
        get {
            return UnitEnergy(symbol: Symbol.therm, coefficient: Coefficient.therm)
        }
    }

}

@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension UnitEnergy {

    /// Calculates the Energy Burned using stanard calculation from Heartrate, age, gender
    ///
    /// - Parameters:
    ///   - weight: Weight of Person
    ///   - gender: Gender - UnitGender.female or UnitGender.male
    ///   - heartRate: Heart Rate
    ///   - age: Age of Person in years
    /// - Returns: Energy Measurement
    public final class func energyBurned(weight: Measurement<UnitMass>, gender: UnitGender, heartRate: UInt8, ageInYears age: Int ) -> Measurement<UnitEnergy> {

        var kCals: Double = 0.0

        let weightKg = weight.converted(to: .kilograms).value

        if gender == UnitGender.female {
            kCals = ( -20.4022 + 0.4472 * Double(heartRate) - 0.1263 * weightKg + 0.074 * Double(age)) / 4.184 / 60
        } else {
            kCals = ( -55.0969 + 0.6309 * Double(heartRate) + 0.1988 * weightKg + 0.2017 * Double(age)) / 4.184 / 60
        }

        let value = Measurement(value: kCals, unit: UnitEnergy.kilocalories)
        return value
    }
    
    /// Calculates the Basal Metabolic Rate (BMR) using the Mifflin St. Jeor Equation
    ///
    /// - Parameters:
    ///   - height: Height
    ///   - weight: Weight
    ///   - gender: Gender - UnitGender.female or UnitGender.male
    ///   - age: Age in Years
    /// - Returns: The Basal metabolic rate (BMR)
    public final class func bmrUsingMifflin(height: Measurement<UnitLength>, weight: Measurement<UnitMass>, gender: UnitGender, ageInYears age: Int) -> Double {

        var bmr: Double = 0.0
        let weightKg = weight.converted(to: .kilograms).value
        let heightCm = height.converted(to: .centimeters).value

        bmr = 10 * weightKg + 6.25 * heightCm

        if gender == UnitGender.female {
            bmr =  bmr - 161
        } else {
            bmr =  bmr + 5
        }

        return bmr
    }
}
