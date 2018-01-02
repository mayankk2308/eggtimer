//
//  Preferences.swift
//  EggTimer
//
//  Created by Mayank Kumar on 1/1/18.
//  Copyright © 2018 Mayank Kumar. All rights reserved.
//

import Foundation

struct Preferences {
    
    var selectedTime: TimeInterval {
        get {
            let savedTime = UserDefaults.standard.double(forKey: "selectedTime")
            if savedTime > 0 {
                return savedTime
            }
            return 360
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "selectedTime")
        }
    }
    
}
