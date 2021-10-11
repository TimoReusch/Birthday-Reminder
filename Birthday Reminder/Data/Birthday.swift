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
    var date: Date
    var notes: String = ""
}

extension Birthday: Equatable {
    static func == (lhs: Birthday, rhs: Birthday) -> Bool {
        return
            lhs.id == rhs.id
    }
}

let testData = [
    Birthday(name: "Laura", date: Date(), notes: "Chocolate"),
    Birthday(name: "Timo", date: Date())
]

