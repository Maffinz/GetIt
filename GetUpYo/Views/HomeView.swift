//
//  HomeView.swift
//  GetUpYo
//
//  Created by William Hernandez on 2/28/23.
//
import SwiftUI


struct Notification: Identifiable {
    let id = UUID()
    let type: String
    let date: Date
}

struct HomeView: View {
    @State private var notifications: [Notification] = []
    @State private var showAddNotification = false
    @State private var notificationType = "direct"
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("John Doe")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    Text("Points: 1000")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            
           
            List {
                ForEach(notificationGroups.keys.sorted(), id: \.self) { key in
                    Section(header: Text(key)) {
                        ForEach(notificationGroups[key]!) { notification in
                            HStack {
                                Text(notification.date.formatted(date: .omitted, time: .shortened))
                                Text(notification.type)
                                Spacer()
                                Button(action: {
                                    showAddNotification = true
                                    notificationType = notification.type.lowercased()
                                    selectedDate = notification.date
                                    notifications.removeAll { $0.id == notification.id }
                                }) {
                                    Image(systemName: "square.and.pencil")
                                        .imageScale(.large)
                                        .foregroundColor(.blue)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                Button(action: {
                                    notifications.removeAll { $0.id == notification.id }
                                }) {
                                    Image(systemName: "trash")
                                        .imageScale(.large)
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                // do something on tap if needed
                            }
                        }
                    }
                }
            }
            
//            List {
//                ForEach(notificationGroups.keys.sorted(), id: \.self) { key in
//                    Section(header: Text(key)) {
//                        ForEach(notificationGroups[key]!) { notification in
//                            HStack {
//                                Text(notification.date.formatted(date: .omitted, time: .shortened))
//                                Text(notification.type)
//                                Spacer()
//                                Button(action: {
//                                    // Modify notification action
//                                }) {
//                                    Image(systemName: "square.and.pencil")
//                                }
//                                Button(action: {
//                                    deleteNotification(notification)
//                                }) {
//                                    Image(systemName: "trash")
//                                }
//                            }
//                        }
//                    }
//                }
//            }
            
            Button(action: { showAddNotification = true }) {
                Text("Add Notification")
            }
            .padding()
            .sheet(isPresented: $showAddNotification) {
                addNotificationView()
            }
        }
    }
    
    func deleteNotification(_ notification: Notification) {
        if let index = notifications.firstIndex(where: { $0.id == notification.id }) {
            notifications.remove(at: index)
        }
    }
    
    func addNotification() {
        let newNotification = Notification(type: notificationType.capitalized, date: selectedDate)
        notifications.append(newNotification)
        showAddNotification = false
    }
    
    func addNotificationView() -> some View {
        return VStack {
            Text("Add Notification")
                .font(.title)
                .padding()
            
            Form {
                Section(header: Text("Type")) {
                    Picker("Message Type", selection: $notificationType) {
                        Text("Direct").tag("direct")
                        Text("Suggestion").tag("suggestion")
                        Text("Quote").tag("quote")
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Time")) {
                    VStack {
                        DatePicker("Select a time", selection: $selectedDate, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                    }
                }
                
            }
            
            Button(action: addNotification) {
                Text("Add")
            }
            .padding()
        }
    }
    
    var notificationGroups: [String: [Notification]] {
        Dictionary(grouping: notifications) { $0.type }
    }
    
}






//struct HomeView: View {
//    @State private var notifications: [Notification] = []
//    @State private var showAddNotification = false
//    @State private var notificationType = NotificationType.direct
//    @State private var selectedDate = Date()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("John Doe")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(.primary)
//
//                        Text("Points: 1000")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                    }
//                    Spacer()
//                }
//                .padding()
//
//                List {
//                    ForEach(notifications) { notification in
//                        Section(header:
//                                    HStack {
//                                        Text(notification.title)
//                                            .font(.headline)
//                                            .foregroundColor(.primary)
//                                            .padding(.bottom, 5)
//                                        Spacer()
//                                        Button(action: {
//                                            editNotification(notification: notification)
//                                        }) {
//                                            Image(systemName: "pencil")
//                                        }
//                                        .buttonStyle(BorderlessButtonStyle())
//                                    }
//                                    .padding(.horizontal)
//                                    .padding(.top, 20)
//                                    .padding(.bottom, 5)
//                        ) {
//                            HStack {
//                                Image(systemName: "bell")
//                                    .foregroundColor(.blue)
//                                Text(notification.body)
//                            }
//                            .padding(.vertical, 10)
//                        }
//                    }
//                    .onDelete(perform: deleteNotification)
//                }
//                .listStyle(InsetGroupedListStyle())
//
//                Button(action: { showAddNotification = true }) {
//                    Text("Add Notification")
//                }
//                .padding()
//                .sheet(isPresented: $showAddNotification) {
//                    addNotificationView()
//                }
//            }
//            .navigationBarTitle("Notifications")
//        }
//    }
//
//    func deleteNotification(at offsets: IndexSet) {
//        notifications.remove(atOffsets: offsets)
//    }
//
//    func addNotification() {
//        let newNotification = Notification(title: notificationType.rawValue.capitalized,
//                                           body: selectedDate.formatted(date: .omitted, time: .shortened), date: selectedDate,
//                                            type: notificationType)
//        notifications.append(newNotification)
//        showAddNotification = false
//    }
//
//    func editNotification(notification: Notification) {
//        notificationType = notification.type
//        selectedDate = notification.date
//        notifications.removeAll { $0.id == notification.id }
//        showAddNotification = true
//    }
//
//    func addNotificationView() -> some View {
//        return VStack {
//            Text("Add Notification")
//                .font(.title)
//                .padding()
//
//            Form {
//                Section(header: Text("Type")) {
//                    Picker("Message Type", selection: $notificationType) {
//                        Text("Direct").tag(NotificationType.direct)
//                        Text("Suggestion").tag(NotificationType.suggestion)
//                        Text("Quote").tag(NotificationType.quote)
//                    }
//                    .pickerStyle(MenuPickerStyle())
//                }
//
//                Section(header: Text("Time")) {
//                    VStack {
//                        DatePicker("Select a time", selection: $selectedDate, displayedComponents: [.hourAndMinute])
//                            .datePickerStyle(WheelDatePickerStyle())
//                            .labelsHidden()
//                    }
//                }
//
//            }
//
//            Button(action: addNotification) {
//                Text("Add")
//            }
//            .padding()
//        }
//    }
//}
//
//struct Notification: Identifiable {
//    let id = UUID()
//    let title: String
//    let body: String
//    let date: Date
//    let type: NotificationType
//}
//
//enum NotificationType: String, CaseIterable {
//    case direct = "Direct"
//    case suggestion = "Suggestion"
//    case quote = "Quote"
//}
