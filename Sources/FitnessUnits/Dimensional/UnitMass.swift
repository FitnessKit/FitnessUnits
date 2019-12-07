//
//  UnitMass.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 8/8/17.
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

@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension UnitMass {
    
    enum BodySurfaceAreaFormula {
        /// DuBois D, DuBois DF
        case duBois
        /// Gehan EA, George SL Formula
        case gehanGeorge
        /// Haycock GB, Schwartz GJ, Wisotsky DH Formula
        case haycock
        /// Mosteller
        case mosteller
        
        /// Body Surface Area (BSA)
        ///
        /// - Parameters:
        ///   - height: Height
        ///   - weight: Weight
        /// - Returns: Body Surface Area (BSA)
        func bsa(height: Measurement<UnitLength>, weight: Measurement<UnitMass>) -> Double {
            let heightCm = height.converted(to: .centimeters).value
            let weightKg = weight.converted(to: .kilograms).value
            
            switch self {
            case .duBois:
                return 0.007184 * pow(heightCm, 0.725) * pow(weightKg, 0.425)
                
            case .gehanGeorge:
                return 0.0235 * pow(heightCm, 0.42246) * pow(weightKg, 0.51456)
                
            case .haycock:
                return 0.024265 * pow(heightCm, 0.3964) * pow(weightKg, 0.5378)
                
            case .mosteller:
                return sqrt((heightCm * weightKg) / 3600)
            }
        }
    }
    
    /// Body Surface Area (BSA) using the Mosteller Formula
    ///
    /// - Parameters:
    ///   - height: Height
    ///   - weight: Weight
    /// - Returns: Body Surface Area (BSA)
    final class func bsaUsingMosteller(height: Measurement<UnitLength>, weight: Measurement<UnitMass>) -> Double {
        return BodySurfaceAreaFormula.mosteller.bsa(height: height, weight: weight)
    }
    
    /// Body Surface Area (BSA) using the DuBois D, DuBois DF Formula
    ///
    /// - Parameters:
    ///   - height: Height
    ///   - weight: Weight
    /// - Returns: Body Surface Area (BSA)
    final class func bsaUsingDuBois(height: Measurement<UnitLength>, weight: Measurement<UnitMass>) -> Double {
        return BodySurfaceAreaFormula.duBois.bsa(height: height, weight: weight)
    }
    
    /// Body Surface Area (BSA) using the Haycock GB, Schwartz GJ, Wisotsky DH Formula
    ///
    /// - Parameters:
    ///   - height: Height
    ///   - weight: Weight
    /// - Returns: Body Surface Area (BSA)
    final class func bsaUsingHaycock(height: Measurement<UnitLength>, weight: Measurement<UnitMass>) -> Double {
        return BodySurfaceAreaFormula.haycock.bsa(height: height, weight: weight)
    }
    
    /// Body Surface Area (BSA) using the Gehan EA, George SL Formula
    ///
    /// - Parameters:
    ///   - height: Height
    ///   - weight: Weight
    /// - Returns: Body Surface Area (BSA)
    final class func bsaUsingGehanGeorge(height: Measurement<UnitLength>, weight: Measurement<UnitMass>) -> Double {
        return BodySurfaceAreaFormula.gehanGeorge.bsa(height: height, weight: weight)
    }
}

@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension UnitMass {
    
    /// Body Mass Index (BMI)
    ///
    /// - Parameters:
    ///   - height: Height
    ///   - weight: Weight
    /// - Returns: Body Mass Index (BMI)
    final class func bmi(height: Measurement<UnitLength>, weight: Measurement<UnitMass>) -> Double {
        
        let heightM = height.converted(to: .meters).value
        let weightKg = weight.converted(to: .kilograms).value
        
        let bmi = weightKg / pow(heightM, 2)
        return bmi
    }
    
}
