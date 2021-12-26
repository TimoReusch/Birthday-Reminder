//
//  Birthday_ReminderApp.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 17.09.21.
//

import SwiftUI

@main
struct Birthday_ReminderApp: App {
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
