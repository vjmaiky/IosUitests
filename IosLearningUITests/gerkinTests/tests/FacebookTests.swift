//
//  FacebookTests.swift
//  IosLearningUITests
//
//  Created by admin on 27/05/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation

class FacebookTests: BaseTest {
    
    var dateApp: BaseScreen!
    var testBuilder: TestBuilder!
    let osUtils = OSUtils()
    
    override func setUp() {
        super.setUp()
        
        dateApp = TestBuilder.init(app).setLocale().launch()
        testBuilder = TestBuilder.init(app)
    }
    
    func test01FacbookGeneralPage() {
        Given("User is in MainScreen") {
            dateApp
                .on(baseScreen: MainScreen.self)
                .validatePickerOptions()
        }
        When("User goes to Facebook Screen") {
            dateApp.on(baseScreen: MainScreen.self)
                .selectFacebook()
        }
        Then("Facebook screem is displayed") {
            dateApp.on(baseScreen: FacebookScreen.self)
                .validateNavigationBar()
                .validateFacebookPageElements()
        }
        When("User returns to Main Screen") {
            dateApp.on(baseScreen: FacebookScreen.self)
                .clickBackFromFacebookPage()
        }
        Then("User is in MainScreen") {
            dateApp
                .on(baseScreen: MainScreen.self)
                .validatePickerOptions()
        }
    }
    
    func test02FacebookAddressNotSaved() {
        Given("User is in FacebooScreen") {
            dateApp
                .on(baseScreen: MainScreen.self)
                .selectFacebook()
        }
        When("User clicks on save button without entering text") {
            dateApp
                .on(baseScreen: FacebookScreen.self)
                .clickSaveBtn()
        }
        Then("Nitification for address not saved is displayed") {
            dateApp
                .on(baseScreen: FacebookScreen.self)
                .validateAddressNotSavedMessage()
                .clickDismissBtn()
        }
    }
    
    func test03SuccessfullySaveAnAddress() {
        Given("User is in FacebooScreen") {
            dateApp
                .on(baseScreen: MainScreen.self)
                .selectFacebook()
        }
        And("User enters an address in Facebook Address input anc clicks save") {
            dateApp
                .on(baseScreen: FacebookScreen.self)
                .sendTextFacebook(address: "SavedAddressTest")
                .clickSaveBtn()
        }
        Then("Notification for saved address is displayed") {
            dateApp
                .on(baseScreen: FacebookScreen.self)
                .validateAddressSavedMessage()
                .clickDismissBtn()
        }
    }
    
    func test04DeleteAnAddress() {
        Given("User is in FacebooScreen") {
            dateApp
                .on(baseScreen: MainScreen.self)
                .selectFacebook()
        }
        When("User enters goes to Facebook addresses list to delete an address") {
            dateApp
                .on(baseScreen: FacebookScreen.self)
                .openSavedAddresesList()
        }
        Then("Deleted address is no longer displayed") {
            dateApp
                .on(baseScreen: FacebookScreen.self)
                .deleteAnAddressByText(text: "SavedAddressTest")
            waitTextToAppearOrDisappear(text: "SavedAddressTest", timeout: 3, existence: false)
        }
    }
    
    func test05DisplayedTextDisplayedAfterBackgroundInteraction() {
        Given("User is in FacebooScreen") {
            dateApp
                .on(baseScreen: MainScreen.self)
                .selectFacebook()
        }
        And("User enters an address in Facebook Address input anc clicks save") {
            dateApp
                .on(baseScreen: FacebookScreen.self)
                .sendTextFacebook(address: "SavedAddressTest")
        }
        When("User puts the application in background and resumes it") {
            osUtils
                .putAppInBackgroundForXSeconds(timeout: 3)
            testBuilder
                .reviveApp()
        }
        Then("Typed address is still displayed after background interaction") {
            dateApp
                .on(baseScreen: FacebookScreen.self)
                .validateInputTextIsStillDisplayed(text: "SavedAddressTest")
        }
    }
    
    func test06DisplayedTextClearedAfterAppKill() {
        Given("User is in FacebooScreen") {
            dateApp
                .on(baseScreen: MainScreen.self)
                .selectFacebook()
        }
        And("User enters an address in Facebook Address input anc clicks save") {
            dateApp
                .on(baseScreen: FacebookScreen.self)
                .sendTextFacebook(address: "SavedAddressTest")
        }
        When("User closed and opens the appplication again") {
            testBuilder
                .killTheApp()
                .reviveApp()
        }
        Then("Typed address is no longer displayed after killing the application and opening it again") {
            dateApp
                .on(baseScreen: MainScreen.self)
                .selectFacebook()
                .on(baseScreen: FacebookScreen.self)
                .validateInputTextIsNotDisplayed(text: "SavedAddressTest")
        }
    }
}
