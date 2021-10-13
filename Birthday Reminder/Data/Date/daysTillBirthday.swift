//
//  daysTillBirthday.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 13.10.21.
//

import Foundation

let calendar = Calendar.current

func daysTillBirthday(date: Date) -> Int {
    let today: Date = Date()
    
    // Create a new birthday-date with the current year
    let birthdayWithCurrentYear = createNewDate(startDate: date, targetYear: today)
    
    // Calculate the days between the new date and today
    let daysBetween = calculateDays(date: birthdayWithCurrentYear, today: today)
    
    // If they are positive, the birhtday has not taken place yet
    if(daysBetween >= 0){
        return daysBetween
    }
    // If not, we calculate the days till next year
    else{
        let birthdayNextYear = Calendar.current.date(byAdding: .year, value: 1, to: birthdayWithCurrentYear)!
        return calculateDays(date: birthdayNextYear, today: today)
    }
}

private func createNewDate(startDate: Date, targetYear: Date) -> Date{
    var component = calendar.dateComponents([.year, .month, .day], from: startDate)
    component.year = calendar.component(.year, from: targetYear)
    return calendar.date(from: component)!
}

private func calculateDays(date: Date, today: Date) -> Int{
    let days = calendar.dateComponents([.day], from: today, to: date)
    return days.day!
}
