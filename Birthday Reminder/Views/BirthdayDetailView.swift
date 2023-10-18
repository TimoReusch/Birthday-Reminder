//
//  BirthdayDetailView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 23.12.21.
//

import SwiftUI

struct BirthdayDetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String
    @State var date: Date
    @State var notes: String
    
    var body: some View {
        Form{
            TextField("Name", text: $name)
            DatePicker("Birthday",
                       selection: $date,
                       displayedComponents: [.date])
            Section(header: Text("Notes".localized())){
                ZStack {
                    TextEditor(text: $notes)
                    Text(notes).opacity(0).padding(.all, 8) // <- This will solve the issue if it is in the same ZStack
                }
            }
        }
        .navigationTitle(name)
    }
}
