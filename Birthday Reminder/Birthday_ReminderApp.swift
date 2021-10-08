//
//  Birthday_ReminderApp.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 17.09.21.
//

import SwiftUI

@main
struct Birthday_ReminderApp: App {
    @StateObject private var store = BirthdayStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
