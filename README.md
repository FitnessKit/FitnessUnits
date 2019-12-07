# FitnessUnits
Units of Measurement for Fitness

[![Swift5](https://img.shields.io/badge/swift5-compatible-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/FitnessUnits.svg?style=flat)](http://cocoapods.org/pods/FitnessUnits)
[![License](https://img.shields.io/cocoapods/l/FitnessUnits.svg?style=flat)](http://cocoapods.org/pods/FitnessUnits)
[![Platform](https://img.shields.io/cocoapods/p/FitnessUnits.svg?style=flat)](http://cocoapods.org/pods/FitnessUnits)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/fitnesskit/fitnessunits)](http://clayallsopp.github.io/readme-score?url=https://github.com/fitnesskit/fitnessunits)
[![codebeat badge](https://codebeat.co/badges/da3ab4bb-38da-4caf-a886-f16deed74d63)](https://codebeat.co/projects/github-com-fitnesskit-fitnessunits-master)


## Installation

FitnessUnits is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FitnessUnits"
```

Swift Package Manager:

Swift
```swift
    dependencies: [
        .package(url: "https://github.com/FitnessKit/FitnessUnits", from: "3.1.0"),
    ]
```

Swift4
```swift
    dependencies: [
        .package(url: "https://github.com/FitnessKit/FitnessUnits", .branch("swift42")),
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
* UnitAngle - Semicircle
* UnitAngle - Garmin Semicircle (ANT/FIT Files)
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
* UnitConcentrationMass - gramsPerDeciliter
* UnitConcentrationMass - gramsPerMilliliter
* UnitConcentrationMass - kilogramsPerMilliliter
* UnitConcentrationMass - milligramsPerLiter
* UnitConcentrationMass - kilogramsPerLiter
* UnitDuration - microsecond
* UnitDuration - millisecond
* UnitDuration - year
* UnitDuration - decade


## New Dimensionless Unit Types ##

* UnitCadence - Cadence (RPM, BPM, Steps per min, etc..)
* UnitCount
* UnitGender
* UnitOxygenConsumption - VO2
* UnitPercent
* UnitRadioactivity

## New Measurement Types ##

* StringMeasurement - Type that holds a `String` value associated with a `Unit`
* ValidatedMeasurement - Extension of `Measurement` that provides feedback on validity of data.
* ValidatedBinaryInteger - BinaryInteger with a validity check
* ValidatedBinaryFloatingPoint - BinaryFloatingPoint with a validity check

## Other Types ##

* MeasurementZone - Type that bounds values between a upper and lower bounds.


## Author

This package is developed and maintained by Kevin A. Hoogheem

## License

FitnessUnits is available under the [MIT license](http://opensource.org/licenses/MIT)

