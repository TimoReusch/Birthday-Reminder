//
//  BirthdayDate.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 18.09.21.
//

import Foundation

struct BirthdayDate{
    private var date: Date
    
    init(day: Int, month: Int, year: Int){
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        
        let userCalendar = Calendar(identifier: .gregorian)
        self.date = userCalendar.date(from: components) ?? Date()
    }
    
    public func getString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.formatterBehavior = .behavior10_4
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    public func get() -> Date {
        return date
    }
    
}
