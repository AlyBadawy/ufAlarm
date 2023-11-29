//
//  ToggleAlarmView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct ToggleAlarmView: View {
  @Binding var isOn: Bool
  var body: some View {
    HStack {
      GrayedTextView(text: "Alarm")
      Spacer()
      Toggler(isOn: $isOn)
    }
    .padding()
  }
}

#Preview {
  VStack {
    ToggleAlarmView(isOn: .constant(true))
    ToggleAlarmView(isOn: .constant(false))
  }
}



