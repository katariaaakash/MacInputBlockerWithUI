//
//  InputBlocker.swift
//  InputBlocker
//
//  Created by Aakash Kataria on 20/10/18.
//  Copyright © 2018 Aakash Kataria. All rights reserved.
//

import Foundation

class InputBlocker {
    
    let passPhrase: String
    let passPhraseManager: PassphraseManager
    
    init(passPhrase: String) {
        self.passPhrase = passPhrase
        passPhraseManager = PassphraseManager(passPhraseLength: passPhrase.count, correctPassPhrase: passPhrase)
    }
    
    func startBlocking(){
        self.blockKeyBoard()
    }
    
    func stopBlocking() {
        print("Exiting...")
        exit(1)
    }
    
    func blockKeyBoard() {
        var cfRunLoopSource:CFRunLoopSource
        var inputMask = InputConfig.sharedInputConfig.getInputMask()
        var cgEventMask:CGEventMask = CGEventMask(inputMask)
        
        let eventTap = CGEvent.tapCreate(tap: CGEventTapLocation.cghidEventTap,
                                         place: CGEventTapPlacement.headInsertEventTap,
                                         options: CGEventTapOptions.defaultTap,
                                         eventsOfInterest: cgEventMask,
                                         callback:  {
                                            (tapProxy, eventType, event, refcon) -> Unmanaged<CGEvent>? in
                                            if eventType == .keyDown {
                                                let mySelf = Unmanaged<InputBlocker>.fromOpaque(refcon!).takeUnretainedValue()
                                                mySelf.passPhraseManager.appendChar(event: event)
                                            }
                                            return nil
                                         },
                                         userInfo: UnsafeMutableRawPointer(Unmanaged.passRetained(self).toOpaque()))
        
        if (eventTap == nil) {
            print(ConfigConstants.accesibilityPermissionNotGiven)
            exit(1)
        }
        cfRunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), cfRunLoopSource, CFRunLoopMode.commonModes)
        CGEvent.tapEnable(tap: eventTap!, enable: true)
        CFRunLoopRun()
    }
}
