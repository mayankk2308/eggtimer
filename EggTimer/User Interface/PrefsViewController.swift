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
    
    // MARK:- View controller overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    // MARK:- User interface actions
    
    @IBAction func popupValueChanged(_ sender: Any) {
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
    
    @IBAction func okButtonClicked(_ sender: Any) {
    }
    
}
