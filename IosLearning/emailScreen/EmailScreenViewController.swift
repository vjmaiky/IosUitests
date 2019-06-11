//
//  EmailScreenViewController.swift
//  IosLearning
//
//  Created by admin on 14/03/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import UIKit

class EmailScreenViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var enterEmailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedArround()
        enterEmailText.delegate = self
    }
    
    @IBAction func backFromEmailScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func clickSaveEmail(_ sender: Any) {
        guard let text = enterEmailText.text,
            text.count > 0 else {
                showAlertOnNotSavedAction()
                return
        }
        
        if(UserDefaults.getEmailArrayAddress()?.contains(text) ?? false){
            alreadySavedEmailAddress()
            enterEmailText.text = ""
            return
        }
        
        UserDefaults.saveEmailAddressesToArray(address:  text)
        showAlertOnSavedAction()
        enterEmailText.text = ""
    }
    
    @IBAction func goToEmailPageList(_ sender: Any) {
    }
    
    
    func showAlertOnSavedAction() {
        let alertController = UIAlertController(title: "Address was saved", message:
            "E-mail address was saved. Please check List with saved addresses", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertOnNotSavedAction() {
        let alertController = UIAlertController(title: "Address was not saved", message:
            "E-mail address was not saved. Please make sure you type something before save", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alreadySavedEmailAddress() {
        let alertController = UIAlertController(title: "Address is already saved", message:
            "E-mail address is already saved. Please check List with saved addresses", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //hide keyboard on return button click
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension UserDefaults {
    
    static func saveEmailAddressesToArray(address: String) {
        var addressesToSave = [String]()
        
        if let currentValues = getEmailArrayAddress()  {
            addressesToSave = currentValues
        }
        
        addressesToSave.append(address)
        let defaults = standard
        defaults.set(addressesToSave, forKey: "emailids")
    }
    
    static func getEmailArrayAddress() -> [String]? {
        let defaults = standard
        let myArray = defaults.stringArray(forKey: "emailids")
        return myArray
    }
    
    static func deleteEmail(address: String) {
        var currentValues = getEmailArrayAddress()
        currentValues?.removeAll(where: {$0 == address})
        let defaults = standard
        defaults.set(currentValues, forKey: "emailids")
    }
    
}


