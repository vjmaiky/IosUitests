//
//  BaseScreen.swift
//  IosLearningUITests
//
//  Created by admin on 27/05/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import XCTest

//protocol BaseScreen {
//    
//}

class BaseScreen {
    
    var app: XCUIApplication
    
    required init(_ app: XCUIApplication) {
        self.app = app
    }
    
    
    /// Function to enabled current scren
    ///
    /// - Parameter baseScreen: Starting point of screen creation
    /// - Returns: Returns the current next or previous screen
    func on<T: BaseScreen>(baseScreen: T.Type) -> T {
        let nextPage: T
        
        // avoid duplicate initialization
        if self is T {
            nextPage = self as! T
        } else {
            nextPage = baseScreen.init(app)
        }
        
        return nextPage
    }

    
}
