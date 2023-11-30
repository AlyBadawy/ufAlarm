//
//  LocalNotificationsManager.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import Foundation
import NotificationCenter

//@MainActor
@Observable class LocalNotificationManager: NSObject, UNUserNotificationCenterDelegate {
  
  let notificationCenter = UNUserNotificationCenter.current()
  
  var isAuthorized = false
  var pendingAlarms: [UNNotificationRequest] = []
  var alarmVMs: [AlarmUf] = [] {
    didSet {
      saveItems()
    }
  }
  
  @ObservationIgnored let itemKey = "AlarmList"
  
  func requestAuthorization() async throws {
    try await notificationCenter
      .requestAuthorization(options: [
        .sound,
        .badge,
        .alert
      ])
  }
  
  func getCurrentSettings() async {
    let currentSettings = await notificationCenter.notificationSettings()
    
    isAuthorized = currentSettings.authorizationStatus == .authorized
  }
  
  func openSettings() {
    if let url = URL(string: UIApplication.openSettingsURLString) {
      if UIApplication.shared.canOpenURL(url) {
        Task {
          await UIApplication.shared.open(url)
        }
      }
    }
  }
  
  func saveItems() {
    if let encodeData = try? JSONEncoder().encode(alarmVMs) {
      UserDefaults
        .standard
        .set(encodeData, forKey: itemKey)
    }
  }
  
  func getPendingAlarms() async {
    pendingAlarms = await notificationCenter.pendingNotificationRequests()
  }
  
  
  func schedule(localNotification: AlarmUf) async {
    let content = UNMutableNotificationContent()
    content.body = NSLocalizedString(localNotification.body, comment: "")
    content.sound = notificationSound(sound: localNotification.sound)
    
    let dateComponents = localNotification.endDateTimeComponents
    let trigger = UNCalendarNotificationTrigger(
      dateMatching: dateComponents,
      repeats: localNotification.repeats
    )
    
    let request = UNNotificationRequest(
      identifier: localNotification.id,
      content: content,
      trigger: trigger)
    
    try? await notificationCenter
      .add(request)
    
    pendingAlarms = await notificationCenter
      .pendingNotificationRequests()
  }
  
  func notificationSound(sound: SoundUf) -> UNNotificationSound? {
    let filename = "\(sound.rawValue)"
    
    return UNNotificationSound(
      named: UNNotificationSoundName(filename)
    )
  }
  
  func removeRequest(id: String) {
    notificationCenter
      .removeDeliveredNotifications(withIdentifiers: [id])
    
    if let idx = pendingAlarms.firstIndex(where: { req in
      req.identifier == id
    }) {
      pendingAlarms.remove(at: idx)
    }
  }
  
  override init() {
    super.init()
    // TODO: Want alarm to go off when app is also active
    
    // Alarm VMs persistance
    guard let data = UserDefaults
      .standard.data(forKey: itemKey),
          let savedItems = try? JSONDecoder().decode([AlarmUf].self, from: data)
    else {
      return
    }
    self.alarmVMs = savedItems
  }
}
