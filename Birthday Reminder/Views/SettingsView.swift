//
//  SettingsView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 12.10.21.
//

import SwiftUI

struct SettingsView: View {
    @State private var test: String = ""
    var body: some View {
        NavigationView{
            Form{
                TextField("Test", text: $test)
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
