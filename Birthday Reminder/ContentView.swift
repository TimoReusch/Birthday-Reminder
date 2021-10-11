//
//  ContentView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 17.09.21.
//

import SwiftUI

struct ContentView: View {
    var birthdayStore = BirthdayStore()
    
    var body: some View {
        TabView{
            HomeView(birthdayStore: birthdayStore)
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(birthdayStore: testStore)
    }
}
