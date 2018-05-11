/*:
 [Previous](@previous)
 
 Can you name the Swift keywords?
 
 Vamos implementar o seguinte [jogo](https://www.sporcle.com/games/robv/java_keywords) usando TDD
 
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
