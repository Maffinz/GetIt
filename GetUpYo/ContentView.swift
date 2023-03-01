//
//  ContentView.swift
//  GetUpYo
//
//  Created by William Hernandez on 2/17/23.
//

import SwiftUI


struct ContentView: View {
    // Notification Initi
    let notificationServiceAgent = NotificationService()
    
    @State private var typeOfMessage = 0
    @State private var timePicker = Date()
    let typeOfMessages = ["Direct", "Indirect", "Quote"]
    
    var body: some View {
        TabView {
//          Home
            VStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
//          Contribute
            VStack{
                ContributeView()
            }
            .tabItem{
                Image(systemName: "square.and.pencil")
                Text("Contribute")
            }
    
//          Stats
            VStack {
                StatsView()
            }
            .tabItem {
                Image(systemName: "chart.line.uptrend.xyaxis")
                Text("Stats")
            }
//          Profile
            VStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.circle.fill")
                Text("Profile")
            }
        }
        .accentColor(.blue)
        
//        VStack(spacing: 20) {
//
//            // User Information
//            VStack(alignment: .leading, spacing: 10){
//                // Prompt
//                HStack{
//                    Text("Welcome back")
//                        .bold()
//                    Text("William")
//                }
//                // username and account status
//                HStack(spacing: 20){
//                    HStack{
//                        Text("Username: ")
//                        Text("Maffinz")
//                            .bold()
//                            .italic()
//                    }
//                    HStack{
//                        Text("Status: ")
//                        Text("Premium")
//                            .bold()
//                            .italic()
//                    }
//                }
//                // Date Joined
//                HStack{
//                    Text("Date Joined: ")
//                    Text("Feb 28, 2023")
//                        .italic()
//                }
//
//            }
//            .frame(maxWidth: .infinity)
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(10)
//
//            // Content (Notification Set Up
//            VStack(spacing: 20){
//
//                // Current Notification Set Up
//                VStack(alignment: .leading, spacing: 10){
//                    HStack(spacing: 20){
//                        Text("Type")
//                        Text("Time")
//                        Button("Modify", action: {})
//                        Button("Remove", action: {})
//                    }
//                    HStack{
//                        Picker(selection: $typeOfMessage, label: Text("Type of Message")){
//                            ForEach(0..<typeOfMessages.count){
//                                Text(self.typeOfMessages[$0])
//                            }
//                        }
//                        DatePicker("", selection: $timePicker, displayedComponents: .hourAndMinute)
//                            .labelsHidden()
//
//                        Button("Add", action: {notificationServiceAgent.addUserPreferenceNotification(type: typeOfMessage, time: timePicker)})
//                    }
//                    .pickerStyle(MenuPickerStyle())
//                }
//
//            }
//            .frame(maxWidth: .infinity)
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(10)
//
//
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

