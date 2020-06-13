//
//  LocalNotification.swift
//  cleaner
//
//  Created by Admin on 05/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class LocalNotification: NSObject {
    static func addNotificaion(title: String, id: String, time: TimeInterval, state: String) {
    if time <= 0 {
        return
    }
    let delegateObj = AppDelegate.instance();
    // Notification のインスタンス作成
    let content = UNMutableNotificationContent() // Содержимое уведомления

    let categoryIdentifire = "Delete Notification Type"
    
    // タイトル、本文の設定
    let titleText = title
    content.title = "\(String(describing: titleText))"
    content.body = "The \(String(describing: titleText)) deadline is approaching。"
    content.sound = UNNotificationSound.default
    content.badge = 1
    content.categoryIdentifier = categoryIdentifire
    
        if(state == "before"){
            let oneDayTime = time - 86400
            print(" one day time \(oneDayTime)")
            if oneDayTime > 0 {
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time-86400, repeats: false)
                let request = UNNotificationRequest.init(identifier: id, content: content, trigger: trigger)
                delegateObj.notificationCenter.add(request) { (error) in
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                }
            }
        }
        
        if(state == "on"){
            let oneDayTime = time
            print(" one day time \(oneDayTime)")
            if oneDayTime > 0 {
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                let request = UNNotificationRequest.init(identifier: id, content: content, trigger: trigger)
                delegateObj.notificationCenter.add(request) { (error) in
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                }
            }
        }
    
    let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
    let deleteAction = UNNotificationAction(identifier: "DeleteAction", title: "Delete", options: [.destructive])
    let category = UNNotificationCategory(identifier: categoryIdentifire,
                                          actions: [snoozeAction, deleteAction],
                                          intentIdentifiers: [],
                                          options: [])
    
    delegateObj.notificationCenter.setNotificationCategories([category])
    }

}
