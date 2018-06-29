//
//  TimerProtocol.swift
//  StudyGroup
//
//  Created by Pietro Caselani on 29/06/18.
//  Copyright © 2018 Involves. All rights reserved.
//

protocol TimerProtocol {
    func register(callback: @escaping () -> Void)
}
