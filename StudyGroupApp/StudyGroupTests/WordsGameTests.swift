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
    var winInvokedCount = 0
    var winInvokedLastParameters: String? = nil

    var loseInvokedCount = 0
    var loseInvokedLastParameters: String? = nil

    func win(message: String) {
        winInvokedCount += 1
        winInvokedLastParameters = message
    }

    func lose(message: String) {
        loseInvokedCount += 1
        loseInvokedLastParameters = message
    }
}

class TimerMock: TimerProtocol {
    private var callback: (() -> Void)?

    func register(callback: @escaping () -> Void) {
        self.callback = callback
    }

    func tick() {
        callback!()
    }
}

class WordsGameTests: XCTestCase {

    let printable = PrintableMock()
    let timer = TimerMock()
    var words = ["Fracasso", "Depressão", "Tristeza"]

    func testInputWord() {
        //Given
        let game = WordsGame(words: words, printable: printable, timer: timer)
        //When
        let result = game.validate(word: "alegria")
        //Then
        XCTAssertFalse(result)
    }

    func testInputWordExists() {
        //Given
        let game = WordsGame(words: words, printable: printable, timer: timer)
        //When
        let result = game.validate(word: "Depressão")
        //Then
        XCTAssertTrue(result)
    }

    func testWinTheGame() {
        //Given
        let game = WordsGame(words: words, printable: printable, timer: timer)

        //When
        _ = game.validate(word: "Fracasso")
        _ = game.validate(word: "Depressão")
        _ = game.validate(word: "Tristeza")

        //Then
        XCTAssertEqual(printable.winInvokedCount, 1)
        XCTAssertEqual(printable.winInvokedLastParameters, "OK")
    }

    func testLoseGame() {
        //Given
        let game = WordsGame(words: words, printable: printable, timer: timer, countdown: 3)

        //When
        timer.tick()
        timer.tick()
        timer.tick()

        //Then
        XCTAssertEqual(printable.loseInvokedCount, 1)
        XCTAssertEqual(printable.loseInvokedLastParameters, "Fail")
    }
}
