//
//  ViewController.swift
//  EggTimer
//
//  Created by Mayank Kumar on 12/31/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Cocoa

class EggViewController: NSViewController {

    // MARK:- User interface object references
    
    @IBOutlet weak var timeRemainingLabel: NSTextField!
    @IBOutlet weak var eggImageView: NSImageView!
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var resetButton: NSButton!
    
    // MARK:- View controller overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    // MARK:- User interface handlers
    
    @IBAction func startButtonClicked(_ sender: Any) {
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
    }
    
}

