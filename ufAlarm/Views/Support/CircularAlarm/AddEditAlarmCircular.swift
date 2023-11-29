//
//  AddEditCircularAlarmView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct AddEditAlarmCircular: View {
  let currentAlarmIndex: Int?
  
  @Binding var alarm: UfAlarm
  
  
  var body: some View {
    VStack {
      CancelSaveAlarmView(currentAlarmIndex: currentAlarmIndex,
                          alarm: $alarm)
      ToggleAlarmView(isOn: $alarm.alarmEnabled)
      
      Divider()
      Spacer()
      
      CircularTimeView(alarm: $alarm,
                       currentAlarmIndex: currentAlarmIndex,
                       size: screenWidth / 2)
      Spacer()
      
      SelectActivityExpanded(currentColorIndex: $alarm.colorIndex,
                             currentActivity: $alarm.activity)
    }
    .padding()
  }
}

#Preview {
  AddEditAlarmCircular(currentAlarmIndex: nil, alarm: .constant(.defaultAlarm()))
}
