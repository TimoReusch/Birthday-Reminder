//
//  NSDateExtension.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 25.12.21.
//

import Foundation

extension NSDate{
    func getDaysTillBirthday() -> Int{
        return daysTillBirthday(date: self as Date)
    }
}
