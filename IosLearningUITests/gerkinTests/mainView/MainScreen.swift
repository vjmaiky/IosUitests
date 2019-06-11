//
//  MainScreen.swift
//  IosLearningUITests
//
//  Created by admin on 22/05/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

class MainScreen: BaseScreen {
    
    required init(_ app: XCUIApplication) {
        super.init(app)
    }
    
    let asserts = Asserts()
    let gestures = Gestures()
    let osUtils = OSUtils()
    let waiters = Waiters()
    let baseTest = BaseTest()
    
    //elements from header section
    lazy var navigationBarTitle = app.navigationBars["MainScreen"]
    
    //elements from picker lists
    lazy var pickerListLabel = app.staticTexts["pickerTitle"]
    lazy var facebookBtn = app.buttons["facebookBtn"]
    lazy var emailBtn = app.buttons["emailBtn"]
    lazy var gmailBtn = app.buttons["gmailBtn"]
    lazy var giveFacebookBtn = app.buttons["giveFacebookBtn"]
    
    
    @discardableResult
    func validatePickerLabelTitle() -> MainScreen {
        Logger.i("----- Verifying if Picker Label is displayed -----")
        asserts.verifyIfUIElemnentExists(uielement: pickerListLabel)
        asserts.verifyIfElementLabelValue(uielement: pickerListLabel, value: "Pick your choice :")
        return self
    }
    
    @discardableResult
    func validateNavigationBarTitle() -> MainScreen {
        Logger.i("----- Verifying Navigation Bar Title -----")
        asserts.verifyIfUIElemnentExists(uielement: navigationBarTitle)
        return self
    }
    
    @discardableResult
    func validatePickerOptions() -> MainScreen {
        Logger.i("----- Verifying Picker Options are displayed -----")
        asserts.verifyIfUIElemnentExists(uielement: facebookBtn)
        asserts.verifyIfUIElemnentExists(uielement: emailBtn)
        asserts.verifyIfUIElemnentExists(uielement: gmailBtn)
        asserts.verifyIfUIElemnentExists(uielement: giveFacebookBtn)
        return self
    }
    
    @discardableResult
    func selectFacebook() -> FacebookScreen {
        Logger.i("----- Trying to click on Facebook Category -----")
        gestures.clickUIElement(uielement: facebookBtn)
        return FacebookScreen(app)
    }
    
}
