//
//  FloatingActionButton.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 27.12.21.
//

import SwiftUI

struct FloatingActionButton: View {
    var body: some View {
        ZStack{
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    })
                        .padding()
                        .shadow(radius: 2)
                }
            }
        }
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton()
    }
}
