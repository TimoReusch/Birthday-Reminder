//
//  SettingsView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 12.10.21.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var showLegalScreen = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("For developers".localized())){
                        SettingsListItemText(title: "Version", color: Color.black, icon: "number", value: "\(Bundle.main.appVersionShort)")
                        SettingsListItemWebsite(title: "GitHub", color: Color.black, icon: "chevron.left.forwardslash.chevron.right",  link: "https://github.com/TimoReusch/Birthday-Reminder")
                        SettingsListItemWebsite(title: "Report a bug".localized(), color: Color.black, icon: "ladybug.fill", link: "https://github.com/TimoReusch/Birthday-Reminder/issues/new")
                    }
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                Button(action: {
                    self.showLegalScreen.toggle()
                }
                       , label: { Text("Legal".localized())}
                )
                    .buttonStyle(.plain)
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            }
            .sheet(isPresented: $showLegalScreen){
                LegalView().environment(\.managedObjectContext, self.moc)
            }
            .navigationTitle("Settings".localized())
            .navigationBarItems(
                trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel".localized()).bold()
                })
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

extension Bundle {
    
    public var appVersionShort: String {
        if let result = infoDictionary?["CFBundleShortVersionString"] as? String {
            return result
        } else {
            return "⚠️"
        }
    }
}
