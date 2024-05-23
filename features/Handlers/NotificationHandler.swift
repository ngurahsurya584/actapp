//
//  NotificationHandler.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 20/05/24.
//

//import Foundation
//import UserNotifications
//
//class NotificationHandler {
//    func askPermission() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//            if success {
//                print("Access Granted!")
//            } else if let error = error {
//                print("Permission error: \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func sendNotification(date: Date, type: String, timeInterval: Double = 10, title: String, body: String) {
//        var trigger: UNNotificationTrigger?
//        
//        if type.lowercased() == "date" {
//            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date) // Only hour and minute
//            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//        } else if type.lowercased() == "time" {
//            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
//        }
//        
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        content.sound = UNNotificationSound.default
//        
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("Error adding notification: \(error.localizedDescription)")
//            } else {
//                print("Notification scheduled with title: \(title), body: \(body), date: \(date)")
//            }
//        }
//    }
//}

//import Foundation
//import UserNotifications
//
//class NotificationHandler {
//    func askPermission(completion: @escaping () -> Void) {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//            if success {
//                print("Access Granted!")
//                completion()
//            } else if let error = error {
//                print("Permission error: \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func sendNotification(date: Date, type: String, timeInterval: Double = 10, title: String, body: String, repeats: Bool = false) {
//        var trigger: UNNotificationTrigger?
//        
//        if type.lowercased() == "date" {
//            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
//            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: repeats)
//        } else if type.lowercased() == "time" {
//            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
//        }
//        
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        content.sound = UNNotificationSound.default
//        
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("Error adding notification: \(error.localizedDescription)")
//            } else {
//                print("Notification scheduled with title: \(title), body: \(body), date: \(date)")
//            }
//        }
//    }
//    
//    func scheduleMorningAndNightNotifications(morning: Date, night: Date) {
//        sendNotification(date: morning, type: "date", title: "Good Morning!", body: "Start your day with a smile.", repeats: true)
//        sendNotification(date: night, type: "date", title: "Good Night!", body: "Time to relax and unwind.", repeats: true)
//    }
//}


import Foundation
import UserNotifications

class NotificationHandler {
    func askPermission(completion: @escaping () -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access Granted!")
                completion()
            } else if let error = error {
                print("Permission error: \(error.localizedDescription)")
            }
        }
    }
    
    func sendNotification(date: Date, type: String, title: String, body: String, repeats: Bool = false) {
        var trigger: UNNotificationTrigger?
        
        if type.lowercased() == "date" {
            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: repeats)
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled with title: \(title), body: \(body), date: \(date)")
            }
        }
    }
    
    func scheduleMorningAndNightNotifications(morning: Date, night: Date) {
        sendNotification(date: morning, type: "date", title: "Good Morning!", body: "Start your day with a smile.", repeats: true)
        sendNotification(date: night, type: "date", title: "Good Night!", body: "Time to relax and unwind.", repeats: true)
    }
}



