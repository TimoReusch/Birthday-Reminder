//
//  BirthdayFormEdit.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 09.10.21.
//

import SwiftUI

struct BirthdayFormEdit: View {
    init(){
        
    }
    @State private var dateChosen: Date = Date()
    @State private var presentIdea: String = ""
    
    var body: some View {
        Form{
            DatePicker(selection: $dateChosen, in: ...Date(), displayedComponents: .date) {
                Text("Birthday:")
            }
            Section(header: Text("Present Ideas")) {
                TextField("Present Ideas", text: $presentIdea)
            }
            Section {
                Button("Save") {
                    // activate theme!
                }
            }
        }
    }
}

struct BirthdayFormEdit_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayFormEdit()
    }
}
