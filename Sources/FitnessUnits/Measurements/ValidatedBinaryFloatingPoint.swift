//
//  ValidatedBinaryFloatingPoint.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 4/28/18.
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

/// A `ValidatedBinaryFloatingPoint` is a model type that holds a `Numeric` value that has an associated `valid` flag.
///
/// `ValidatedBinaryFloatingPoint` provides feedback on validity of value
@available(swift 3.1)
public struct ValidatedBinaryFloatingPoint<Element> where Element: BinaryFloatingPoint {

    /// The value component of the `ValidatedBinaryFloatingPoint`.
    public var value: Element

    /// The validity of the `ValidatedBinaryFloatingPoint`.
    public var valid: Bool

    /// Create a `ValidatedBinaryFloatingPoint` given a specified value and unit.
    public init(value: Element, valid: Bool) {
        self.value = value
        self.valid = valid
    }
}

@available(swift 3.1)
extension ValidatedBinaryFloatingPoint: CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
    public var description: String {
        return "\(value) \(type(of: value))"
    }

    public var debugDescription: String {
        return "\(value) \(type(of: value)) valid: \(valid)"
    }

    public var customMirror: Mirror {
        var c: [(label: String?, value: Any)] = []
        c.append((label: "value", value: value))
        c.append((label: "valid", value: valid))
        return Mirror(self, children: c, displayStyle: Mirror.DisplayStyle.struct)
    }
}

@available(swift 4.0)
extension ValidatedBinaryFloatingPoint: Codable {
    private enum CodingKeys: Int, CodingKey {
        case value
        case valid
        case unit
    }

    private enum UnitCodingKeys: Int, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let valid = try container.decode(Bool.self, forKey: .valid)

        let unitContainer = try container.nestedContainer(keyedBy: UnitCodingKeys.self, forKey: .unit)
        let unitType = try unitContainer.decode(String.self, forKey: .type).lowercased()

        switch unitType {
        case "Float".lowercased():
            let value = try container.decode(Float.self, forKey: .value)
            self.init(value: Element(value), valid: valid)

        case "Float32".lowercased():
            let value = try container.decode(Float.self, forKey: .value)
            self.init(value: Element(value), valid: valid)

        case "Float64".lowercased():
            let value = try container.decode(Float64.self, forKey: .value)
            self.init(value: Element(value), valid: valid)

        case "Double".lowercased():
            let value = try container.decode(Double.self, forKey: .value)
            self.init(value: Element(value), valid: valid)


        default:
            fatalError("Attempt to decode none BinaryFloatingPoint")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        var typeString: String = "NaN"

        switch self.value {
        case is Double:
            try container.encode(self.value as! Double, forKey: .value)
            typeString = "Double"

        case is Float:
            /// as well as Float32
            try container.encode(self.value as! Float, forKey: .value)
            typeString = "Float"

        case is Float64:
            try container.encode(self.value as! Float64, forKey: .value)
            typeString = "Float64"

        default:
            fatalError("Attempt to encode none BinaryFloatingPoint")
        }
        try container.encode(self.valid, forKey: .valid)

        var unitContainer = container.nestedContainer(keyedBy: UnitCodingKeys.self, forKey: .unit)
        try unitContainer.encode(typeString, forKey: .type)
    }
}
