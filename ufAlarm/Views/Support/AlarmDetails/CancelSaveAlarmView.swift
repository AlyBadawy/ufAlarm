//
//  CancelSaveAlarmView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct CancelSaveAlarmView: View {
  let currentAlarmIndex: Int?
  @Binding var alarm: AlarmUf
  
  var body: some View {
    HStack {
      // Cancel
      Button {
        // TODO: Cencel the alarm
      } label: {
        Text("Cancel")
          .foregroundStyle(.secondaryUf)
      }
      
      Spacer()
      
      // Save
      Button {
        // TODO: Save the alarm
        if let currentAlarmIndex = currentAlarmIndex {
          // TODO: Edit alarm to viewModel
        } else {
          // TODO: Append alarm ro viewModel
        }
      } label: {
        Text("Save")
          .foregroundStyle(.accentUf)
      }
    }
  }
}

#Preview {
  CancelSaveAlarmView(currentAlarmIndex: nil, alarm: .constant(.defaultAlarm()))
}
