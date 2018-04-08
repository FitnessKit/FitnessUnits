//
//  StringMeasurement.swift
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

/// A `StringMeasurement` is a model type that holds a `String` value associated with a `Unit`.
///
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public struct StringMeasurement<UnitType: Unit>: Equatable {

    /// The unit component of the `StringMeasurement`.
    private(set) public var unit: UnitType

    /// The value component of the `StringMeasurement`.
    public var value: String

    /// Create a `StringMeasurement` given a specified value and unit.
    public init(value: String, unit: UnitType) {
        self.value = value
        self.unit = unit
    }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Int {
        return value.hashValue
    }
}

extension StringMeasurement : CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
    public var description: String {
        return "\(value) \(unit.symbol)"
    }

    public var debugDescription: String {
        return "\(value) \(unit.symbol)"
    }

    public var customMirror: Mirror {
        var c: [(label: String?, value: Any)] = []
        c.append((label: "value", value: value))
        c.append((label: "unit", value: unit.symbol))
        return Mirror(self, children: c, displayStyle: Mirror.DisplayStyle.struct)
    }
}

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
extension StringMeasurement {

    /// Compare two measurements of the same `Dimension`.
    ///
    /// If `lhs.unit == rhs.unit`, returns `lhs.value == rhs.value`. Otherwise, converts `rhs` to the same unit as `lhs` and then compares the resulting values.
    /// - returns: `true` if the measurements are equal.
    public static func ==<LeftHandSideType, RightHandSideType>(_ lhs: StringMeasurement<LeftHandSideType>, _ rhs: StringMeasurement<RightHandSideType>) -> Bool {
        if lhs.unit == rhs.unit {
            return lhs.value == rhs.value
        } else {
            return false
        }
    }
}

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
extension StringMeasurement: Encodable {
    private enum CodingKeys : Int, CodingKey {
        case value
        case unit
    }

    private enum UnitCodingKeys : Int, CodingKey {
        case symbol
        case converter
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let value = try container.decode(String.self, forKey: .value)

        let unitContainer = try container.nestedContainer(keyedBy: UnitCodingKeys.self, forKey: .unit)
        let symbol = try unitContainer.decode(String.self, forKey: .symbol)

        let unit: UnitType
        unit = UnitType(symbol: symbol)

        self.init(value: value, unit: unit)
    }


    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.value, forKey: .value)

        var unitContainer = container.nestedContainer(keyedBy: UnitCodingKeys.self, forKey: .unit)
        try unitContainer.encode(self.unit.symbol, forKey: .symbol)
    }

}
