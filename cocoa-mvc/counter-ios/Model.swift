//
//  Model.swift
//  counter-ios
//
//  Created by 若森和昌 on 2021/11/03.
//

import Foundation

protocol Model {
    var notificationCenter: NotificationCenter { get }
    func countDown()
    func countUp()
}

final class ModelImpl: Model {
    let notificationCenter = NotificationCenter.default
    private (set) var count = 0 {
        didSet {
            notificationCenter.post(name: .init(rawValue: "count"),
                                    object: nil,
                                    userInfo: ["count": count])
        }
    }
    
    func countDown() {
        count -= 1
    }
    
    func countUp() {
        count += 1
    }
}
