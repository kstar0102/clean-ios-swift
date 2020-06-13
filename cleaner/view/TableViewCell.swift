//
//  TableViewCell.swift
//  cleaner
//
//  Created by Admin on 03/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cycleLb: UILabel!
    @IBOutlet weak var binMonth: UILabel!
    @IBOutlet weak var binday: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    internal func initData(todoData: BinData, section: Int, ind: Int) {


        cycleLb.text = config.cycleIndex[Int(todoData.bincycle!)!];
        

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd:HH"

        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "d"
        binday.text = formatter.string(from: todoData.binDate!)
        
        formatter.dateFormat = "LLLL"
        binMonth.text = formatter.string(from: todoData.binDate!)
    }

    
}
