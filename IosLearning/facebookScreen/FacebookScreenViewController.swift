//
//  FacebookScreenViewController.swift
//  IosLearning
//
//  Created by admin on 14/03/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import UIKit

class FacebookScreenViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var enterAddressLabel: UILabel!
    @IBOutlet weak var facebookTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedArround()
        facebookTextField.delegate = self
    }
    
    
    @IBAction func backFromFacebookScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //save command with saving the address to user defaults
    @IBAction func clickSave(_ sender: Any) {
        guard let text = facebookTextField.text,
            text.count > 0 else {
                showAlertOnNotSavedAction()
                return
        }
        if(UserDefaults.getArrayAddress()?.contains(text) ?? false){
            alreadySavedFacebookAddress()
            facebookTextField.text = ""
            return
        }
        
        UserDefaults.saveAddressesToArray(address:  text)
        showAlertOnSavedAction()
        facebookTextField.text = ""
    }
    
    
    func showAlertOnSavedAction() {
        let alertController = UIAlertController(title: "Address was saved", message:
            "Facebook address was saved. Please check List with saved addresses", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertOnNotSavedAction() {
        let alertController = UIAlertController(title: "Address was not saved", message:
            "Facebook address was not saved. Please make sure you type something before save", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alreadySavedFacebookAddress() {
        let alertController = UIAlertController(title: "Address is already saved", message:
            "E-mail address is already saved. Please check List with saved addresses", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //click on show address button to display saved addresses
    @IBAction func showSavedAddresses(_ sender: Any) {
    }
    
    
    //hide keyboard on return button click
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedArround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UserDefaults {
    
    static func saveAddressesToArray(address: String) {
        var addressesToSave = [String]()
        
        if let currentValues = getArrayAddress()  {
            addressesToSave = currentValues
        }
        
        addressesToSave.append(address)
        let defaults = standard
        defaults.set(addressesToSave, forKey: "ids")
    }
    
    static func getArrayAddress() -> [String]? {
        let defaults = standard
        let myArray = defaults.stringArray(forKey: "ids")
        return myArray
    }
    
    static func delete(address: String) {
        var currentValues = getArrayAddress()
        currentValues?.removeAll(where: {$0 == address})
        let defaults = standard
        defaults.set(currentValues, forKey: "ids")
    }
    
}
