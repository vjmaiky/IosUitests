//
//  TestBuilder.swift
//  IosLearningUITests
//
//  Created by admin on 07/06/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

class TestBuilder {
    
    let app: XCUIApplication
    
    required init(_ app: XCUIApplication) {
        self.app = app
    }
    
    func setLocale() -> Self {
        app.launchArguments += ["-AppleLanguages", "(en)"]
        app.launchArguments += ["-AppleLocale", "en_US"]
        
        return self
    }
    
    func launch() -> BaseScreen {
        Logger.i("----- We are starting the applicaiton under test -----")
        app.launch()
        Logger.i("----- Application under test was started -----")
        return BaseScreen(app)
    }
    
    //function to revive app
    @discardableResult
    func reviveApp() -> Self {
        Logger.i("----- Bringing application from Background -----")
        app.activate()
        return self
    }
    
    //function to kill the app
    @discardableResult
    func killTheApp() -> Self {
        Logger.i("----- Terminating the application under test -----")
        app.terminate()
        return self
    }
}
