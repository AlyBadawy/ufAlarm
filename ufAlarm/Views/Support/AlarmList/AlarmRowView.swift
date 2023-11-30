//
//  AlarmRowView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct AlarmRowView: View {
  @Environment(LocalNotificationManager.self) var lnManager
  
  let alarm: AlarmUf
  let idx: Int
  
  var body: some View {
    HStack(spacing: 10) {
      Image(systemName: alarm.activity)
        .foregroundStyle(alarm.activityColor)
        .font(.title)
      
        Text("\(getTimeFromDateTime(dateTime: alarm.start))-\(getTimeFromDateTime(dateTime: alarm.end))")
        .font(.title2)
          .fontWeight(alarm.alarmEnabled ? .regular : .thin)
          .scaleEffect(alarm.alarmEnabled ? 1.05 : 1.0)
          .opacity(alarm.alarmEnabled ? 1.0 : 0.7)
      
      Spacer()
      
      if idx < lnManager.alarmVMs.count {
        Toggler(isOn: .constant(lnManager.alarmVMs[idx].alarmEnabled))
      }
      
    }
    .onChange(of: alarm.alarmEnabled) { oldValue, newValue in
      if newValue == true {
        Task {
            await lnManager.schedule(localNotification: alarm)
        }
      } else {
        lnManager.removeRequest(id: alarm.id)
      }
    }
  }
}

#Preview {
  AlarmRowView(alarm: .defaultAlarm(), idx: 0)
    .environment(LocalNotificationManager())
}
