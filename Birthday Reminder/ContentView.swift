//
//  ContentView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 17.09.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var birthdayStore = BirthdayStore()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(birthdayStore.birthdays){ birthday in
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
                        addBirthday()
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingSheet) {
                        if #available(iOS 15.0, *) {
                            AddBirthday(birthdayStore: birthdayStore)
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
        //self.store.birthdays.append(Birthday(name: "dennis", date: ""))
    }
    
    func moveBirthdays(from: IndexSet, to: Int) {
        withAnimation {
            birthdayStore.birthdays.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteBirthdays(offsets: IndexSet) {
        withAnimation {
            birthdayStore.birthdays.remove(atOffsets: offsets)
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(birthdayStore: testStore)
            .preferredColorScheme(.light)
    }
}
