//
//  EggTimer.swift
//  EggTimer
//
//  Created by Mayank Kumar on 1/1/18.
//  Copyright © 2018 Mayank Kumar. All rights reserved.
//

import Foundation

protocol EggTimerProtocol {
    func timeRemainingOnTimer(_ timer: EggTimer, remainingTime time: TimeInterval)
    func timerHasFinished(_ timer: EggTimer)
}

/// Models the primary timing system of the application
class EggTimer {
    
    var timer: Timer?
    var startTime: Date?
    var duration: TimeInterval = 360
    var elapsedTime: TimeInterval = 0
    
    var delegate: EggTimerProtocol?
    
    var isStopped: Bool {
        return timer == nil && elapsedTime == 0
    }
    
    var isPaused: Bool {
        return timer == nil && elapsedTime > 0
    }
    
    @objc dynamic func timerAction() {
        guard let startTime = startTime else { return }
        elapsedTime = -startTime.timeIntervalSinceNow
        let secondsRemaining = (duration - elapsedTime).rounded()
        if secondsRemaining < 1 {
            resetTimer()
            delegate?.timerHasFinished(self)
        }
        else {
            delegate?.timeRemainingOnTimer(self, remainingTime: secondsRemaining)
        }
    }
    
    func startTimer() {
        startTime = Date()
        elapsedTime = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timerAction()
    }
    
    func resumeTimer() {
        startTime = Date(timeIntervalSinceNow: -elapsedTime)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerAction()
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        startTime = nil
        duration = 360
        elapsedTime = 0
        timerAction()
    }
    
}
