//
//  NSDate+Extension.swift
//  TrustNote
//
//  Created by zenghailong on 2018/4/21.
//  Copyright © 2018年 org.trustnote. All rights reserved.
//

import Foundation

let minute = 60
let hour = 60 * 60
let day = 24 * 60 * 60
let month = 30 * 24 * 60 * 60
let year = 12 * 30 * 24 * 60 * 60

extension NSDate {

    static func getCurrentFormatterTime() -> String {
        let nowDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: nowDate)
    }
    
    static func getDateFromIntervalTime(timeStamp: String) -> String {
        
        let timeInterval: TimeInterval = TimeInterval(timeStamp)!
        let date = NSDate(timeIntervalSince1970: timeInterval)
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        return  dformatter.string(from: date as Date)
    }
    
    static func getTimeStampFromFormatTime(time: String) -> Int64 {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let date = formatter.date(from: time)
        let dateStamp: TimeInterval = date!.timeIntervalSince1970
        return Int64(dateStamp)
    }
    
    static func compareDateTime(timeStamp: Int64) -> String {
        let timeInterval: TimeInterval = TimeInterval(timeStamp)
        let date = NSDate(timeIntervalSince1970: timeInterval) as Date
        let now = Date()
        let interval = Int(now.timeIntervalSince(date))
        if now.compare(date) == .orderedAscending {
            return "a minute ago"
        }
        if interval < 60 * minute {
            if interval / minute < 1 || interval / minute == 1 {
                return "a minute ago"
            }
           return String(format:"%d minute ago", arguments:[interval / minute])
        } else if interval < 24 * hour {
            if interval / hour < 1 || interval / hour == 1 {
                return "a hour ago"
            }
            return String(format:"%d hours ago", arguments:[interval / hour])
        } else if interval < 30 * day {
            if interval / day < 1 || interval / day == 1 {
                return "a day ago"
            }
            return String(format:"%d days ago", arguments:[interval / day])
        } else if interval < 12 * month {
            if interval / month < 1 || interval / month == 1 {
                return "a month ago"
            }
            return String(format:"%d months ago", arguments:[interval / month])
        } else {
            if interval / year < 1 || interval / year == 1 {
                return "a year ago"
            }
            return String(format:"%d years ago", arguments:[interval / year])
        }
    }
}
