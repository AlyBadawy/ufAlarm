//
//  MainGradient.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct MainGradient: View {
  var startRadius: CGFloat = 0.0
  var endRadius: CGFloat
  var scaleX: CGFloat = 2.0
  var opacityLinGrad = 0.5
  var opacityRadGrad = 0.9
  var yellowColor = Color.buttonUf
  
  var body: some View {
    ZStack {
      LinearGradient(colors: GRADIENT_COLORS,
                     startPoint: .top, endPoint: .bottom)
      .opacity(opacityLinGrad)
      
      RadialGradient(colors: [yellowColor, .clear],
                     center: .bottom,
                     startRadius: startRadius,
                     endRadius: endRadius)
      .opacity(opacityRadGrad)
      .scaleEffect(x: scaleX)
      
    }
  }
}

#Preview {
  MainGradient(endRadius: 60)
    .frame(width: screenWidth, height: 100)
}
