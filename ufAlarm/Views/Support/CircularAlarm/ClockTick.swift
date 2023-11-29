//
//  ClockTick.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct ClockTick: View {
  let i: CGFloat
  let size: CGFloat
  
  var scaledSize:CGFloat {
    size * 1.5
  }
  
  var degrees: CGFloat {
    ((i / 24) * 360)
  }
  
  var body: some View {
    VStack(spacing: 20) {
      Text(String(format: "%02d:00\(i >= 12 ? "PM" : "AM")", i <= 12 ? Int(i) :  (Int(i) - 12)))
        .font(.footnote)
        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
        .rotationEffect(.degrees(i <= 12 ? -90 : 90))
      Rectangle()
        .fill(.color1)
        .frame(width: 3, height: 16)
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.8),
                radius: 1,
                x: 0,
                y: 1)
    }
    .rotationEffect(.degrees(degrees))
    .rotation3DEffect(
      .degrees(-degrees),
      axis: (x: 0.0, y: 0.0, z: 1.0)
    )
    .offset(y: -scaledSize / 2)
    .rotation3DEffect(
      .degrees(degrees),
      axis: (x: 0.0, y: 0.0, z: 1.0)
    )
  }
}

#Preview {
  ClockTick(i: 18, size: screenWidth / 2)
}
