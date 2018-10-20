//
//  Color.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 4/14/18.
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

public protocol ColorType: Encodable {}

/// Color Type of HexString Color
public struct HexColor: ColorType {

    /// Hex Representation of the Color
    public let hex: String

    /// Amount of Alpha
    ///
    /// 0.0 to 1.0
    public let alpha: Float

    public init(hex: String, a: Float) {
        var string = ""
        if hex.lowercased().hasPrefix("0x") {
            string =  hex.replacingOccurrences(of: "0x", with: "")
        } else if hex.hasPrefix("#") {
            string = hex.replacingOccurrences(of: "#", with: "")
        } else {
            string = hex
        }

        if string.count == 3 { // convert hex to 6 digit format if in short format
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }
        self.hex = string

        var aVal = a
        if aVal < 0.0 { aVal = 0.0 }
        if aVal > 1.0 { aVal = 1.0 }

        self.alpha = aVal
    }
}

@available(swift 4.0)
extension HexColor {

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
        enum CodingKeys : Int, CodingKey {
            case color
        }

        enum ColorKeys : Int, CodingKey {
            case alpha
            case hex
        }

        var container = encoder.container(keyedBy: CodingKeys.self)

        var colorContainer = container.nestedContainer(keyedBy: ColorKeys.self, forKey: .color)
        try colorContainer.encode(hex, forKey: .hex)
        try colorContainer.encode(alpha, forKey: .alpha)
    }
}

/// Color Type of RGB Color
public struct RGBColor: ColorType {

    /// Red
    public let red: Float

    /// Green
    public let green: Float

    /// Blue
    public let blue: Float

    /// Amount of Alpha
    ///
    /// 0.0 to 1.0
    public let alpha: Float

    public init(r: Float, g: Float, b: Float, a: Float) {
        red = r
        green = g
        blue = b

        var aVal = a
        if aVal < 0.0 { aVal = 0.0 }
        if aVal > 1.0 { aVal = 1.0 }

        alpha = aVal
    }
}

@available(swift 4.0)
extension RGBColor: Encodable {

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
        enum CodingKeys : Int, CodingKey {
            case color
        }

        enum ColorKeys : Int, CodingKey {
            case red
            case green
            case blue
            case alpha
        }

        var container = encoder.container(keyedBy: CodingKeys.self)

        var colorContainer = container.nestedContainer(keyedBy: ColorKeys.self, forKey: .color)
        try colorContainer.encode(alpha, forKey: .alpha)
        try colorContainer.encode(red, forKey: .red)
        try colorContainer.encode(green, forKey: .green)
        try colorContainer.encode(blue, forKey: .blue)
    }
}
