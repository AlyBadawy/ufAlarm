//
//  ContentView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct MainAlarmView: View {
  @Environment(LocalNotificationManager.self) var lnManager
  @Environment(\.scenePhase) var scenePhase
  
  
  var body: some View {
    TabView {
      if lnManager.isAuthorized {
        AlarmsListView()
          .tabItem {
            Label("Alarms", systemImage: "alarm.fill")
          }
        
        AboutView()
          .tabItem {
            Label("About", systemImage: "info.circle.fill")
          }
      } else {
        EnableNotificationsView()
      }
    }
    .ignoresSafeArea()
    .task {
      await lnManager.getCurrentSettings()
      await lnManager.getPendingAlarms()
      try? await lnManager.requestAuthorization()
    }
    .onChange(of: scenePhase, { oldValue, newValue in
      if newValue == .active {
        Task {
          await lnManager.getCurrentSettings()
          await lnManager.getPendingAlarms()
        }
      }
    })
  }
}

#Preview {
  MainAlarmView()
    .environment(LocalNotificationManager())
}
