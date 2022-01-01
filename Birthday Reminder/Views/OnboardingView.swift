//
//  OnboardingView.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 26.12.21.
//

import SwiftUI
import UserNotifications

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        
        TabView{
            VStack{
                Spacer()
                LottieView(filename: "birthdayAnimation", loop: true).frame(height: 300, alignment: .center)
                Text("Hey!")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                    .font(.title)
                Text("So great to meet you!".localized())
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom)
                
                Text("Birthday Reminder helps you to never forget a birthday again - store all your friends most important day in one place with ease. Plus, there is also room for present ideas.".localized())
                    .padding()
                Spacer()
            }
            VStack{
                Spacer()
                LottieView(filename: "dataPrivacyAnimation", loop: false).frame(height: 300, alignment: .center)
                Text("Yours is yours.".localized())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                    .font(.title)
                Text("Data Privacy".localized())
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom)
                
                Text("We do not have access to your data at any time. Everything is stored on your own device, and should you ever loose it or switch to a new one - a backup is automatically created in your iCloud. This also allows you to use the app on all your Apple-Devices.".localized())
                    .padding()
                Spacer()
            }
            VStack{
                Spacer()
                LottieView(filename: "notificationAnimation", loop: false).frame(height: 300, alignment: .center)
                Text("We will remind you!".localized())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                    .font(.title)
                Text("Notifications".localized())
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom)
                
                Text("To remind you of your friends birthdays, we would like to send you notifications. Just click on the button below.".localized())
                    .padding()
                if #available(iOS 15.0, *) {
                    Button("Allow notifications".localized()){
                        NotificationManager.instance.requestAuthorization()
                        shouldShowOnboarding.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                } else {
                    // Fallback on earlier versions
                }
                Button("Nah, don't want any notifications".localized()){ shouldShowOnboarding.toggle() }
                Spacer()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
