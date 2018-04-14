//
//  HeartRateZone.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 4/14/18.
//

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
    private(set) public var color: Color

    public init(lower: UInt8, upper: UInt8, name: String, color: Color) {
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
        enum CodingKeys : Int, CodingKey {
            case lowerBounds
            case upperBounds
            case name
            case color
        }

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.range.lowerBound, forKey: .lowerBounds)
        try container.encode(self.range.upperBound, forKey: .upperBounds)
        try container.encode(name, forKey: .name)
        try container.encode(color, forKey: .color)
    }
}

