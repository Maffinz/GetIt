//
//  ContributeView.swift
//  GetUpYo
//
//  Created by William Hernandez on 2/28/23.
//

import SwiftUI

struct ContributeView: View {
    @State private var text = ""
    @State private var author = ""
    @State private var misc = ""
    @State private var selectedGroupIndex = 0
    
    let groups = ["Direct", "Suggestion", "Quote"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Quote")) {
                    TextField("Quote", text: $text)
                    TextField("Author", text: $author)
                    TextField("Misc (Movie, Song, Experience)", text: $misc)
                }
                
                VStack {
                            Picker(selection: $selectedGroupIndex, label: Text("Select Group")) {
                                ForEach(0..<groups.count) { index in
                                    Text(self.groups[index]).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())

                        }
                
                Section {
                    Button(action: saveData) {
                        Text("Save")
                    }
                    Button(action: saveData) {
                        Text("Save and Share")
                    }
                }
                
                Text("Note: Share allows others users to get the quote you wrote!\n\nShare To Inspire Others!")
                    .italic()
            }
            .navigationTitle("Contribute")
        }
    }
    
    func saveData() {
        let newData = DataModel(text: text, author: author, misc: misc)
        // Do something with the new data, based on the selected group
        switch selectedGroupIndex {
        case 0:
            // Add data to Group 1
            print("Adding data to Group 1")
        case 1:
            // Add data to Group 2
            print("Adding data to Group 2")
        case 2:
            // Add data to Group 3
            print("Adding data to Group 3")
        default:
            break
        }
        
        // Clear the text fields after saving
        text = ""
        author = ""
        misc = ""
    }
}

struct DataModel {
    let text: String
    let author: String
    let misc: String
}
