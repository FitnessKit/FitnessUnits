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


/// Color
public struct Color {

    /// Red
    public let red: Float

    /// Green
    public let green: Float

    /// Blue
    public let blue: Float

    /// Alpha
    ///
    /// 0.0 to 1.0
    public let alpha: Float

    /// Hex Representation of Color
    public let hex: String?

    public init(r: Float, g: Float, b: Float, a: Float) {
        red = r
        green = g
        blue = b

        var aVal = a
        if aVal < 0.0 { aVal = 0.0 }
        if aVal > 1.0 { aVal = 1.0 }

        alpha = aVal
        hex = nil
    }

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
            print(string)
            string = str
        }
        self.hex = string

        var hexValue: UInt32 = 0
        Scanner(string: string).scanHexInt32(&hexValue)

        red = Float(hexValue >> 16 & 0xFF)
        green = Float(hexValue >> 8 & 0xFF)
        blue = Float(hexValue & 0xFF)

        var aVal = a
        if aVal < 0.0 { aVal = 0.0 }
        if aVal > 1.0 { aVal = 1.0 }

        alpha = aVal
    }
}

@available(swift 4.0)
extension Color: Encodable {

    public func encode(to encoder: Encoder) throws {
        enum CodingKeys : Int, CodingKey {
            case red
            case green
            case blue
            case alpha
            case hex
        }

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(alpha, forKey: .alpha)
        if let hexstring = hex?.uppercased() {
            try container.encode(hexstring, forKey: .hex)
        } else {
            try container.encode(red, forKey: .red)
            try container.encode(green, forKey: .green)
            try container.encode(blue, forKey: .blue)
        }
    }
}
