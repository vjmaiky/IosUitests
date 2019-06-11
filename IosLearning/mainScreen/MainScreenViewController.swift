//
//  MainScreenViewController.swift
//  IosLearning
//
//  Created by admin on 14/03/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import UIKit

class MainScreenViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func facebookBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "switchToFacebook", sender: nil)
    }
    
    
    @IBAction func emailBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "switchToEmail", sender: nil)
    }
    
    
    @IBAction func gmailBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "switchToGmail", sender: nil)
    }
    
    
    @IBAction func otherOptionBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "switchToMyFacebook", sender: nil)
    }
}
