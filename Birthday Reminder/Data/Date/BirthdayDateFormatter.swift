//
//  BirthdayDateFormatter.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 13.10.21.
//

import Foundation

func birthdayDateFormatter(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d. MMM yyyy"
    return dateFormatter.string(from: date)
}
