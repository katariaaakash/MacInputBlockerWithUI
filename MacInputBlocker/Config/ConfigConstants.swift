//
//  ConfigConstants.swift
//  InputBlocker
//
//  Created by Aakash Kataria on 20/10/18.
//  Copyright © 2018 Aakash Kataria. All rights reserved.
//

import Foundation

class ConfigConstants {
    
    // Screen Sleep
    static let preventScreenFromSleeping:Bool = true;
    
    // Passphrase
    static let keyphraseEnterPromptText:String = "Please enter keyphrase which will be used to unlock. For security purpose i recommend You to set new keyphrase everytime you lock."
    static let disablingScreenSleepReason:String = "Disabling Screen Sleep";
    static let passPhraseSetLabel:String = "Keyphrase set...";
    
    // App Lifecycle
    static let startingLabel:String = "Starting...";
    static let exitingLabel:String = "Exiting...";
    
    static let unlockedMessage:String = "Unlocked...";
    
    // Accessibility
    static let accesibilityPermissionNotGiven:String = "Couldn't create event tap, please give assesibility permission to use this software. Follow these steps to give accessibility permission: go to System Preferences -> Security & Privacy -> Privacy -> Accessibility";
}
