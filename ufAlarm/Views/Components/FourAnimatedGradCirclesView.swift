//
//  FourAnimatedGradCirclesView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct FourAnimatedGradCirclesView: View {
  var color1: Color = .green
  var color2: Color = .teal
  
  @State private var offsetX: [CGFloat] = [0,0,0,0]
  @State private var offsetY: [CGFloat] = [0,0,0,0]
  @State private var timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()
  
  
  var body: some View {
    ZStack {
      GradientCircle(radius: screenWidth / 10,
                     color1: color1,
                     color2: color2.opacity(0.3)
      )
      .offset(x: screenWidth / 4, y: -screenHeight / 4)
      .offset(x: offsetX[0], y: offsetY[0])
      
      GradientCircle(radius: screenWidth / 7,
                     color1: color2,
                     color2: color1.opacity(0.3)
      )
      .offset(x: -screenWidth / 4, y: -screenHeight / 20)
      .offset(x: offsetX[1], y: offsetY[1])
      
      GradientCircle(radius: screenWidth / 6,
                     color1: color1.opacity(0.3),
                     color2: color2.opacity(0.3)
      )
      .offset(x: screenWidth / 3, y: -screenHeight / 20)
      .offset(x: offsetX[2], y: offsetY[2])
      
      GradientCircle(radius: screenWidth / 5,
                     color1: color1,
                     color2: color2
      )
      .offset(x: -screenWidth / 3, y: screenHeight / 4)
      .offset(x: offsetX[3], y: offsetY[3])
    }
    .onReceive(timer) {_ in
      withAnimation(.easeInOut(duration: 5)) {
        for i in 0 ..< 4 {
          offsetX[i] = Double.random(in: (-screenWidth / 3) ... (screenWidth / 3))
          offsetY[i] = Double.random(in: (-screenHeight / 2)...(screenHeight / 2))
        }
      }
    }
  }
}

#Preview {
  FourAnimatedGradCirclesView()
}
