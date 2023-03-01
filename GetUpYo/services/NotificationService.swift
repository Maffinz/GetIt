//
//  NotificationService.swift
//  GetUpYo
//
//  Created by William Hernandez on 2/18/23.
//

import Foundation
import UserNotifications

class NotificationService {
    
    init(){
        // Check if user has authorized notifications
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                print("User has authorized notifications.")
            } else {
                self.askUserForNotificationAuthorization()
                print("User did not authorized notifications.")
            }
        }
    }
    
    // Request authorization for notifications
    func askUserForNotificationAuthorization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("User granted permission for notifications.")
            } else {
                print("User did not grant permission for notifications.")
            }
        }
    }
    
    // Schedule a Notification
    func scheduleNotification(time: Date, titleMessage: String, bodyMessage: String, id: String){
        let content = UNMutableNotificationContent()
        content.title = titleMessage
        content.body = bodyMessage
        
        // Configure Notification Trigger
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        // Create the notification request
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        // Schedule the notification
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
        
    }
    
    // Notification Add
    func addUserPreferenceNotification(type: Int, time: Date){
        print("Message Type \(type) at \(time.formatted(date: .omitted, time: .shortened))")
        self.scheduleNotification(time: time, titleMessage: "Message Type \(type)", bodyMessage: "This Message was Schedule by User using UI :)", id: "user-add-\(time.formatted(date: .omitted, time: .shortened))")
        
        
    }
}

