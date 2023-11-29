//
//  DisplayIconOnCicularTime.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct DisplayIconOnCicularTime: View {
  let time: Date
  let size: CGFloat
  let percent: CGFloat
  
  var circleFrame:CGFloat = 40.0
  
  var body: some View {
    Circle()
      .fill(.color1)
      .frame(width: circleFrame, height: circleFrame)
      .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.5),
              radius: 1,
              x: 0,
              y: 1)
      .overlay(
        TimeIcon(dateTime: time)
      )
      .rotation3DEffect(
        .degrees(-percent * 360),
        axis: (x: 0.0, y: 0.0, z: 1.0)
      )
      .offset(y: -size / 2)
      .rotation3DEffect(
        .degrees(percent * 360),
        axis: (x: 0.0, y: 0.0, z: 1.0)
      )
  }
}

#Preview {
  DisplayIconOnCicularTime(time: Date(),
                           size: 200,
                           percent: 0.5)
}
