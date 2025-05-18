//
//  Configure.swift
//  remindme
//
//  Created by MacBook on 18/05/25.
//

import Foundation
import UserNotifications

func SetNotification(hour:Int,minute:Int,message:String,title:String){
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = message
    content.sound = UNNotificationSound(named: UNNotificationSoundName("Alarm01.wav"))
    
    var dateComponents = DateComponents()
    dateComponents.hour = hour
    dateComponents.minute = minute
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Terjadi kesalahan: \(error.localizedDescription)")
        } else {
            print("Alarm dijadwalkan \(dateComponents.hour ?? 0) : \(dateComponents.minute ?? 0)")
        }
    }
}
