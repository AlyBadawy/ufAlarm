//
//  ufAlarmApp.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

@main
struct ufAlarmApp: App {
  @State private var lnManager = LocalNotificationManager()
  
  var body: some Scene {
    WindowGroup {
      SplashScreen()
//      EnableNotificationsView()
        .environment(lnManager)
    }
  }
}
