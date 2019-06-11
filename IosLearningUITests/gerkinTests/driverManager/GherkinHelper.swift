//
//  GherkinHelper.swift
//  IosLearningUITests
//
//  Created by admin on 07/06/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

extension XCTest {
    
    func Given(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: "Given " + text) { _ in
            step()
        }
    }
    
    func When(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: "When " + text) { _ in
            step()
        }
    }
    
    func And(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: "And " + text) { _ in
            step()
        }
    }
    
    func Then(_ text: String, step: () -> Void ) {
        XCTContext.runActivity(named: "Then " + text) { _ in
            step()
        }
    }
}
