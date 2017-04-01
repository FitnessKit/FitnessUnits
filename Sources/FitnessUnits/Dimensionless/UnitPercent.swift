//
//  UnitPercent.swift
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
/// Percentage Unit
final class UnitPercent: Unit {

    private struct Symbol {
        static let percent      = "%"
    }

    public class var percent: UnitPercent {
        get {
            return UnitPercent(symbol: Symbol.percent)
        }
    }

}
