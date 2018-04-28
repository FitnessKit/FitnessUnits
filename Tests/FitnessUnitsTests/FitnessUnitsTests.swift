import XCTest
@testable import FitnessUnits

class FitnessUnitsTests: XCTestCase {

    public class Dork: Encodable {


        public var dork : ValidatedBinaryInteger<UInt64>


        public init() {
//            dork = ValidatedBinaryInteger(value: 8, valid: false, unit: UInt64.self)
            dork = ValidatedBinaryInteger(value: 8, valid: false)
            dork.valid = true

        }

    }

    func testExample() {


//        let upMovie = Dork()
//        let upMovie = ValidatedBinaryInteger<UInt32>(value: UInt32(2), valid: false)
        let upMovie = ValidatedBinaryFloatingPoint<Float32>(value: 22.0, valid: false)

        //let upMovie = ServiceCycleOps()
        //
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted]

        let jDecoder = JSONDecoder()
        do {
            let jsonData = try jsonEncoder.encode(upMovie)

            let jsonString = String(data: jsonData, encoding: .utf8)
            print("JSON String : " + jsonString!)

            let jsonDecoder = JSONDecoder()

//            let upMovie = try jsonDecoder.decode(ValidatedBinaryInteger<UInt64>.self, from: (jsonString?.data(using: .utf8))!)
            let upMovie = try jsonDecoder.decode(ValidatedBinaryFloatingPoint<Float32>.self, from: (jsonString?.data(using: .utf8))!)
            print("Name : \(upMovie.value)")

            print("'\(upMovie.value)' of type '\(type(of: upMovie.value))'")
            let g = upMovie.value + 32

        }
        catch {
            print(error)
        }


//        let dork = ValidatedNumeric(value: UInt8(2), valid: false, unit: UInt8.self)
//
//        print(dork.unit)
//        print(dork.description)
//        print(dork.debugDescription)
//        print(dork.unit)
    }



    static var allTests : [(String, (FitnessUnitsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
