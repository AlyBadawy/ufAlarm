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
