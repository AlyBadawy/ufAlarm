//
//  ContentView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct MainAlarmView: View {
    var body: some View {
      TabView {
//        AddEditAlarmView(currentAlarmIndex: nil,
//                         alarm: .defaultAlarm())
        AlarmsListView(alarmViewModels: UfAlarm.dummyAlarmData() + UfAlarm.dummyAlarmData())
          .tabItem {
            Label("Alarms", systemImage: "alarm.fill")
          }
        
        AboutView()
          .tabItem {
            Label("About", systemImage: "info.circle.fill")
          }

      }
    }
}

#Preview {
    MainAlarmView()
}
