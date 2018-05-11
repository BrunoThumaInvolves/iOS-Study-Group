/*:
 
 Multiset com TDD
 
 Matematicamente, um multiset (Multiconjunto) é a generalização de um conjunto, de tal forma que permite a repetição de elementos.
 
 [Multiconjunto no Wikipedia](https://pt.wikipedia.org/wiki/Multiconjunto)
 
 Implemente um Multiconjunto em Swift que permita
 * adicionar um elemento
 * remover um element
 * contar quantas vezes o elemento se repete
 */

import Foundation
import XCTest

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                         didFailWithDescription description: String,
                         inFile filePath: String?,
                         atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}


// Code


XCTestObservationCenter.shared.addTestObserver(TestObserver())
// TestClass.defaultTestSuite.run()

//: [Next](@next)
