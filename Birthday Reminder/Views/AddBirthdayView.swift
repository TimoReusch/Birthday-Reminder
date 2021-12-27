//
//  AddBirthday.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 09.10.21.
//

import SwiftUI

@available(iOS 15.0, *)
struct AddBirthdayView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    
    @State private var name: String = ""
    @State private var date: Date = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Name", text: $name)
                DatePicker("Birthday",
                           selection: $date,
                           displayedComponents: [.date])
                Section {
                    Button("Save") {
                        // Save the object
                        if self.name.isEmpty {
                            // Show alert, if the name is empty
                            self.showingAlert = true
                        } else {
                            let birthday = Birthday(context: self.moc)
                            
                            birthday.identifier = UUID()
                            
                            birthday.name = self.name
                            birthday.date = self.date
                            
                            if self.moc.hasChanges {
                                try? self.moc.save()
                            }
                            
                            NotificationManager.instance.scheduleBirthdayReminder(identifier: birthday.identifier!, name: self.name, date: self.date, debugging: false)
                            
                            // Dismiss modal
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
                .navigationBarTitle(Text("Add Birthday"), displayMode: .inline)
                .navigationBarItems(
                    trailing: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel").bold()
                    })
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error Saving"), message: Text("Name can not be emtpy."), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
