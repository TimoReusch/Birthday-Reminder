//
//  Birthday.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 18.09.21.
//

import Foundation

struct Birthday: Identifiable {
    var id = UUID()
    var name: String
    var date: String
}

let testData = [
    Birthday(name: "Laura", date: BirthdayDate(day: 15, month: 2, year: 2000).getString()),
    Birthday(name: "Timo", date: BirthdayDate(day: 14, month: 2, year: 2000).getString())
]

