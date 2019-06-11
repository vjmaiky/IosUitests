//
//  AddressListViewController.swift
//  IosLearning
//
//  Created by admin on 21/03/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation
import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

struct FacebookAddress {
    let name: String
    //    let name1: [ String]
}

class AddressListViewController: UITableViewController {
    
    var addreses = [FacebookAddress]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedAddresses = UserDefaults.getArrayAddress()
        addreses = savedAddresses?.map({FacebookAddress(name: $0)}) ?? []
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addreses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let adressCell = tableView.dequeueReusableCell(withIdentifier: "AdressCell", for: indexPath)
        adressCell.textLabel?.text = addreses[indexPath.row].name
        return adressCell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let address = addreses[indexPath.row].name
            self.addreses.removeAll(where: {$0.name == address})
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.delete(address: address)
        }
    }

    
}
