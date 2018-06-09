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

    init(words: [String], printable: Printable) {
        self.words = words
        self.printable = printable
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

protocol GameTimer {
    func 
}
