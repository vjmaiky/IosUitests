//
//  Asserts.swift
//  IosLearningUITests
//
//  Created by admin on 22/05/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

class Asserts {
    
    /// Method to verify if uielement exists
    ///
    /// - Parameter uielement: target element to be verified
    
    func verifyIfUIElemnentExists(uielement: XCUIElement) {
        Logger.i("----- Trying to verify if \(uielement) is displayed -----")
        XCTAssertTrue(uielement.exists, "Element was not displayed on screen")
    }
    
    /// Method to verify if uielement does not exists
    ///
    /// - Parameter uielement: target element to be verified
    
    func verifyElementNotExists(uielement: XCUIElement) {
        Logger.i("----- Trying to verify if \(uielement.label) is not displayed -----")
        XCTAssertFalse(uielement.exists, "Element is still displayed on screen")
    }
    
    /// Method to verify if uielement is Enabled
    ///
    /// - Parameter uielement: target element to be verified
    
    func verifyIfElementIsEnabled(uielement: XCUIElement) {
        Logger.i("----- Trying to verify if \(uielement.label) is enabled -----")
        XCTAssertTrue(uielement.isEnabled, "Element was not enabled")
    }
    
    /// Method to verify if uielement is not Enabled
    ///
    /// - Parameter uielement: target element to be verified
    
    func verifyIfElementIsNotEnabled(uielement: XCUIElement) {
        Logger.i("----- Trying to verify if \(uielement.label) is not enabled -----")
        XCTAssertFalse(uielement.isEnabled, "Element was enabled")
    }
    
    
    /// Method to verify if uielement is Selected
    ///
    /// - Parameter uielement: target element to be verified
    
    func verifyIfElementIsSelected(uielement: XCUIElement) {
        Logger.i("----- Trying to verify if \(uielement.label) is selected -----")
        XCTAssertTrue(uielement.isSelected, "Element was not selected")
    }
    
    /// Method to verify if uielement is not Selected
    ///
    /// - Parameter uielement: target element to be verified
    func verifyIfElementIsNotSelected(uielement: XCUIElement) {
        Logger.i("----- Trying to verify if \(uielement.label) is not selected -----")
        XCTAssertFalse(uielement.isSelected, "Element was selected")
    }
    
    /// Method to verify if element label is equal with given text
    ///
    /// - Parameter uielement: target element to be verified
    
    func verifyIfElementLabelValue(uielement: XCUIElement, value:String) {
        Logger.i("----- Trying to verify if \(uielement.label) is not selected -----")
        let elementValue = uielement.label
        XCTAssertEqual(elementValue, value, "Text of element: \(uielement.label) is not the same as text: \(value)")
    }
    
    /// Method to verify if element text is equal with given text
    ///
    /// - Parameter uielement: target element to be verified
    /// - Parameter value: given text for comparison
    
    func verifyThatTextEqualsGivenText(uielement: XCUIElement, value: String) {
        Logger.i("----- Trying to verify if \(uielement.label) is equal to \(value) -----")
        if let elementValue = uielement.value as? String {
            XCTAssertEqual(elementValue, value, "Text of element: \(uielement.label) is not the same as text: \(value)")
        } else {
            XCTFail("Please revise function to cover your specific case")
        }
    }
    
    /// Method to verify if element text is not equal with given text
    ///
    /// - Parameter uielement: target element to be verified
    /// - Parameter value: given text for comparison
    
    func verifyThatTextNotEqualsGivenText(uielement: XCUIElement, value: String) {
        Logger.i("----- Trying to verify if \(uielement.label) is not equal to \(value) -----")
        if let elementValue = uielement.value as? String {
            XCTAssertNotEqual(elementValue, value, "Label of \(uielement.label) is the same as \(value)")
        } else {
            XCTFail("Please revise function to cover your specific case")
        }
    }
    
    
    /// Method to verify if element text contains given text
    ///
    /// - Parameter uielement: target element to be verified
    /// - Parameter value: given text for comparison
    
    func verifyThatTextCotainsGiventext(uielement: XCUIElement, value: String) {
        Logger.i("----- Trying to verify if \(uielement.label) contains text \(value) -----")
        if let elementValue = uielement.value as? String {
            XCTAssertTrue(elementValue.contains(value), "Label of \(uielement.label) does not contain \(value)")
        } else {
            XCTFail("Please revise function to cover your specific case")
        }
    }
    
    
    /// Method to verify if element text does not contain given text
    ///
    /// - Parameter uielement: target element to be verified
    /// - Parameter value: given text for comparison
    
    func verifyThatTextNotCotainsGiventext(uielement: XCUIElement, value: String) {
        Logger.i("----- Trying to verify if \(uielement.label) does not contain text \(value) -----")
        if let elementValue = uielement.value as? String {
            XCTAssertFalse(elementValue.contains(value), "Label of \(uielement) contains \(value)")
        } else {
            XCTFail("Please revise function to cover your specific case")
        }
    }
    
    /// Method to verify if element is present within give time - returns a Bool
    ///
    /// - Parameter uielement: target element to be verified
    /// - Parameter waitTime: timer to wait for element to pe present
    
    func isElementPresent(uielement: XCUIElement, waitTime: Double) -> Bool {
        Logger.i("----- Trying to verify if \(uielement) is present -----")
        return uielement.waitForExistence(timeout: waitTime)
    }
    
    
    /// Method to verify if element is present - returns a Bool
    ///
    /// - Parameter uielement: target element to be verified

    func isElementPresent(_ uielement: XCUIElement) -> Bool {
        Logger.i("----- Trying to verify if \(uielement) is present -----")
        return uielement.waitForExistence(timeout: 0)
    }
    
    /// Method to verify if element text does not contain given text
    ///
    /// - Parameter uielement: target element to be verified
    /// - Parameter waitTime: timer to wait for element to pe present
    
    func isElementNotDisplayed(uielement: XCUIElement, waitTime: Double) -> Bool {
        Logger.i("----- Trying to verify if \(uielement) is not present -----")
        let endTime = getCurrentMillis() + waitTime * 1000
        var elementPresent = true
        while elementPresent && endTime > getCurrentMillis() {
            elementPresent = uielement.exists
        }
        return !elementPresent
    }
    
    func getCurrentMillis() -> Double {
        Logger.i("----- Getting time milis -----")
        return Date().timeIntervalSince1970 * 1000
    }
    
    
}
