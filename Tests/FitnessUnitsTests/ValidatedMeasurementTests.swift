import XCTest
@testable import FitnessUnits

class ValidatedMeasurementTests: XCTestCase {

    func testDescription() {

        let measurement = ValidatedMeasurement(value: 1.0, valid: true, unit: UnitPower.watts)

        if measurement.description != "1.0 \(UnitPower.watts.symbol)" {
            XCTFail()
        }
    }


    static var allTests : [(String, (ValidatedMeasurementTests) -> () throws -> Void)] {
        return [
            ("testDescription", testDescription),
        ]
    }
}
