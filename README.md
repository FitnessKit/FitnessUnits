# FitnessUnits
Units of Measurement for Fitness

[![Swift3](https://img.shields.io/badge/swift3-compatible-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/FitnessUnits.svg?style=flat)](http://cocoapods.org/pods/FitnessUnits)
[![License](https://img.shields.io/cocoapods/l/FitnessUnits.svg?style=flat)](http://cocoapods.org/pods/FitnessUnits)
[![Platform](https://img.shields.io/cocoapods/p/FitnessUnits.svg?style=flat)](http://cocoapods.org/pods/FitnessUnits)

## Installation

FitnessUnits is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FitnessUnits"
```

Swift Package Manager:
```swift
    dependencies: [
        .Package(url: "https://github.com/FitnessKit/FitnessUnits", majorVersion: 1)
    ]
```

## New Dimensional Unit Types ##

* UnitAngularVelocity
* UnitForce
* UnitLinearDensity
* UnitMagneticField
* UnitTorque

## Extensions to Dimensional Units ##

* UnitAcceleration - Galileo
* UnitAngle - Bradian
* UnitAngle - Milliradian
* UnitSpeed - metersPerMinute
* UnitSpeed - metersPerHour
* UnitSpeed - kilometersPerSecond
* UnitSpeed - kilometersPerMinute
* UnitSpeed - milesPerSecond
* UnitSpeed - milesPerMinute
* UnitSpeed - speedOfLight
* UnitEnergy - Energy Burn Calculations
* UnitEnergy - MegaJoule
* UnitEnergy - Watt Hour
* UnitEnergy - Electron Volts
* UnitEnergy - British Thermal Units (BTU)
* UnitEnergy - US Therm (thm)
* UnitMass - Mass Calculations
* UnitConcentrationMass - gramsPerMilliliter
* UnitConcentrationMass - kilogramsPerMilliliter
* UnitConcentrationMass - milligramsPerLiter
* UnitConcentrationMass - kilogramsPerLiter
* UnitDuration - year


## New Dimensionless Unit Types ##

* UnitCadence - Cadence (RPM, BPM, Steps per min, etc..)
* UnitGender
* UnitOxygenConsumption - VO2
* UnitPercent
* UnitRadioactivity

## New Measurement Types ##

* StringMeasurement - Type that holds a `String` value associated with a `Unit`
* ValidatedMeasurement - Extension of `Measurement` that provides feedback on validity of data.


## Other Types ##

* MeasurementZone - Type that bounds values between a upper and lower bounds.



## Author

Kevin A. Hoogheem

## License

FitnessUnits is available under the MIT license. See the LICENSE file for more info.
