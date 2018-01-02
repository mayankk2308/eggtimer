//
//  PrefsViewController.swift
//  EggTimer
//
//  Created by Mayank Kumar on 1/1/18.
//  Copyright © 2018 Mayank Kumar. All rights reserved.
//

import Cocoa

class PrefsViewController: NSViewController {

    // MARK:- User interface references
    
    @IBOutlet weak var presetsPopup: NSPopUpButton!
    @IBOutlet weak var customSlider: NSSlider!
    @IBOutlet weak var customTimeTextField: NSTextField!
    var prefs = Preferences()
    
    // MARK:- View controller overrides and setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showExistingPrefs()
    }
    
    func showExistingPrefs() {
        let selectedTimeInMinutes = Int(prefs.selectedTime) / 60
        presetsPopup.selectItem(withTitle: "Custom")
        customSlider.isEnabled = true
        for item in presetsPopup.itemArray {
            if item.tag == selectedTimeInMinutes {
                presetsPopup.select(item)
                customSlider.isEnabled = false
                break
            }
        }
        customSlider.integerValue = selectedTimeInMinutes
        showSliderValueAsText()
    }
    
    func showSliderValueAsText() {
        let newTimerDuration = customSlider.integerValue
        let minutesDescription = (newTimerDuration == 1) ? "minute" : "minutes"
        customTimeTextField.stringValue = "\(newTimerDuration) \(minutesDescription)"
    }
    
    func saveNewPrefs() {
        prefs.selectedTime = customSlider.doubleValue * 60
        NotificationCenter.default.post(name: Notification.Name(rawValue: "PrefsChanged"), object: nil)
    }
    
    // MARK:- User interface actions
    
    @IBAction func popupValueChanged(_ sender: NSPopUpButton) {
        if sender.selectedItem?.title == "Custom" {
            customSlider.isEnabled = true
            return
        }
        let newTimerDuration = sender.selectedTag()
        customSlider.integerValue = newTimerDuration
        showSliderValueAsText()
        customSlider.isEnabled = false
    }
    
    @IBAction func sliderValueChanged(_ sender: NSSlider) {
        showSliderValueAsText()
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        view.window?.close()
    }
    
    @IBAction func okButtonClicked(_ sender: Any) {
        saveNewPrefs()
        view.window?.close()
    }
}
