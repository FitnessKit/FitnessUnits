//
//  MeasurementZone.swift
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

/// A `MeasurementZone` is a model type that bounds values between a upper and lowe bounds.
///
/// `MeasurementZone` may be a Heart Rate Zone, FTP Zone, or used for other measurements that you wish to bound between an upper and lower value
public struct MeasurementZone {

    /// Zone Range
    private(set) public var range: ClosedRange<UInt8>

    /// Name of the Zone
    private(set) public var name: String

    /// Color Repesentation of the Zone
    private(set) public var color: ColorType

    public init(lower: UInt8, upper: UInt8, name: String, color: ColorType) {
        range = ClosedRange(uncheckedBounds: (lower: lower, upper: upper))
        self.name = name
        self.color = color
    }

    /// Check if Value is contained in the Zone
    ///
    /// - Parameter value: Measurement Value
    /// - Returns: Results of the check
    public func contains(value: UInt8) -> Bool {
        return range.contains(value)
    }
}

@available(swift 4.0)
extension MeasurementZone: Encodable {

    public func encode(to encoder: Encoder) throws {
        enum CodingKeys: Int, CodingKey {
            case range
            case name
            case color
        }

        enum BoundsKeys: Int, CodingKey {
            case lowerBounds
            case upperBounds
        }

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)

        var boundsContainer = container.nestedContainer(keyedBy: BoundsKeys.self, forKey: .range)
        try boundsContainer.encode(self.range.lowerBound, forKey: .lowerBounds)
        try boundsContainer.encode(self.range.upperBound, forKey: .upperBounds)

        try color.encode(to: encoder)

    }
}
