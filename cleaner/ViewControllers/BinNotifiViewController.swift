//
//  BinNotifiViewController.swift
//  cleaner
//
//  Created by Admin on 01/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData

class BinNotifiViewController: UIViewController {
    private var notifiData:[BinData] = []
    @IBOutlet weak var timeNotifi: UIDatePicker!
    private var hour: Int = 0
    private var minute:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // datepicker translate to timepicker
        self.timeNotifi.datePickerMode = .time
        
        // get each date from database
        notifiData = DatabaseManager.getBinDatas()
    }
    
    // before day
    @IBAction func beforebtn(_ sender: Any) {
        // date formatter
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        for i in 0..<notifiData.count{
            var components = gregorian.components([.year, .month, .day, .hour, .minute, .second], from: notifiData[i].binDate!)
            components.hour = self.hour
            components.minute = self.minute
            components.second = 0
            let date = gregorian.date(from: components)!
            let timeInterval = date.timeIntervalSince(config.calcDate(baseDate: Date()))
               if timeInterval != nil {
                if timeInterval > 0{
                    
                    // save data for the notification
                    LocalNotification.addNotificaion(title: notifiData[i].colourIndex!, id: notifiData[i].colourIndex! + notifiData[i].bincycle! + String(i) + "before", time: timeInterval, state: "before")
                   }
               }
        }
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binTable") as! BinTableViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func daybtn(_ sender: Any) {
        // date formatter
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        for i in 0..<notifiData.count{
            var components = gregorian.components([.year, .month, .day, .hour, .minute, .second], from: notifiData[i].binDate!)
            components.hour = self.hour
            components.minute = self.minute
            components.second = 0
            let date = gregorian.date(from: components)!
            let timeInterval = date.timeIntervalSince(config.calcDate(baseDate: Date()))
               if timeInterval != nil {
                if timeInterval > 0{
                    
                    //save data for the notification
                    LocalNotification.addNotificaion(title: notifiData[i].colourIndex!, id: notifiData[i].colourIndex! + notifiData[i].bincycle! + String(i) + "before", time: timeInterval, state: "on")
                   }
               }
        }
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "binTable") as! BinTableViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    // selected the time for notification
    @IBAction func changeTime(_ sender: Any) {
        //date = self.timeNotifi.date
        self.timeNotifi.datePickerMode = .time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        let components = Calendar.current.dateComponents([.hour, .minute], from: self.timeNotifi.date)
        self.hour = components.hour!
        self.minute = components.minute!
    }
}
