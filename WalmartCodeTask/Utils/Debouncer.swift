//
//  Debouncer.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import Foundation

class Debouncer {
    
    private let delay: Double
    private var timer: Timer?

    init(delay: Double) {
        self.delay = delay
    }

    func debounce(task: @escaping (() -> Void)) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            task()
        }
    }
    
}
