//
//  BinSetupViewController.swift
//  cleaner
//
//  Created by Admin on 01/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData

class BinSetupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var bindata:[BinData] = []
        bindata = DatabaseManager.getBinDatas()
    }
    @IBAction func setupbtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binReminder") as! BinreminderViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func backbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
