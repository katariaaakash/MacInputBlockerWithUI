//
//  ViewController.swift
//  MacInputBlocker
//
//  Created by Aakash Kataria on 29/10/18.
//  Copyright © 2018 Aakash Kataria. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var keyPhrase: NSSecureTextField!
    @IBOutlet weak var reKeyPhrase: NSSecureTextField!
    @IBOutlet weak var lockButton: NSButton!
    
    @IBOutlet weak var errorMessage: NSTextField!
    
    @IBAction func lockButton(_ sender: Any) {
        if keyPhrase.stringValue != reKeyPhrase.stringValue {
            errorMessage.isHidden = false
        }
        else {
            errorMessage.isHidden = true
            print(ConfigConstants.passPhraseSetLabel)
            ScreenTimeOutManager.sharedScreenTimeOutManager.setUpScreenTimeOutManager()
            var inputBlocker:InputBlocker = InputBlocker(passPhrase: keyPhrase.stringValue)
            inputBlocker.startBlocking()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

