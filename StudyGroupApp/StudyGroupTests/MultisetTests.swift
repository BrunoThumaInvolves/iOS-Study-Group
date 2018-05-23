/*:

 Multiset com TDD

 Matematicamente, um multiset (Multiconjunto) é a generalização de um conjunto, de tal forma que permite a repetição de elementos.

 [Multiconjunto no Wikipedia](https://pt.wikipedia.org/wiki/Multiconjunto)

 Implemente um Multiconjunto em Swift que permita
 * adicionar um elemento
 * remover um element
 * contar quantas vezes o elemento se repete
 */

import XCTest
@testable import StudyGroup

class TestSet: XCTestCase {

    func testAddElement() {
        let multiset = MultiSet()
        multiset.add(element: 1)
        XCTAssertTrue(multiset.contains(element: 1))
    }

    func testContainsElement() {
        let multiset = MultiSet()
        let result = multiset.contains(element: 1)
        XCTAssertFalse(result)
    }

    func testCountElements() {
        //Given
        let multiset = MultiSet()
        multiset.add(element: 1)
        multiset.add(element: 1)

        //When
        let result = multiset.count(element: 1)

        //Then
        XCTAssertEqual(result, 2)
    }

    func testRemoveElement() {
        //Given
        let multiset = MultiSet()
        multiset.add(element: 1)

        //When
        multiset.remove(element: 1)

        //Then
        XCTAssertFalse(multiset.contains(element: 1))
    }
}
