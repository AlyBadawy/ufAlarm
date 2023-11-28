//
//  CircularKnob.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct CircularKnob: View {
  let xShift: Double
  let color: Color
  var padding: Double = 7.0
  var body: some View {
    Circle()
      .fill(color)
      .padding(padding)
      .offset(x: xShift)
  }
}

#Preview {
  CircularKnob(xShift: 12, color: .accentUf)
}
