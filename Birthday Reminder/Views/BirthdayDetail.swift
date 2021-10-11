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
                TextEditor(text: $birthday.notes)
            }
            Section{
                Button("Save"){
                    if(!birthday.name.elementsEqual(self.birthday.name)){
                        birthday.name = self.birthday.name
                    }
                    if(birthday.date != self.birthday.date){
                        birthday.date = self.birthday.date
                    }
                    if(!birthday.notes.elementsEqual(self.birthday.notes)){
                        birthday.notes = self.birthday.notes
                    }
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
