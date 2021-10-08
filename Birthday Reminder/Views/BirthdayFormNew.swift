//
//  BirthdayFormNew.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 09.10.21.
//

import SwiftUI

struct BirthdayFormNew: View {
    
    @State private var name: String = ""
    @State private var dateChosen: Date = Date()
    
    var body: some View {
        Form{
            TextField("Name", text: $name)
            DatePicker(selection: $dateChosen, in: ...Date(), displayedComponents: .date) {
                Text("Birthday:")
            }
            Section {
                Button("Save") {
                    // do nothing
                }
            }
        }
    }
}

struct BirthdayFormNew_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayFormNew()
    }
}
