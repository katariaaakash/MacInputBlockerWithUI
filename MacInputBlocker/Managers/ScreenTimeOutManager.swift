//
//  ScreenTimeOutManager.swift
//  InputBlocker
//
//  Created by Aakash Kataria on 20/10/18.
//  Copyright © 2018 Aakash Kataria. All rights reserved.
//

import Foundation
import IOKit.pwr_mgt


class ScreenTimeOutManager {
    static let sharedScreenTimeOutManager = ScreenTimeOutManager()
    
    var assertionID: IOPMAssertionID = 0
    var sleepDisabled = false
    
    func setUpScreenTimeOutManager() {
        if ConfigConstants.preventScreenFromSleeping {
            disableScreenSleep()
        }
        else{
            enableScreenSleep()
        }
    }
    
    func disableScreenSleep(reason: String = ConfigConstants.disablingScreenSleepReason) {
        sleepDisabled =  IOPMAssertionCreateWithName(kIOPMAssertionTypeNoDisplaySleep as CFString, IOPMAssertionLevel(kIOPMAssertionLevelOn), reason as CFString, &assertionID) == kIOReturnSuccess
    }
    func enableScreenSleep() {
        IOPMAssertionRelease(assertionID)
        sleepDisabled = false
    }
}
