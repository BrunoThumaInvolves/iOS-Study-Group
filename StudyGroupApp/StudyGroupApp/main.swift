//
//  main.swift
//  StudyGroupApp
//
//  Created by Pietro Caselani on 23/05/18.
//  Copyright © 2018 Involves. All rights reserved.
//

import Foundation

print("Hello, World!")

func printDate(date: @autoclosure () -> Date = Date()) {
    print(date())
    sleep(4)
    print(date())
    sleep(4)
    print(date())
    sleep(4)
    print(date())
}

printDate()
