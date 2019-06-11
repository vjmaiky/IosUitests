//
//  FacebookView.swift
//  IosLearningUITests
//
//  Created by admin on 22/05/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

class FacebookScreen: BaseScreen {
    
    required init(_ app: XCUIApplication) {
        super.init(app)
    }
    
    let gestures = Gestures()
    let waiters = Waiters()
    let asserts = Asserts()
    let swipe = Swipe()
    let swiftUtils = SwiftUtils()
    
    //elements from navigation bar
    lazy var backBtn = app.navigationBars.buttons["Back"]
    lazy var navigationBarTitle = app.navigationBars["FacebookScreen"]
    
    //elements visible in facebook screen
    lazy var addressLabel = app.staticTexts["enterAddressLabel"]
    lazy var saveBtn = app.buttons["saveButton"]
    lazy var facebookInput = app.textFields["facebookInputId"]
    lazy var listAddressesBtn = app.buttons["savedListBtn"]
    
    //elements from saving notifications
    lazy var dismissBtn = app.alerts.buttons["Dismiss"]
    lazy var addressNotSaveText = app.alerts.staticTexts["Facebook address was not saved. Please make sure you type something before save"]
    lazy var addressSavedText = app.alerts.staticTexts["Facebook address was saved. Please check List with saved addresses"]
    
    lazy var testAddress = app.staticTexts[":());:/"]
    

    @discardableResult
    func validateNavigationBar() -> FacebookScreen {
        Logger.i("----- Validating Navigation bar elements -----")
        asserts.verifyIfUIElemnentExists(uielement: backBtn)
        asserts.verifyIfUIElemnentExists(uielement: navigationBarTitle)
        return self
    }

    @discardableResult
    func validateFacebookPageElements() -> FacebookScreen {
        Logger.i("----- Validating Facebook Screen elements -----")
        asserts.verifyIfUIElemnentExists(uielement: addressLabel)
        asserts.verifyIfUIElemnentExists(uielement: facebookInput)
        asserts.verifyIfUIElemnentExists(uielement: saveBtn)
        asserts.verifyIfUIElemnentExists(uielement: listAddressesBtn)
        asserts.verifyIfElementLabelValue(uielement: addressLabel, value: "Enter Your Facebook ID :")
        return self
    }
    
    
    @discardableResult
    func clickSaveBtn() -> FacebookScreen {
        Logger.i("----- Trying to click on Save Button -----")
        gestures.clickUIElement(uielement: saveBtn)
        return self
    }
    
    @discardableResult
    func validateAddressNotSavedMessage() -> FacebookScreen {
        Logger.i("----- Validating that address not save text is displayed -----")
        asserts.verifyIfUIElemnentExists(uielement: addressNotSaveText)
        return self
    }
    
    @discardableResult
    func validateAddressSavedMessage() -> FacebookScreen {
        Logger.i("----- Validating that address not save text is displayed -----")
        asserts.verifyIfUIElemnentExists(uielement: addressSavedText)
        return self
    }
    
    @discardableResult
    func clickDismissBtn() -> FacebookScreen {
        Logger.i("----- Trying to click on Dismiss Button -----")
        gestures.clickUIElement(uielement: dismissBtn)
        return self
    }
    
    @discardableResult
    func clickBackFromFacebookPage() -> MainScreen {
        Logger.i("----- Trying to click on Back from facebook page button -----")
        gestures.clickUIElement(uielement: backBtn)
        return MainScreen(app)
    }
    
    @discardableResult
    func sendTextFacebook (address: String) -> FacebookScreen {
        Logger.i("----- Sending text to facebook input: \(address) -----")
        gestures.sendTextValue(uielement: facebookInput, text: address)
        return self
    }
    
    @discardableResult
    func openSavedAddresesList() -> FacebookScreen {
        Logger.i("----- Open saved addresses list -----")
        gestures.clickUIElement(uielement: listAddressesBtn)
        return self
    }
    
    @discardableResult
    func typeMultipleAddresses() -> FacebookScreen {
        var count = 0;
        while count < 30 {
            sendTextFacebook(address: swiftUtils.randomString(length: 4))
            clickSaveBtn()
            clickDismissBtn()
            count += 1
        }
        return self
    }
    
    @discardableResult
    func deleteAnAddress() -> FacebookScreen {
        gestures.deleteCellByIndex(row: 1)
        return self
    }
    
    @discardableResult
    func deleteAnAddressByText(text: String) -> FacebookScreen {
        swipe.generalSwipeToFindByText(text: text, .Up)
        gestures.deleteCellByText(desiredElement: text)
        return self
    }
    
    @discardableResult
    func validateInputTextIsStillDisplayed(text: String) -> FacebookScreen {
        Logger.i("----- Verify if input text is still displayed after returning from background -----")
        asserts.verifyThatTextEqualsGivenText(uielement: facebookInput, value: text)
        return self
    }
    
    @discardableResult
    func validateInputTextIsNotDisplayed(text: String) -> FacebookScreen {
        Logger.i("----- Verify if input text is still displayed after returning from background -----")
        asserts.verifyThatTextNotEqualsGivenText(uielement: facebookInput, value: text)
        return self
    }
    
}
