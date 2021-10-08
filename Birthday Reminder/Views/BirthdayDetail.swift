//
//  BirthdayDetail.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 18.09.21.
//

import SwiftUI

struct BirthdayDetail: View {
    
    let birthday: Birthday
    
    var body: some View {
        VStack{
            Text("Test")
        }
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
