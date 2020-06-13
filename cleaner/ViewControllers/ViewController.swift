//
//  ViewController.swift
//  cleaner
//
//  Created by Admin on 31/05/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change `2.0` to the desired number of seconds.

            self.gotoNextScreen()
        }
    }
    func gotoNextScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainController
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binTable") as! BinTableViewController
                self.present(newViewController, animated: true, completion: nil)
    }


}

