//
//  DefaultTimer.swift
//  StudyGroup
//
//  Created by Pietro Caselani on 29/06/18.
//  Copyright © 2018 Involves. All rights reserved.
//

import Foundation

final class DefaultTimer: TimerProtocol {
    private var callback: (() -> Void)?

    init() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: false)
    }

    @objc func timerCallback() {
        callback?()
    }

    func register(callback: @escaping () -> Void) {
        self.callback = callback
    }
}
