//
//  ShiftedTextView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct ShiftedTextView: View {
  let text: LocalizedStringResource
  let xShift: Double
  var color: Color = .color3
  
  var body: some View {
    Text(text)
      .foregroundStyle(color)
      .font(.subheadline)
      .offset(x: xShift)
  }
}

#Preview {
  VStack {
    ShiftedTextView(text: "Hallo", xShift: 12)
    ShiftedTextView(text: "Hallo", xShift: -12)
  }
}
