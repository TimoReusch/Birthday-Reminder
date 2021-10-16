//
//  Birthday.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 18.09.21.
//

import Foundation

struct Birthday: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var date: Date
    var daysTillBirthday: Int = 0
    var notes: String = ""
    
    static func == (lhs: Birthday, rhs: Birthday) -> Bool {
        return
            lhs.id == rhs.id
    }
}

let testData = [
    Birthday(name: "Cosi", date: createDate(year: 1999, month: 12, day: 20)),
    Birthday(name: "Laura", date: createDate(year: 2000, month: 2, day: 15), notes: "Chocolate"),
    Birthday(name: "Patrick", date: createDate(year: 1999, month: 8, day: 29)),
    Birthday(name: "Carl", date: Date()),
    Birthday(name: "Tom", date: createDate(year: 2021, month: 12, day: 31))
]

private func createDate(year: Int, month: Int, day: Int)->Date{
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    
    return Calendar.current.date(from: components)!
}
