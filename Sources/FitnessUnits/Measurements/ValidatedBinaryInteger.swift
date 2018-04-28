//
//  ValidatedBinaryInteger.swift
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

/// A `ValidatedBinaryInteger` is a model type that holds a `Numeric` value that has an associated `valid` flag.
///
/// `ValidatedBinaryInteger` provides feedback on validity of value
@available(swift 3.1)
public struct ValidatedBinaryInteger<BinaryIntegerType: BinaryInteger> {

    /// The value component of the `ValidatedBinaryInteger`.
    public var value: BinaryIntegerType

    /// The validity of the `ValidatedBinaryInteger`.
    public var valid: Bool

    /// Create a `ValidatedBinaryInteger` given a specified value and unit.
        public init(value: BinaryIntegerType, valid: Bool) {
        self.value = value
        self.valid = valid
    }

    private init(value: UInt8, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }

    private init(value: UInt16, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }

    private init(value: UInt32, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }

    private init(value: UInt64, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }

    private init(value: UInt, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }

    private init(value: Int8, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }

    private init(value: Int16, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }

    private init(value: Int32, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }

    private init(value: Int64, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }

    private init(value: Int, valid: Bool) {
        self.value = BinaryIntegerType(value)
        self.valid = valid
    }
}

@available(swift 3.1)
extension ValidatedBinaryInteger: CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
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
extension ValidatedBinaryInteger: Codable {
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
        case "UInt8".lowercased():
            let value = try container.decode(UInt8.self, forKey: .value)
            self.init(value: value, valid: valid)

        case "UInt16".lowercased():
            let value = try container.decode(UInt16.self, forKey: .value)
            self.init(value: value, valid: valid)

        case "UInt32".lowercased():
            let value = try container.decode(UInt32.self, forKey: .value)
            self.init(value: value, valid: valid)

        case "UInt64".lowercased():
            let value = try container.decode(UInt64.self, forKey: .value)
            self.init(value: value, valid: valid)

        case "UInt".lowercased():
            let value = try container.decode(UInt64.self, forKey: .value)
            self.init(value: value, valid: valid)

        case "Int8".lowercased():
            let value = try container.decode(Int8.self, forKey: .value)
            self.init(value: value, valid: valid)

        case "Int16".lowercased():
            let value = try container.decode(Int16.self, forKey: .value)
            self.init(value: value, valid: valid)

        case "Int32".lowercased():
            let value = try container.decode(Int32.self, forKey: .value)
            self.init(value: value, valid: valid)

        case "Int64".lowercased():
            let value = try container.decode(Int64.self, forKey: .value)
            self.init(value: value, valid: valid)

        case "Int".lowercased():
            let value = try container.decode(Int64.self, forKey: .value)
            self.init(value: value, valid: valid)

        default:
            fatalError("Attempt to decode none BinaryInteger")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        var typeString: String = "NaN"

        switch self.value {
        case is UInt8:
            try container.encode(UInt8(self.value), forKey: .value)
            typeString = "UInt8"

        case is UInt16:
            try container.encode(UInt16(self.value), forKey: .value)
            typeString = "UInt16"

        case is UInt32:
            try container.encode(UInt32(self.value), forKey: .value)
            typeString = "UInt32"

        case is UInt64:
            try container.encode(UInt64(self.value), forKey: .value)
            typeString = "UInt64"

        case is UInt:
            try container.encode(UInt64(self.value), forKey: .value)
            typeString = "UInt"

        case is Int8:
            try container.encode(Int8(self.value), forKey: .value)
            typeString = "Int8"

        case is Int16:
            try container.encode(Int16(self.value), forKey: .value)
            typeString = "Int16"

        case is Int32:
            try container.encode(Int32(self.value), forKey: .value)
            typeString = "Int32"

        case is Int64:
            try container.encode(Int64(self.value), forKey: .value)
            typeString = "Int64"

        case is Int:
            try container.encode(UInt64(self.value), forKey: .value)
            typeString = "Int"

        default:
            fatalError("Attempt to encode none BinaryInteger")
        }
        try container.encode(self.valid, forKey: .valid)

        var unitContainer = container.nestedContainer(keyedBy: UnitCodingKeys.self, forKey: .unit)
        try unitContainer.encode(typeString, forKey: .type)
    }
}
