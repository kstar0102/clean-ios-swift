//
//  config.swift
//  cleaner
//
//  Created by Admin on 03/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class config: NSObject {
    static let TodoColors = [
       "red",
       "DCFF29",
       "34C759",
       "000000",
       "8E8E93",
       "A2845E",
       "5856D6",
       "F2F2F7"]
    
    static let cycleIndex = [
    "Weekly",
    "Fortnight",
    "Every 3 weeks",
    "Every 4 weeks"]
    
    static let binImage = [
    "Red Bin",
    "Yellow Bin",
    "Green Bin",
    "Black Bin",
    "Blue Bin",
    "Brown Bin",
    "Purple Bin",
    "White bin"]
    
    static func calcDate(baseDate:Date ) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateStr = formatter.string(from: baseDate)
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.date(from: dateStr)!
    }
}
