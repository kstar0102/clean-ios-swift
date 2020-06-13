//
//  BinWeekViewController.swift
//  cleaner
//
//  Created by Admin on 01/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class BinWeekViewController: UIViewController {
    
    var selecColourIndex: Int = 0
    var binTotalCount:Int = 0
    var cycleIndex:Int = 0
    var bincount = 0
    @IBOutlet weak var binNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //selected bin number
        binNumber.text = String(bincount + 1)
    }
    
    // go back the BinColour viewController
    @IBAction func backbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // cycle button department
    
    // weekly cycle
    @IBAction func weekBtn(_ sender: Any) {
        cycleIndex = 0
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binCollection") as! BinCollectionViewController
        
        //cast data to binCollection viewController
        newViewController.selecColourIndex = self.selecColourIndex
        newViewController.binTotalCount = self.binTotalCount
        newViewController.cycleIndex = self.cycleIndex
        newViewController.bincount = self.bincount
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    // every 2 weekly cycle
    @IBAction func fortnightbtn(_ sender: Any) {
        cycleIndex = 1
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binCollection") as! BinCollectionViewController
        
        //cast data to binCollection viewController
        newViewController.selecColourIndex = self.selecColourIndex
        newViewController.binTotalCount = self.binTotalCount
        newViewController.cycleIndex = self.cycleIndex
        newViewController.bincount = self.bincount
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    // every 3 weekly cycle
    @IBAction func threebtn(_ sender: Any) {
        cycleIndex = 2
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binCollection") as! BinCollectionViewController
        
        //cast data to binCollection viewController
        newViewController.selecColourIndex = self.selecColourIndex
        newViewController.binTotalCount = self.binTotalCount
        newViewController.cycleIndex = self.cycleIndex
        newViewController.bincount = self.bincount
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    //every 4 weekly cycle
    @IBAction func fourbtn(_ sender: Any) {
        cycleIndex = 3
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binCollection") as! BinCollectionViewController
        
        //cast data to binCollection viewController
        newViewController.selecColourIndex = self.selecColourIndex
        newViewController.binTotalCount = self.binTotalCount
        newViewController.cycleIndex = self.cycleIndex
        newViewController.bincount = self.bincount
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
}
