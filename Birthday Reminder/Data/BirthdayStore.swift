//
//  BirthdayStore.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 18.09.21.
//

import Foundation

class BirthdayStore: ObservableObject {
    @Published var birthdays: [Birthday]
    
    init(birthdays: [Birthday] = []){
        self.birthdays = birthdays
    }
}

let testStore = BirthdayStore(birthdays: testData)
