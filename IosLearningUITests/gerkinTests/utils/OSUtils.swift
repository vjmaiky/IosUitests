//
//  OSUtils.swift
//  IosLearningUITests
//
//  Created by admin on 03/06/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

class OSUtils: BaseTest {
    
    let waiters = Waiters()
    
    //function to put app in background
    func putAppInBrackground() {
        Logger.i("----- Putting the application in background -----")
        XCUIDevice.shared.press(XCUIDevice.Button.home)
    }
    
    //function to put application in background for 5 seconda
    func putAppInBackgroundForXSeconds(timeout: TimeInterval) {
        putAppInBrackground()
        sleep(UInt32(timeout))
    }
    
    
    /// Function to enable or to disable airplane mode
    ///
    /// - Parameter isEnabled: Bool to set from start if airplane is enabled or disabled
    func enableAirPlaneMode(isEnabled: Bool) {
        Logger.i("----- Enabling AirPlane Mode -----")
        putAppInBrackground()
        let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        Logger.i("----- Launching Settings -----")
        settingsApp.launch()
        Logger.i("----- Clicking on AirplaneMode -----")
        settingsApp.tables.cells["Airplane Mode"].tap()
        if isEnabled {
            dismissAlerts()
        }
        
    }
    
    func dismissAlerts() {
        addUIInterruptionMonitor(withDescription: "No SIM Card Installed") { (alert) -> Bool in
            Logger.i("----- Dismiss Alert by clicking OK btn -----")
            let okBtn = alert.buttons["OK"]
            self.waiters.waitForElement(element: okBtn)
            okBtn.tap()
            return true
        }
    }
    
    func dimissAlert2() {
        addUIInterruptionMonitor(withDescription: "No SIM Card Installed") { (alert: XCUIElement) -> Bool in
            let evrything = alert.descendants(matching: .any).allElementsBoundByAccessibilityElement
            Logger.i(evrything)
            if alert.buttons.matching(identifier: "OK").count > 0 {
                alert.buttons["OK"].tap()
                return true
            }
            return false
        }
    }
    
}
