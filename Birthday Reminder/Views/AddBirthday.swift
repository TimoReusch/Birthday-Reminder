//
//  AddBirthday.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 09.10.21.
//

import SwiftUI

@available(iOS 15.0, *)
struct AddBirthday: View {
    
    var birthdayStore: BirthdayStore
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Name", text: $name)
                DatePicker("Birthday",
                           selection: $date,
                           displayedComponents: [.date])
                Section{
                    Button("Save"){
                        birthdayStore.birthdays.append(Birthday(name: self.name, date: self.date))
                        dismiss()
                    }
                }
            }
            .navigationBarTitle(Text("Add Birthday"), displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: {
                dismiss()
            }) {
                Text("Cancel").bold()
            })
        }
    }
}

struct AddBirthday_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            AddBirthday(birthdayStore: testStore)
        } else {
            // Fallback on earlier versions
        }
    }
}
