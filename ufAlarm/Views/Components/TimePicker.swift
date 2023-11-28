//
//  TimePicker.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct TimePicker: View {
  @Binding var time: Date
  
  let scale: CGFloat
  
  var body: some View {
    DatePicker("",
               selection: $time,
               displayedComponents: .hourAndMinute)
    .scaleEffect(scale)
    .labelsHidden()
  }
}

#Preview {
  TimePicker(time: .constant(Date()), scale: 1)
}
