//
//  HomeView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 23.12.21.
//

import SwiftUI
import Lottie

struct HomeView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(entity: Birthday.entity(), sortDescriptors: [ NSSortDescriptor(key: "name", ascending: true) ])
    private var birthdays: FetchedResults<Birthday>
    
    @State private var showingAddBirthday = false
    
    @State private var searchQuery: String = ""
    
    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView{
                VStack{
                    if(birthdays.isEmpty){
                        VStack{
                            LottieView(filename: "birthdayAnimation", loop: true).frame(height: 300, alignment: .center)
                            Text("Nothing here yet. Click on the \"\(Image(systemName: "plus"))\" to add a birthday.")
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                    } else{
                        List {
                            ForEach(birthdays, id: \.self) { currentBirthday in
                                NavigationLink(destination: BirthdayDetailView(name: currentBirthday.name ?? "", date: currentBirthday.date ?? Date(), notes: currentBirthday.notes ?? "")){
                                    VStack(alignment: .leading){
                                        Text(currentBirthday.name ?? "No name")
                                        if(isBirthdayToday(date: currentBirthday.date!)){
                                            Text("has his/her special day today! 🥳")
                                                .font(.subheadline)
                                                .foregroundColor(.red)
                                        }
                                            HStack{
                                                Text("\(Image(systemName: "gift")) \( birthdayDateFormatter(date: currentBirthday.date ?? Date()))")
                                                    .font(.subheadline)
                                                    .foregroundColor(.secondary)
                                                Text("\(Image(systemName: "clock")) \( daysTillBirthday(date: currentBirthday.date ?? Date())) Days")
                                                    .font(.subheadline)
                                                    .foregroundColor(.secondary)
                                            }
                                        
                                    }
                                }
                            }.onDelete(perform: deleteBirthday)
                        }
                    }
                }
                .navigationTitle("Birthdays")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(action: {
                        self.showingAddBirthday.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    }))
                .sheet(isPresented: $showingAddBirthday) {
                    AddBirthdayView().environment(\.managedObjectContext, self.moc)
                }
            }
            .searchable(text: $searchQuery, prompt: "Search for name")
            .onChange(of: searchQuery) { newValue in
                birthdays.nsPredicate = searchPredicate(query: newValue)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func searchPredicate(query: String) -> NSPredicate? {
        if query.isEmpty { return nil }
        return NSPredicate(format: "%K BEGINSWITH[cd] %@",
                           #keyPath(Birthday.name), query)
    }

    private func deleteBirthday(offsets: IndexSet){
        withAnimation{
            offsets.forEach{ (i) in
                NotificationManager.instance.removeNotification(identifier: birthdays[i].identifier!)
                moc.delete(birthdays[i])
            }
            saveContext()
        }
    }

    private func updateBirthday(_ birthday: FetchedResults<Birthday>.Element){
        withAnimation{
            // Code here
            saveContext()
        }
    }

    private func saveContext(){
        do{
            try moc.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error while saving: \(error)")
        }
    }
}
