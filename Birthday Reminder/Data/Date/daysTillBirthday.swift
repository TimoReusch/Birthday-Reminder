//
//  daysTillBirthday.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 13.10.21.
//

import Foundation
import SwiftUI

let calendar = Calendar.current

func daysTillBirthdayExact(date: Date) -> Text{
    
    let today: String = "Today".localized();
    let tomorrow: String = "Tomorrow".localized();
    let days: String = "Days".localized();
    
    let birthdayToday: Bool = isBirthdayToday(date: date)
    let daysTillBirthday: Int = daysTillBirthday(date: date)
    let image: Image = Image(systemName: "clock")
    
    if(birthdayToday == false && daysTillBirthday == 0){
        return Text("\(image) \(tomorrow) 🎈")
    } else if(birthdayToday == true && daysTillBirthday == 0){
        return Text("\(image) \(today) 🥳").foregroundColor(.red)
    }
    
    return Text("\(image) \(daysTillBirthday) \(days)")
}

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
