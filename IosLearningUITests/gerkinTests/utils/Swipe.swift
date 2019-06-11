//
//  Swipe.swift
//  IosLearningUITests
//
//  Created by admin on 27/05/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest
import AdSupport

class Swipe {
    
    let waiters = Waiters()
    let gestures = Gestures()
    
    
    
    /// General function to find an UIElement using swipe command
    ///
    /// - Parameters:
    ///   - uielement: element to be found
    ///   - direction: direction of swipe in order to find element
    func generalSwipeToFindElement(uielement: XCUIElement, _ direction: direction) {
        switch direction {
        case .Up:
            swipeUpToFindElement(uielement: uielement)
        case .Down:
            swipeDownToFindElement(uielement: uielement)
        case .Left:
            swipeLeftToFindElement(uielement: uielement)
        case .Right:
            swipeRightToFindElement(uielement: uielement)
        }
    }
    

    /// General function to find an UIElement by its text
    ///
    /// - Parameters:
    ///   - text: Text of UIElement
    ///   - direction: Direction of swipe in order to find element
    func generalSwipeToFindByText(text: String, _ direction: direction) {
        switch direction {
        case .Up:
            swipeUpToFindElementByText(text: text)
        case .Down:
            swipeDownToFindElementByText(text: text)
        case .Left:
            swipeLeftToFindElementByText(text: text)
        case .Right:
            swipeRightToFindElementByText(text: text)
        }
    }
    
    //function to drag screen from an UIElement to another UIElement
    func dragScreenToElement(uielement: XCUIElement, duration: TimeInterval) {
        Logger.i("----- Drag screen to \(uielement.label) -----")
        app.press(forDuration: duration, thenDragTo: uielement)
    }
    
    func dragAndDrop(duration: Double, dragElement: XCUIElement, dropElement: XCUIElement) {
        waiters.waitForElement(element: dragElement)
        dragElement.press(forDuration: 1, thenDragTo: dropElement)
    }
    
    //function to PINCH screen
    func pinchScreen(scale: CGFloat, velocity: CGFloat) {
        Logger.i("----- Pinch screen with scale: \(scale) and velocity: \(velocity) -----")
        app.pinch(withScale: scale, velocity: velocity)
    }
    
    //general function for Swipe
    func generalSwipe(_ direction: direction) {
        switch direction {
        case .Up:
            app.swipeUp()
        case .Down:
            app.swipeDown()
        case .Left:
            app.swipeLeft()
        case .Right:
            app.swipeRight()
        }
    }
    
    func swipeUpToFindElement(uielement: XCUIElement) {
        Logger.i("----- Swipe up to find \(uielement.label) -----")
        var n = 0
        while !uielement.isHittable || n < 6 {
            app.swipeUp()
            if uielement.isHittable {
                Logger.i("----- Element: \(uielement.label) was found -----")
                break
            }
            n += 1
        }
    }
    
    func swipeDownToFindElement(uielement: XCUIElement) {
        Logger.i("----- Swipe down to find \(uielement.label) -----")
        var n = 0
        while !uielement.isHittable || n < 6 {
            app.swipeDown()
            if uielement.isHittable {
                Logger.i("----- Element: \(uielement.label) was found -----")
                break
            }
            n += 1
        }
    }
    
    func swipeLeftToFindElement(uielement: XCUIElement) {
        Logger.i("----- Swipe left to find \(uielement.label) -----")
        var n = 0
        while !uielement.isHittable || n < 6 {
            app.swipeLeft()
            if uielement.isHittable {
                Logger.i("----- Element: \(uielement.label) was found -----")
                break
            }
            n += 1
        }
    }
    
    func swipeRightToFindElement(uielement: XCUIElement) {
        Logger.i("----- Swipe right to find \(uielement.label) -----")
        var n = 0
        while !uielement.isHittable || n < 6 {
            app.swipeRight()
            if uielement.isHittable {
                Logger.i("----- Element: \(uielement.label) was found -----")
                break
            }
            n += 1
        }
    }
    
    func swipeUpToFindElementByText(text: String) {
        Logger.i("----- Swipe up to find \(text) -----")
        var n = 0
        let searchableElement = app.staticTexts[text]
        while !searchableElement.isHittable || n < 6 {
            app.swipeUp()
            if searchableElement.isHittable {
                Logger.i("----- Element: \(searchableElement.label) was found -----")
                break
            }
            n += 1
        }
    }
    
    func swipeDownToFindElementByText(text: String) {
        Logger.i("----- Swipe down to find \(text) -----")
        var n = 0
        let searchableElement = app.staticTexts[text]
        while !searchableElement.isHittable || n < 6 {
            app.swipeDown()
            if searchableElement.isHittable {
                Logger.i("----- Element: \(searchableElement.label) was found -----")
                break
            }
            n += 1
        }
    }
    
    func swipeRightToFindElementByText(text: String) {
        Logger.i("----- Swipe right to find \(text) -----")
        var n = 0
        let searchableElement = app.staticTexts[text]
        while !searchableElement.isHittable || n < 6 {
            app.swipeRight()
            if searchableElement.isHittable {
                Logger.i("----- Element: \(searchableElement.label) was found -----")
                break
            }
            n += 1
        }
    }
    
    func swipeLeftToFindElementByText(text: String) {
        Logger.i("----- Swipe left to find \(text) -----")
        var n = 0
        let searchableElement = app.staticTexts[text]
        while !searchableElement.isHittable || n < 6 {
            app.swipeLeft()
            if searchableElement.isHittable {
                Logger.i("----- Element: \(searchableElement.label) was found -----")
                break
            }
            n += 1
        }
    }
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    enum direction : String {
        case Up, Down, Left, Right
    }
}
