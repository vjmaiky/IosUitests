//
//  Gestures.swift
//  IosLearningUITests
//
//  Created by admin on 22/05/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

class Gestures {
    
    let waiters = Waiters()
    
    /// Method to click on UIElement
    ///
    /// - Parameter uielement: target element to be clicked
    
    func clickUIElement(uielement: XCUIElement,
                        file: String = #file, line: UInt = #line) {
        waiters.waitForElement(element: uielement)
        Logger.e("----- Trying to click on element \(uielement.label) -----")
        uielement.tap()
    }
    
    
    /// Method to send text on UIElement
    ///
    /// - Parameter uielement: target element where to send the text
    /// - Parameter text: Text value to be sent
    
    func sendTextValue (uielement: XCUIElement, text: String) {
        clickUIElement(uielement: uielement)
        Logger.e("----- Trying to send keys to \(uielement.label) using text \(text) -----")
        uielement.typeText(text)
    }
    
    
    
    /// Method to tap by Coordinates
    ///
    /// - Parameter x: coordinates for X
    /// - Parameter y: coordinates for Y
    
    func tapByCoordinates(x: Double, y: Double){
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinates = normalized.withOffset(CGVector(dx: x, dy: y))
        coordinates.tap()
    }
    
    
    
    /// Method to double click on UIElement
    ///
    /// - Parameter uielement: target element where to double click
    
    func doubleClickUIElement(uielement: XCUIElement) {
        waiters.waitForElement(element: uielement)
        Logger.e("----- Trying to double click on element \(uielement.label) -----")
        uielement.doubleTap()
    }
    
    
    /// Method to double tap by Coordinates
    ///
    /// - Parameter x: coordinates for X
    /// - Parameter y: coordinates for Y

    func doubleClickUIElementWithCoordinates(x: Double, y: Double) {
        Logger.e("----- Trying to double tap by coordinates -----")
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinates = normalized.withOffset(CGVector(dx: x, dy: y))
        coordinates.doubleTap()
    }
    
    
    /// Method to click on UIElement with duration
    ///
    /// - Parameter uielement: Elment to be clicked
    /// - Parameter duration: Duration for tap gesture
    
    func clickOnUielementWithDuration(uielement: XCUIElement, duration: TimeInterval) {
        waiters.waitForElement(element: uielement)
        Logger.e("----- Trying to click on element \(uielement.label) for \(duration) seconds -----")
        uielement.press(forDuration: duration)
    }
    
    
    
    /// Method to click Enable or Disable a slider
    ///
    /// - Parameter uielement: Slider UIElement
    /// - Parameter isEnabled: Bool to specify if slider is already enabled or disabled
    
    func enableDisableSlider(uielement: XCUIElement, isEnabled: Bool) {
        Logger.e("----- Trying to enable/disable slider -----")
        if isEnabled {
            Logger.e("----- Slider is disabled and we will enable it -----")
            uielement.adjust(toNormalizedSliderPosition: 1)
        } else {
            Logger.e("----- Slider is enabled and we will disable it -----")
            uielement.adjust(toNormalizedSliderPosition: 0)
        }
    }
    
    
    /// Method to delete a cell by index
    ///
    /// - Parameter row: Index of cell to be deleted
    
    func deleteCellByIndex(row: Int) {
        let tablesQuery = app.tables.cells
        Logger.e("----- Swipe left cell: \(row) to enable Delete function -----")
        tablesQuery.element(boundBy: row).swipeLeft()
        Logger.e("Clicking on delete button from row: \(row)")
        tablesQuery.element(boundBy: row).buttons["Delete"].tap()
    }
    
    
    /// Method to delete a cell by its text value
    ///
    /// - Parameter desiredElement: text of the cell to be deleted
    
    func deleteCellByText (desiredElement: String) {
        let element = app.tables.cells.staticTexts[desiredElement]
        Logger.e("----- Swipe left cell: \(element) to enable Delete function -----")
        element.swipeLeft()
        Logger.e("Clicking on delete button from row with name: \(desiredElement)")
        app.buttons["Delete"].tap()
    }
    
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
