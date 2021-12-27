//
//  SettingsView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 12.10.21.
//

import SwiftUI

struct SettingsView: View {
    @State private var test: String = ""
    
    let destinations: [String] = ["Impressum"]
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("For developers")){
                        SettingsListItemText(title: "Version", color: Color.black, icon: "number", value: "1.0.0")
                        SettingsListItemWebsite(title: "GitHub", color: Color.black, icon: "chevron.left.forwardslash.chevron.right",  link: "https://github.com/TimoReusch/Birthday-Reminder")
                        SettingsListItemWebsite(title: "Report a bug", color: Color.black, icon: "ladybug.fill", link: "https://github.com/TimoReusch/Birthday-Reminder/issues/new")
                    }
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                Button(action: {}
                       , label: { Text("Legal")}
                )
                    .buttonStyle(.plain)
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            }
            .navigationTitle("Settings")
            .background(Color("ColorFormBackground").edgesIgnoringSafeArea(.all))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
