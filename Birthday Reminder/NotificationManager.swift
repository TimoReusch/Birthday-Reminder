//
//  NotificationHandler.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 26.12.21.
//

import Foundation
import UserNotifications

class NotificationManager{
    static let instance = NotificationManager() // Singleton
    
    let center: UNUserNotificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization(){
        // Ask for permission to send notifications
        center.requestAuthorization(options: [.alert, .sound, .carPlay]){
            (granted, error) in
            if let error = error{
                print("ERROR in NotificationHandler: \(error)")
            }
        }
    }
    
    func scheduleBirthdayReminder(identifier: UUID, name: String, date: Date, debugging: Bool) {
        let content = UNMutableNotificationContent()
        content.title = "It's \(name)s birthday! 🥳"
        content.body = "Take the chance to congrat them!"
        content.sound = .default
        
        let request: UNNotificationRequest
        
        // Trigger for testing
        if(debugging == true){
            request = UNNotificationRequest(
                identifier: identifier.uuidString,
                content: content,
                trigger: UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
            )
        } else {
            let calendar = Calendar.current

            var dateComponents = DateComponents()
            dateComponents.day = calendar.component(.day, from: date)
            dateComponents.month = calendar.component(.month, from: date)
            dateComponents.hour = 0
            dateComponents.minute = 0
            
            request = UNNotificationRequest(
                identifier: identifier.uuidString,
                content: content,
                trigger: UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            )
        }
        
        center.add(request)
        
    }
    
    func scheduleBirthdayReminder(identifier: UUID, name: String, date: Date){
        scheduleBirthdayReminder(identifier: identifier, name: name, date: date, debugging: false)
    }
    
    func removeNotification(identifier: UUID){
        let array: [String] = [identifier.uuidString]
        print(array)
        center.removeDeliveredNotifications(withIdentifiers: array)
        center.removePendingNotificationRequests(withIdentifiers: array)
    }
}
