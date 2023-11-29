//
//  TimeArc.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct TimeArc: View {
  let percentDifference: CGFloat
  let strokeStyle: StrokeStyle
  let size: CGFloat
  let rotateCircleOffset: CGFloat
  let color: Color
  
  var body: some View {
    Circle()
      .trim(from: 0.0, to: percentDifference)
      .stroke(style: strokeStyle)
      .foregroundStyle(color)
      .frame(width: size, height: size)
      .rotationEffect(.degrees(-90))
      .rotationEffect(.degrees(rotateCircleOffset))
  }
}

#Preview {
  TimeArc(percentDifference: 0.4,
          strokeStyle: .init(lineWidth: 15, dash: [1, 2]),
          size: 200,
          rotateCircleOffset: 30,
          color: .black)
}
