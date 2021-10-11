//
//  BirthdayDetail.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 18.09.21.
//

import SwiftUI

struct BirthdayDetail: View {
    
    @Binding var birthday: Birthday
    
    var body: some View {
        Form{
            TextField("Name", text: $birthday.name)
            DatePicker("Birthday",
                       selection: $birthday.date,
                       displayedComponents: [.date])
            Section(header: Text("Notes")){
                ZStack {
                    TextEditor(text: $birthday.notes)
                    Text(birthday.notes).opacity(0).padding(.all, 8) // <- This will solve the issue if it is in the same ZStack
                }
            }
        }
        .navigationTitle(birthday.name)
    }
}

struct BirthdayDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            BirthdayDetail(birthday: .constant(Birthday(name: "Laura", date: Date())))
        }
    }
}
