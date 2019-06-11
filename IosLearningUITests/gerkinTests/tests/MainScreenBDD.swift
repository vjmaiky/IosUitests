//
//  MainScreenBDD.swift
//  IosLearningUITests
//
//  Created by admin on 07/06/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import XCTest

class MainScreenBDD: BaseTest {
    
      var dateApp: BaseScreen!
    override func setUp() {
        super.setUp()
        dateApp = TestBuilder.init(app).setLocale().launch()
    }
    
    
    func testMainScreenTest() {
        Given("I am in MainScreen") {
            setUp()
        }
        
        Then("All elements from MainScreen are displayed correctly") {
            dateApp.on(baseScreen: MainScreen.self)
                .validateNavigationBarTitle()
                .validatePickerLabelTitle()
                .validatePickerOptions()
            
        }
        
    }
}
