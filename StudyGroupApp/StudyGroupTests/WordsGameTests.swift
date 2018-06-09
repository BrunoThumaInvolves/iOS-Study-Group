//
//  WordsGameTests.swift
//  StudyGroupTests
//
//  Created by Pietro Caselani on 08/06/18.
//  Copyright © 2018 Involves. All rights reserved.
//

import XCTest
@testable import StudyGroup

class PrintableMock: Printable {
    var printInvokedCount = 0
    var printInvokedLastParameters: String? = nil

    func win(message: String) {
        printInvokedCount += 1
        printInvokedLastParameters = message
    }

    func lose(message: String) {

    }

}

class TimerMock: GameTimer {
    var time = 0

    func tick() -> Int {
        time += 1
        return time
    }
}

class WordsGameTests: XCTestCase {

    let printable = PrintableMock()
    var words = ["Fracasso", "Depressão", "Tristeza"]

    func testInputWord() {
        //Given
        let game = WordsGame(words: words, printable: printable)
        //When
        let result = game.validate(word: "alegria")
        //Then
        XCTAssertFalse(result)
    }

    func testInputWordExists() {
        //Given
        let game = WordsGame(words: words, printable: printable)
        //When
        let result = game.validate(word: "Depressão")
        //Then
        XCTAssertTrue(result)
    }

    func testWinTheGame() {
        //Given
        let game = WordsGame(words: words, printable: printable)

        //When
        _ = game.validate(word: "Fracasso")
        _ = game.validate(word: "Depressão")
        _ = game.validate(word: "Tristeza")

        //Then
        XCTAssertEqual(printable.printInvokedCount, 1)
        XCTAssertEqual(printable.printInvokedLastParameters, "OK")

    }

    func testLoseGame() {

    }

}
