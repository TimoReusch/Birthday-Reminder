//
//  HomeView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 12.10.21.
//

import SwiftUI

struct HomeView: View{
    
    @ObservedObject var birthdayStore = BirthdayStore()
    @State private var showingSheet = false
    @State private var searchText: String = ""
    
    var filteredBirthdays: [Birthday]{
        if (searchText == ""){
            return birthdayStore.birthdays
        }
        let filtered = birthdayStore.birthdays.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
        if(!filtered.isEmpty){
            return filtered
        } else {
            return birthdayStore.birthdays
        }
    }
    
    var body: some View{
        NavigationView{
            List{
                if #available(iOS 15.0, *) {
                    ForEach(filteredBirthdays){ birthday in
                        NavigationLink(destination: BirthdayDetail(birthday: self.$birthdayStore.birthdays[self.birthdayStore.birthdays.firstIndex(of: birthday)!])){
                            VStack(alignment: .leading){
                                Text(birthday.name)
                                HStack{
                                    Text("\(Image(systemName: "gift")) \( birthdayDateFormatter(date: birthday.date))")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text("\(Image(systemName: "clock")) \( daysTillBirthday(date: birthday.date)) Days")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .searchable(text: $searchText)
                    }
                    .onDelete(perform: deleteBirthdays)
                } else {
                    // Fallback on earlier versions
                }
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(birthdayStore: testStore)
            .preferredColorScheme(.dark)
    }
}
