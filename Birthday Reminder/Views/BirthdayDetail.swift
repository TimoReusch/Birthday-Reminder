//
//  BirthdayDetail.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 18.09.21.
//

import SwiftUI

struct BirthdayDetail: View {
    
    let birthday: Birthday
    @State private var username: String = ""
    @State private var dateChosen: Date = Date()
    
    
    var body: some View {
        BirthdayFormEdit()
        .navigationTitle(birthday.name)
    }
}

struct BirthdayDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            BirthdayDetail(birthday: testData[0])
        }
    }
}
