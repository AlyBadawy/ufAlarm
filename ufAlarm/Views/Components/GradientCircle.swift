//
//  GradientCircle.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct GradientCircle: View {
  let radius: CGFloat
  var color1: Color = .yellow
  var color2: Color = .clear
  
  var body: some View {
    Circle()
      .fill(LinearGradient(colors: [color1, color2],
                           startPoint: .top,
                           endPoint: .bottom)
      )
      .frame(width: radius, height: radius)
  }
}

#Preview {
  GradientCircle(radius: 50)
}
