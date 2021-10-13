//
//  isBirthdayToday.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 13.10.21.
//

import Foundation

func isBirthdayToday(date: Date) -> String{
    let calendar = Calendar.current
    let today = Date()
    
    // Extract the components of the dates
    let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    let todayComponents = calendar.dateComponents([.year, .month, .day], from: today)
    
    // Check if the dates are in the same month and day
    let isSameMonth = dateComponents.month == todayComponents.month
    let isSameDay = dateComponents.day == todayComponents.day
    
    if((isSameMonth && isSameDay) == true){
        return "True"
    }
    return "False"
}
