//
//  Helpers.swift
//  IosLearningUITests
//
//  Created by admin on 11/06/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest


class Helpers {
    
    func getCurrentMillis() -> Double {
        return Date().timeIntervalSince1970 * 1000
    }
    
    func hideKeyBoard(field: XCUIElement) {
        field.typeText("\n")
    }
    
    func getText(_ element: XCUIElement) -> String {
        let label = element.label as String
        let value = element.value as? String
        let text = label.isEmpty ? value : label
        return text ?? ""
    }
    
    //function to change orientation as desired
    func changeOrientation(orientation: orientation) {
        switch orientation {
        case .Portrait:
            XCUIDevice.shared.orientation = UIDeviceOrientation.portrait
        case .Landscape:
            XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft
        }
    }
    
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
    
    func checkThatOsVersionEql(_ version: String) -> Bool {
        return version == getOsVersion()
    }
    
    func getOsVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    func getElementCentrals(_ element: XCUIElement) -> CGPoint {
        return CGPoint(x: getElementCentralX(element), y: getElementCentralY(element))
    }
    
    func getElementCentralX(_ element: XCUIElement) -> Double {
        return Double(element.frame.midX)
    }
    
    func getElementCentralY(_ element: XCUIElement) -> Double {
        return Double(element.frame.midY)
    }
    
    func getUdid() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    enum orientation: String {
        case Portrait, Landscape
    }
    
}
