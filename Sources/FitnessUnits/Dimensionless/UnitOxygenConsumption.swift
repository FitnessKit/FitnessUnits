//
//  UnitOxygenConsumption.swift
//  FitnessUnits
//
//  Created by Kevin Hoogheem on 4/1/17.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

@available(OSX 10.12, *)
/// Osygen Consumption Unit
open class UnitOxygenConsumption: Unit {

    private struct Symbol {
        static let consumption      = "mL/(kg·min)"
        static let vo2              = "VO2"
    }

    public class var consumption: UnitOxygenConsumption {
        get {
            return UnitOxygenConsumption(symbol: Symbol.consumption)
        }
    }

    public class var vo2: UnitOxygenConsumption {
        get {
            return UnitOxygenConsumption(symbol: Symbol.vo2)
        }
    }

}
