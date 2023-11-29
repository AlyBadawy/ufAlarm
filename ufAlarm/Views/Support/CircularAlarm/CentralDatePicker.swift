//
//  CentralDatePicker.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct CentralDatePicker: View {
  @Binding var alarm: UfAlarm
  let size: CGFloat
  
  var lineWidth: CGFloat = 10.0
  
  var body: some View {
    Circle()
      .stroke(.gray.opacity(0.5), lineWidth: lineWidth)
      .frame(width: size, height: size)
      .overlay {
        VStack(spacing: 4) {
          VStack {
            GrayedTextView(text: "Start", fontSize: 14)
            TimePicker(time: $alarm.start.animation(), scale: 1)
          }

          GrayedTextView(text: "Set Alarm")
          VStack {
            GrayedTextView(text: "End", fontSize: 14)
            TimePicker(time: $alarm.end.animation(), scale: 1)
          }
        }
        .padding()
        .padding(.vertical)
      }
  }
}

#Preview {
  CentralDatePicker(alarm: .constant(.defaultAlarm()),
                    size: screenWidth / 2)
}
