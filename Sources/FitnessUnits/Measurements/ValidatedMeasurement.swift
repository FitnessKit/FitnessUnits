//
//  ValidatedMeasurement.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 4/8/18.
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

/// A `ValidatedMeasurement` is a model type that holds a `Double` value associated with a `Unit`.
///
/// `ValidatedMeasurement` act the same way `Measurement` does, but provides feedback on validity of data
///
/// ValidatedMeasurements support a large set of operators, including `+`, `-`, `*`, `/`, and a full set of comparison operators.
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public struct ValidatedMeasurement<UnitType: Unit>: Comparable, Equatable {

    /// The unit component of the `ValidatedMeasurement`.
    public let unit: UnitType

    /// The value component of the `ValidatedMeasurement`.
    public var value: Double

    /// The validity of the `ValidatedMeasurement`.
    public var valid: Bool

    /// Create a `ValidatedMeasurement` given a specified value and unit.
    public init(value: Double, valid: Bool, unit: UnitType) {
        self.value = value
        self.valid = valid
        self.unit = unit
    }

    public var hashValue: Int {
        return value.hashValue
    }
}

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
extension ValidatedMeasurement: CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
    public var description: String {
        return "\(value) \(unit.symbol)"
    }

    public var debugDescription: String {
        return "\(value) \(unit.symbol) valid: \(valid)"
    }

    public var customMirror: Mirror {
        var c: [(label: String?, value: Any)] = []
        c.append((label: "value", value: value))
        c.append((label: "unit", value: unit.symbol))
        c.append((label: "valid", value: valid))
        return Mirror(self, children: c, displayStyle: Mirror.DisplayStyle.struct)
    }
}


/// When a `ValidatedMeasurement` contains a `Dimension` unit, it gains the ability to convert between the kinds of units in that dimension.
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
extension ValidatedMeasurement where UnitType : Dimension {
    /// Returns a new measurement created by converting to the specified unit.
    ///
    /// - parameter otherUnit: A unit of the same `Dimension`.
    /// - returns: A converted measurement.
    public func converted(to otherUnit: UnitType) -> ValidatedMeasurement<UnitType> {
        if unit.isEqual(otherUnit) {
            return ValidatedMeasurement(value: value, valid: valid, unit: otherUnit)
        } else {
            let valueInTermsOfBase = unit.converter.baseUnitValue(fromValue: value)
            if otherUnit.isEqual(type(of: unit).baseUnit()) {
                return ValidatedMeasurement(value: valueInTermsOfBase, valid: valid, unit: otherUnit)
            } else {
                let otherValueFromTermsOfBase = otherUnit.converter.value(fromBaseUnitValue: valueInTermsOfBase)
                return ValidatedMeasurement(value: otherValueFromTermsOfBase, valid: valid, unit: otherUnit)
            }
        }
    }

    /// Converts the measurement to the specified unit.
    ///
    /// - parameter otherUnit: A unit of the same `Dimension`.
    public mutating func convert(to otherUnit: UnitType) {
        self = converted(to: otherUnit)
    }

    /// Add two measurements of the same Dimension.
    ///
    /// If the `unit` of the `lhs` and `rhs` are `isEqual`, then this returns the result of adding the `value` of each `ValidatedMeasurement`. If they are not equal, then this will convert both to the base unit of the `Dimension` and return the result as a `ValidatedMeasurement` of that base unit.
    /// - returns: The result of adding the two measurements.
    public static func +(lhs: ValidatedMeasurement<UnitType>, rhs: ValidatedMeasurement<UnitType>) -> ValidatedMeasurement<UnitType> {
        if lhs.unit.isEqual(rhs.unit) && lhs.valid == rhs.valid {
            return ValidatedMeasurement(value: lhs.value + rhs.value, valid: lhs.valid, unit: lhs.unit)
        } else {
            let lhsValueInTermsOfBase = lhs.unit.converter.baseUnitValue(fromValue: lhs.value)
            let rhsValueInTermsOfBase = rhs.unit.converter.baseUnitValue(fromValue: rhs.value)
            return ValidatedMeasurement(value: lhsValueInTermsOfBase + rhsValueInTermsOfBase, valid: lhs.valid, unit: type(of: lhs.unit).baseUnit())
        }
    }

    /// Subtract two measurements of the same Dimension.
    ///
    /// If the `unit` of the `lhs` and `rhs` are `==`, then this returns the result of subtracting the `value` of each `ValidatedMeasurement`. If they are not equal, then this will convert both to the base unit of the `Dimension` and return the result as a `ValidatedMeasurement` of that base unit.
    /// - returns: The result of adding the two measurements.
    public static func -(lhs: ValidatedMeasurement<UnitType>, rhs: ValidatedMeasurement<UnitType>) -> ValidatedMeasurement<UnitType> {
        if lhs.unit == rhs.unit && lhs.valid == rhs.valid {
            return ValidatedMeasurement(value: lhs.value - rhs.value, valid: lhs.valid, unit: lhs.unit)
        } else {
            let lhsValueInTermsOfBase = lhs.unit.converter.baseUnitValue(fromValue: lhs.value)
            let rhsValueInTermsOfBase = rhs.unit.converter.baseUnitValue(fromValue: rhs.value)
            return ValidatedMeasurement(value: lhsValueInTermsOfBase - rhsValueInTermsOfBase, valid: lhs.valid, unit: type(of: lhs.unit).baseUnit())
        }
    }
}

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
extension ValidatedMeasurement {
    /// Add two measurements of the same Unit.
    /// - precondition: The `unit` of `lhs` and `rhs` must be `isEqual` and `valid` must be equal.
    /// - returns: A measurement of value `lhs.value + rhs.value` and unit `lhs.unit`.
    public static func +(lhs: ValidatedMeasurement<UnitType>, rhs: ValidatedMeasurement<UnitType>) -> ValidatedMeasurement<UnitType> {

        if lhs.unit.isEqual(rhs.unit) && lhs.valid == rhs.valid  {
            return ValidatedMeasurement(value: lhs.value + rhs.value, valid: lhs.valid, unit: lhs.unit)
        } else {
            fatalError("Attempt to add measurements with non-equal units")
        }
    }

    /// Subtract two measurements of the same Unit.
    /// - precondition: The `unit` of `lhs` and `rhs` must be `isEqual` and `valid` must be equal.
    /// - returns: A measurement of value `lhs.value - rhs.value` and unit `lhs.unit`.
    public static func -(lhs: ValidatedMeasurement<UnitType>, rhs: ValidatedMeasurement<UnitType>) -> ValidatedMeasurement<UnitType> {
        if lhs.unit.isEqual(rhs.unit) {
            return ValidatedMeasurement(value: lhs.value - rhs.value, valid: lhs.valid, unit: lhs.unit)
        } else {
            fatalError("Attempt to subtract measurements with non-equal units")
        }
    }

    /// Multiply a measurement by a scalar value.
    /// - returns: A measurement of value `lhs.value * rhs` with the same unit as `lhs`.
    public static func *(lhs: ValidatedMeasurement<UnitType>, rhs: Double) -> ValidatedMeasurement<UnitType> {
        return ValidatedMeasurement(value: lhs.value * rhs, valid: lhs.valid, unit: lhs.unit)
    }

    /// Multiply a scalar value by a measurement.
    /// - returns: A measurement of value `lhs * rhs.value` with the same unit as `rhs`.
    public static func *(lhs: Double, rhs: ValidatedMeasurement<UnitType>) -> ValidatedMeasurement<UnitType> {
        return ValidatedMeasurement(value: lhs * rhs.value, valid: rhs.valid, unit: rhs.unit)
    }

    /// Divide a measurement by a scalar value.
    /// - returns: A measurement of value `lhs.value / rhs` with the same unit as `lhs`.
    public static func /(lhs: ValidatedMeasurement<UnitType>, rhs: Double) -> ValidatedMeasurement<UnitType> {
        return ValidatedMeasurement(value: lhs.value / rhs, valid: lhs.valid, unit: lhs.unit)
    }

    /// Divide a scalar value by a measurement.
    /// - returns: A measurement of value `lhs / rhs.value` with the same unit as `rhs`.
    public static func /(lhs: Double, rhs: ValidatedMeasurement<UnitType>) -> ValidatedMeasurement<UnitType> {
        return ValidatedMeasurement(value: lhs / rhs.value, valid: rhs.valid, unit: rhs.unit)
    }

    /// Compare two measurements of the same `Dimension`.
    ///
    /// If `lhs.unit == rhs.unit`, returns `lhs.value == rhs.value`. Otherwise, converts `rhs` to the same unit as `lhs` and then compares the resulting values.
    /// - returns: `true` if the measurements are equal.
    public static func ==<LeftHandSideType, RightHandSideType>(_ lhs: ValidatedMeasurement<LeftHandSideType>, _ rhs: ValidatedMeasurement<RightHandSideType>) -> Bool {
        if lhs.unit == rhs.unit {
            return lhs.value == rhs.value && lhs.valid == rhs.valid
        } else {
            if let lhsDimensionalUnit = lhs.unit as? Dimension,
                let rhsDimensionalUnit = rhs.unit as? Dimension {
                if type(of: lhsDimensionalUnit).baseUnit() == type(of: rhsDimensionalUnit).baseUnit() {
                    let lhsValueInTermsOfBase = lhsDimensionalUnit.converter.baseUnitValue(fromValue: lhs.value)
                    let rhsValueInTermsOfBase = rhsDimensionalUnit.converter.baseUnitValue(fromValue: rhs.value)
                    return lhsValueInTermsOfBase == rhsValueInTermsOfBase && lhs.valid == rhs.valid
                }
            }
            return false
        }
    }

    /// Compare two measurements of the same `Unit`.
    /// - returns: `true` if the measurements can be compared and the `lhs` is less than the `rhs` converted value.
    public static func <<LeftHandSideType, RightHandSideType>(lhs: ValidatedMeasurement<LeftHandSideType>, rhs: ValidatedMeasurement<RightHandSideType>) -> Bool {
        if lhs.unit == rhs.unit {
            return lhs.value < rhs.value
        } else {
            if let lhsDimensionalUnit = lhs.unit as? Dimension,
                let rhsDimensionalUnit = rhs.unit as? Dimension {
                if type(of: lhsDimensionalUnit).baseUnit() == type(of: rhsDimensionalUnit).baseUnit() {
                    let lhsValueInTermsOfBase = lhsDimensionalUnit.converter.baseUnitValue(fromValue: lhs.value)
                    let rhsValueInTermsOfBase = rhsDimensionalUnit.converter.baseUnitValue(fromValue: rhs.value)
                    return lhsValueInTermsOfBase < rhsValueInTermsOfBase
                }
            }
            fatalError("Attempt to compare measurements with non-equal dimensions")
        }
    }
}

@available(swift 4.0)
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
extension ValidatedMeasurement : Codable {
    private enum CodingKeys: Int, CodingKey {
        case value
        case valid
        case unit
    }

    private enum UnitCodingKeys: Int, CodingKey {
        case symbol
        case converter
    }

    private enum LinearConverterCodingKeys: Int, CodingKey {
        case coefficient
        case constant
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let value = try container.decode(Double.self, forKey: .value)
        let valid = try container.decode(Bool.self, forKey: .valid)

        let unitContainer = try container.nestedContainer(keyedBy: UnitCodingKeys.self, forKey: .unit)
        let symbol = try unitContainer.decode(String.self, forKey: .symbol)

        let unit: UnitType
        if UnitType.self is Dimension.Type {
            let converterContainer = try unitContainer.nestedContainer(keyedBy: LinearConverterCodingKeys.self, forKey: .converter)
            let coefficient = try converterContainer.decode(Double.self, forKey: .coefficient)
            let constant = try converterContainer.decode(Double.self, forKey: .constant)
            let unitMetaType = (UnitType.self as! Dimension.Type)
            unit = (unitMetaType.init(symbol: symbol, converter: UnitConverterLinear(coefficient: coefficient, constant: constant)) as! UnitType)
        } else {
            unit = UnitType(symbol: symbol)
        }

        self.init(value: value, valid: valid, unit: unit)
    }

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.value, forKey: .value)
        try container.encode(self.valid, forKey: .valid)

        var unitContainer = container.nestedContainer(keyedBy: UnitCodingKeys.self, forKey: .unit)
        try unitContainer.encode(self.unit.symbol, forKey: .symbol)

        if UnitType.self is Dimension.Type {
            guard type(of: (self.unit as! Dimension).converter) is UnitConverterLinear.Type else {
                preconditionFailure("Cannot encode a Measurement whose UnitType has a non-linear unit converter.")
            }

            let converter = (self.unit as! Dimension).converter as! UnitConverterLinear
            var converterContainer = unitContainer.nestedContainer(keyedBy: LinearConverterCodingKeys.self, forKey: .converter)
            try converterContainer.encode(converter.coefficient, forKey: .coefficient)
            try converterContainer.encode(converter.constant, forKey: .constant)
        }
    }
}
