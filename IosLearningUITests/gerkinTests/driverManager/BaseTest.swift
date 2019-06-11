//
//  BaseTest.swift
//  IosLearningUITests
//
//  Created by admin on 22/05/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

class BaseTest: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
    }
    
    
    override func tearDown() {
        Logger.i("----- We are finishing the tests so tear down function is called -----")
        let screenshot = XCUIScreen.main.screenshot()
        let fullScreenshotAttachment = XCTAttachment(screenshot: screenshot)
        fullScreenshotAttachment.lifetime = .deleteOnSuccess
        add(fullScreenshotAttachment)
        Logger.i("----- Closing application under test -----")
        app.terminate()
    }
    
    
    /// Function to wait for an element to appear or disappear using Expectations
    ///
    /// - Parameters:
    ///   - uielement: Element toi wait for
    ///   - timeout: Time to wait for the element
    ///   - file: <#file description#>
    ///   - line: <#line description#>
    ///   - existence: Bool to set if element is displayed or not
    func waitToAppearOrDisappear(uielement: XCUIElement, timeout: TimeInterval = 10, file: String = #file, line: UInt = #line, existence: Bool = true) {
        let existsPredicate = NSPredicate(format: "exists == \(existence)")
        
        expectation(for: existsPredicate, evaluatedWith: uielement, handler: nil)
        
        waitForExpectations(timeout: timeout) { (error) -> Void in
            Logger.i("----- Waiting for: \(uielement) to appear or disappear -----")
            if error != nil {
                Logger.e("----- Failed to fulfill expectation after \(timeout) seconds -----")
                let message = "Failed to fulfill expectation after \(timeout) seconds"
                self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
            }
        }
    }
    
    
    /// Function to wait for and element to appear or disappear by its text
    ///
    /// - Parameters:
    ///   - text: Text of the element
    ///   - timeout: Time to wait for text
    ///   - file: <#file description#>
    ///   - line: <#line description#>
    ///   - existence: Bool to set if element is displayed or not
    func waitTextToAppearOrDisappear(text: String, timeout: TimeInterval = 10, file: String = #file, line: UInt = #line, existence: Bool = true) {
        let existsPredicate = NSPredicate(format: "exists == \(existence)")
        let composedElement = app.staticTexts[text]
        
        expectation(for: existsPredicate, evaluatedWith: composedElement, handler: nil)
        
        waitForExpectations(timeout: timeout) { (error) -> Void in
            Logger.i("----- Waiting for: \(text) to appear or disappear -----")
            if error != nil {
                Logger.e("----- Failed to fulfill expectation after \(timeout) seconds -----")
                let message = "Failed to fulfill expectation after \(timeout) seconds"
                self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
            }
        }
    }
    
}
