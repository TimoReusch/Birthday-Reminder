//
//  Persistence.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 23.12.21.
//

import Foundation
import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "birthdayModel")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved Error \(error)")
            }
        }
    }
}
