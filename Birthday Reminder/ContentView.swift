//
//  ContentView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 17.09.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: BirthdayStore
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.birthdays){ birthday in
                    NavigationLink(destination: BirthdayDetail(birthday: birthday)){
                        BirthdayCell(birthday: birthday)
                    }
                }
                .onDelete(perform: deleteBirthdays)
            }
            .navigationTitle("Birthdays")
            
            .toolbar{
                ToolbarItemGroup(placement:
                                    ToolbarItemPlacement .navigationBarLeading){
                    EditButton()
                }
                ToolbarItemGroup(placement:
                                    ToolbarItemPlacement .navigationBarTrailing){
                    Button(action: {
                        showingSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingSheet) {
                        if #available(iOS 15.0, *) {
                            AddBirthdaySheet()
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                }
                
            }
            // Only shown on iPad and macOS
            Text("Select a birthday")
                .font(.largeTitle)
                .foregroundColor(.secondary)
        }
    }
    
    func addBirthday() {
        
    }
    
    func moveBirthdays(from: IndexSet, to: Int) {
        withAnimation {
            store.birthdays.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteBirthdays(offsets: IndexSet) {
        withAnimation {
            store.birthdays.remove(atOffsets: offsets)
        }
    }
    
}

@available(iOS 15.0, *)
struct AddBirthdaySheet: View {
    @Environment(\.dismiss) var dismiss
    
    @State var username: String = ""
    @State private var dateChosen = Date()
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    TextField("Name", text: $username)
                    DatePicker(selection: $dateChosen, in: ...Date(), displayedComponents: .date) {
                        Text("Birthday:")
                    }
                }
            }
            .navigationBarTitle(Text("Add Birthday"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(action:{
                    dismiss()
                }) {
                    Text("Quit").bold()
                },
                trailing: Button(action: {
                dismiss()
            }) {
                Text("Save").bold()
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}
