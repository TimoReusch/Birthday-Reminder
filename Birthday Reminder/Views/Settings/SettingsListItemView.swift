//
//  SettingsListItem.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 27.12.21.
//

import SwiftUI

struct SettingsListItemText: View {
    var title: String
    var color: Color
    var icon: String
    var value: String
    
    var body: some View {
        HStack{
            element(title: title, color: color, icon: icon)
            Text(value)
        }
    }
}

struct SettingsListItemWebsite: View {
    var title: String
    var color: Color
    var icon: String
    var link: String
    
    var body: some View {
        HStack{
            element(title: title, color: color, icon: icon)
            Button(action: {
                // Open link
                guard let url = URL(string: self.link),
                      UIApplication.shared.canOpenURL(url) else {
                          return
                      }
                UIApplication.shared.open(url as URL)
            }) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            }
            .accentColor(Color(.systemGray2))
        }
    }
}

private struct element: View{
    var title: String
    var color: Color
    var icon: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(color)
            Image(systemName: icon)
                .foregroundColor(Color.white)
        }
        .frame(width: 36, height: 36, alignment: .center)
        Text(title).foregroundColor(Color.gray)
        Spacer()
    }
}
