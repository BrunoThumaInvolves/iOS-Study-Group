//
//  WordsGame.swift
//  StudyGroup
//
//  Created by Pietro Caselani on 08/06/18.
//  Copyright © 2018 Involves. All rights reserved.
//

import Foundation

final class WordsGame {
    private var words: [String]
    private let printable: Printable
    private let timer: TimerProtocol
    private var countdown: Int

    init(words: [String], printable: Printable, timer: TimerProtocol, countdown: Int = 300) {
        self.words = words
        self.printable = printable
        self.timer = timer
        self.countdown = countdown

        timer.register {
            self.countdown -= 1

            if self.countdown == 0 {
                self.printable.lose(message: "Fail")
            }
        }
    }

    func validate(word: String) -> Bool {
        guard let index = words.index(of: word) else {
            return false
        }

        words.remove(at: index)

        if words.isEmpty {
            printable.win(message: "OK")
        }

        return true
    }
} 


protocol Printable {

    func win(message: String)
    func lose(message: String)
    
}
