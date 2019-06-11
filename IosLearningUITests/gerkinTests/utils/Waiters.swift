//
//  Waiters.swift
//  IosLearningUITests
//
//  Created by admin on 22/05/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

class Waiters: BaseTest {    
    
    /// Method to wait for an element using a timeout
    ///
    /// - Parameter uielement: target element to be verified
    /// - Parameter timeout: given time to wait for element
    
    func waitForElement(element: XCUIElement, timeout: TimeInterval = 5) {
        if element.waitForExistence(timeout: timeout) != true {
            Logger.e("---- Element \(element.label) was not visible ---")
            XCTFail("Element \(element.label) was not visible")
        } else {
            Logger.e("---- Element \(element.label) was visible ---")
        }
    }
    
    
    /// Method to wait for an element to disappear using a timeout
    ///
    /// - Parameter uielement: target element to be verified
    /// - Parameter timeout: given time to wait for element
    
    func waitForElementToDisappear(uielement: XCUIElement, timeout: TimeInterval = 5) {
        while uielement.waitForExistence(timeout: timeout) == true {
            Logger.e("---- Element \(uielement.label) is still visible ---")
            XCTFail("Element \(uielement.label) is still visible")
        }
    }
    
}



