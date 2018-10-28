//
//  PassphraseManager.swift
//  InputBlocker
//
//  Created by Aakash Kataria on 20/10/18.
//  Copyright © 2018 Aakash Kataria. All rights reserved.
//

import Foundation

class PassphraseManager {
    var passPhrase: String = ""
    var correctPassPhrase: String = ""
    var passPhraseLength: Int = 0
    
    init(passPhraseLength: Int, correctPassPhrase: String) {
        self.passPhraseLength = passPhraseLength
        self.correctPassPhrase = correctPassPhrase
    }
    func appendChar(char:Character) {
        passPhrase += String(char)
        fixPassphrase()
        if isValidPassphrase() {
            exit(1)
        }
    }
    
    func appendChar(event:CGEvent) {
        var char = UniChar()
        var length = 0
        event.keyboardGetUnicodeString(maxStringLength: 1, actualStringLength: &length, unicodeString: &char)
        var charPressed = Character(UnicodeScalar(char)!)
        passPhrase += String(charPressed)
        fixPassphrase()
        if isValidPassphrase() {
            print(ConfigConstants.unlockedMessage)
        }
    }
    
    func isValidPassphrase() -> Bool{
        if self.passPhrase == self.correctPassPhrase {
            return true
        }
        return false
    }
    
    func fixPassphrase() {
        if passPhrase.count > passPhraseLength {
            self.passPhrase.removeFirst()
        }
    }
}
