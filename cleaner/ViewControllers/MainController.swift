//
//  MainController.swift
//  cleaner
//
//  Created by Admin on 31/05/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class MainController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var countPiker: UIPickerView!
    
    //define for selected binCount
    var pickerData: [String] = [String]()
    // define total bincount
    var binTotalCount : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.countPiker.delegate = self
        self.countPiker.dataSource = self
        pickerData = ["Bin 1", "Bin 2", "Bin 3", "Bin 4", "Bin 5", "Bin 6", "Bin 7", "Bin 8"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // picker deparment for bincount
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?  {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        binTotalCount = row
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Chalkboard SE", size: 30)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerData[row]
        pickerLabel?.textColor = UIColor.black

        return pickerLabel!
    }
    
    // go next the BinColour viewController
    @IBAction func nextItem1(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binColour") as! BinColourViewController
        
        // cast total count to BinColour viewController
        newViewController.binTotalCount = self.binTotalCount
        self.present(newViewController, animated: true, completion: nil)
    }
}
