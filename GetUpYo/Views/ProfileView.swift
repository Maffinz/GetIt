//
//  ProfileView.swift
//  GetUpYo
//
//  Created by William Hernandez on 2/28/23.
//

import SwiftUI

struct ProfileView: View{
    var body: some View{
        // Profile Card
        VStack {
                    // Profile card
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                        Text("John Doe")
                            .font(.headline)
                        Text("@JhonDoe1")
                            .font(.subheadline)
                    }
                    .padding()
                    
                    Divider()
                    
                    // Setting options card
                    List {
                        NavigationLink(destination: Text("Account Settings")) {
                            Label("Account Settings", systemImage: "person.crop.circle")
                        }
                        NavigationLink(destination: Text("Privacy")) {
                            Label("Privacy", systemImage: "lock.shield")
                        }
                        NavigationLink(destination: Text("Notifications")) {
                            Label("Notifications", systemImage: "bell")
                        }
                    }
                }
                .navigationTitle("Profile")
        
    }
}
