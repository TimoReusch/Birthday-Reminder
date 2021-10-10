//
//  BirthdayDetail.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 18.09.21.
//

import SwiftUI

struct BirthdayDetail: View {
    
    
    var birthday: Birthday
    @State private var name: String
    @State private var date: Date
    @State private var notes: String
    
    init(birthday: Birthday) {
        self.birthday = birthday
        self._name = State(initialValue: birthday.name)
        self._date = State(initialValue: birthday.date)
        self._notes = State(initialValue: birthday.notes)
    }
    
    var body: some View {
        Form{
            TextField("Name", text: $name)
            DatePicker("Birthday",
                       selection: $date,
                       displayedComponents: [.date])
            Section(header: Text("Notes")){
                TextEditor(text: $notes)
            }
            Section{
                Button("Save"){
                    //
                }
            }
        }
        .navigationTitle(birthday.name)
    }
}

struct BirthdayDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            BirthdayDetail(birthday: testData[0])
        }
    }
}
