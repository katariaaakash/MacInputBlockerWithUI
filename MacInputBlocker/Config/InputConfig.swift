//
//  InputConfig.swift
//  InputBlocker
//
//  Created by Aakash Kataria on 20/10/18.
//  Copyright © 2018 Aakash Kataria. All rights reserved.
//

import Foundation

class InputConfig {
    
    static let sharedInputConfig = InputConfig()
    
    let keyDown = 1 << CGEventType.keyDown.rawValue
    let keyUp = 1 << CGEventType.keyUp.rawValue
    let leftMouseDown = 1 << CGEventType.leftMouseDown.rawValue
    let rightMouseDown = 1 << CGEventType.rightMouseDown.rawValue
    let rightMouseUp = 1 << CGEventType.rightMouseUp.rawValue
    let leftMouseUp = 1 << CGEventType.leftMouseUp.rawValue
    
    var inputMask = 0
    
    init() {
        self.inputMask = self.keyDown | self.keyUp | self.leftMouseDown | self.rightMouseDown | self.rightMouseUp | self.leftMouseUp
    }
    
    func getInputMask() -> UInt32 {
        return UInt32(inputMask)
    }
}
