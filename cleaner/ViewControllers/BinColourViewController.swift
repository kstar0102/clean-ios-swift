//
//  BinColourViewController.swift
//  cleaner
//
//  Created by Admin on 01/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class BinColourViewController: UIViewController {

    @IBOutlet weak var greybtn: UIButton!
    @IBOutlet weak var redbtn: UIButton!
    @IBOutlet weak var yellowbtn: UIButton!
    @IBOutlet weak var whitebtn: UIButton!
    @IBOutlet weak var blackbtn: UIButton!
    @IBOutlet weak var purplebtn: UIButton!
    @IBOutlet weak var greenbtn: UIButton!
    @IBOutlet weak var brownbtn: UIButton!
    
    @IBOutlet weak var binNumber: UILabel!
    @IBOutlet weak var testview: UIView!
    
    private var selectedColorIndex: Int = 0
    var binTotalCount: Int = 0
    var bincount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // colour button UI
        self.redbtn.layer.cornerRadius = 15
        self.yellowbtn.layer.cornerRadius = 15
        self.whitebtn.layer.cornerRadius = 15
        self.blackbtn.layer.cornerRadius = 15
        self.greybtn.layer.cornerRadius = 15
        self.purplebtn.layer.cornerRadius = 15
        self.greenbtn.layer.cornerRadius = 15
        self.brownbtn.layer.cornerRadius = 15
        
        // selected bin number
        self.binNumber.text = String(bincount + 1)
        
        // define first button and view
        redbtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        testview.backgroundColor = UIColor.red
        setUI(redbtn)
    }
    
    func setUI(_ view: UIButton) {
        // border colour and width
        let selectedColor = UIColor.black
        view.layer.borderWidth = 2
        view.layer.borderColor = selectedColor.cgColor
        
        // colour button first border state
        redbtn.layer.borderWidth = 0
        yellowbtn.layer.borderWidth = 0
        whitebtn.layer.borderWidth = 0
        blackbtn.layer.borderWidth = 0
        greybtn.layer.borderWidth = 0
        purplebtn.layer.borderWidth = 0
        greenbtn.layer.borderWidth = 0
        brownbtn.layer.borderWidth = 0
    }
    

    @IBAction func binweekbyn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binWeek") as! BinWeekViewController
        
        // cast data to Binweek viewController
        newViewController.selecColourIndex = self.selectedColorIndex
        newViewController.binTotalCount = self.binTotalCount
        newViewController.bincount = self.bincount
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    // colour button department
    @IBAction func redbtn(_ sender: Any) {
        testview.backgroundColor = UIColor.red
        if #available(iOS 13.0, *) {
            redbtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        yellowbtn.setImage(nil, for: .normal)
        greybtn.setImage(nil, for: .normal)
        greenbtn.setImage(nil, for: .normal)
        blackbtn.setImage(nil, for: .normal)
        brownbtn.setImage(nil, for: .normal)
        whitebtn.setImage(nil, for: .normal)
        purplebtn.setImage(nil, for: .normal)
        self.selectedColorIndex = 0
        setUI(redbtn)
    }
    
    @IBAction func yellowbtn(_ sender: Any) {
        testview.backgroundColor = UIColor.yellow
        if #available(iOS 13.0, *) {
            yellowbtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        redbtn.setImage(nil, for: .normal)
        greybtn.setImage(nil, for: .normal)
        greenbtn.setImage(nil, for: .normal)
        blackbtn.setImage(nil, for: .normal)
        brownbtn.setImage(nil, for: .normal)
        whitebtn.setImage(nil, for: .normal)
        purplebtn.setImage(nil, for: .normal)
        self.selectedColorIndex = 1
        setUI(yellowbtn)
    }
    
    @IBAction func greenbtn(_ sender: Any) {
        testview.backgroundColor = UIColor.green
        if #available(iOS 13.0, *) {
            greenbtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        redbtn.setImage(nil, for: .normal)
        greybtn.setImage(nil, for: .normal)
        yellowbtn.setImage(nil, for: .normal)
        blackbtn.setImage(nil, for: .normal)
        brownbtn.setImage(nil, for: .normal)
        whitebtn.setImage(nil, for: .normal)
        purplebtn.setImage(nil, for: .normal)
        self.selectedColorIndex = 2
        setUI(greenbtn)
    }
    
    @IBAction func blackbtn(_ sender: Any) {
        testview.backgroundColor = UIColor.black
        if #available(iOS 13.0, *) {
            blackbtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        redbtn.setImage(nil, for: .normal)
        greybtn.setImage(nil, for: .normal)
        yellowbtn.setImage(nil, for: .normal)
        greenbtn.setImage(nil, for: .normal)
        brownbtn.setImage(nil, for: .normal)
        whitebtn.setImage(nil, for: .normal)
        purplebtn.setImage(nil, for: .normal)
        self.selectedColorIndex = 3
        setUI(blackbtn)
    }
    
    @IBAction func greybtn(_ sender: Any) {
        testview.backgroundColor = UIColor.blue
        if #available(iOS 13.0, *) {
            greybtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        redbtn.setImage(nil, for: .normal)
        blackbtn.setImage(nil, for: .normal)
        yellowbtn.setImage(nil, for: .normal)
        greenbtn.setImage(nil, for: .normal)
        brownbtn.setImage(nil, for: .normal)
        whitebtn.setImage(nil, for: .normal)
        purplebtn.setImage(nil, for: .normal)
        self.selectedColorIndex = 4
        setUI(greybtn)
    }
    
    @IBAction func brownbtn(_ sender: Any) {
        testview.backgroundColor = UIColor.brown
        if #available(iOS 13.0, *) {
            brownbtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        redbtn.setImage(nil, for: .normal)
        blackbtn.setImage(nil, for: .normal)
        yellowbtn.setImage(nil, for: .normal)
        greenbtn.setImage(nil, for: .normal)
        greybtn.setImage(nil, for: .normal)
        whitebtn.setImage(nil, for: .normal)
        purplebtn.setImage(nil, for: .normal)
        self.selectedColorIndex = 5
        setUI(brownbtn)
    }
    
    @IBAction func pruplebtn(_ sender: Any) {
        testview.backgroundColor = UIColor.purple
        if #available(iOS 13.0, *) {
            purplebtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        redbtn.setImage(nil, for: .normal)
        blackbtn.setImage(nil, for: .normal)
        yellowbtn.setImage(nil, for: .normal)
        greenbtn.setImage(nil, for: .normal)
        greybtn.setImage(nil, for: .normal)
        whitebtn.setImage(nil, for: .normal)
        brownbtn.setImage(nil, for: .normal)
        self.selectedColorIndex = 6
        setUI(purplebtn)
    }
    
    @IBAction func whitebtn(_ sender: Any) {
        testview.backgroundColor = UIColor.white
        if #available(iOS 13.0, *) {
            whitebtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        redbtn.setImage(nil, for: .normal)
        blackbtn.setImage(nil, for: .normal)
        yellowbtn.setImage(nil, for: .normal)
        greenbtn.setImage(nil, for: .normal)
        greybtn.setImage(nil, for: .normal)
        purplebtn.setImage(nil, for: .normal)
        brownbtn.setImage(nil, for: .normal)
        self.selectedColorIndex = 7
        setUI(whitebtn)
    }
}
