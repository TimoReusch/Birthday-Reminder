//
//  BirthdayCell.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 07.10.21.
//

import SwiftUI

struct BirthdayCell: View {
    var birthday: Birthday
    
    var body: some View {
        VStack(alignment: .leading){
            Text(birthday.name)
            Text("\(Image(systemName: "gift")) \(birthday.date)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct BirthdayCell_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayCell(birthday: testData[0])
    }
}
