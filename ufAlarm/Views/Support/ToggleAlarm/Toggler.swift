//
//  Toggler.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct Toggler: View {
  @Binding var isOn: Bool
  
  let factor = 59.0 / 35.0
  let offsetDelta = 12.0
  
  var height = 35.0
  
  var xShift: Double {
    isOn ? offsetDelta : -offsetDelta
  }
  
  var textColor: Color {
    isOn ? Color.accentUf : Color.secondaryUf
  }
  
  var body: some View {
    let dragGesture = DragGesture()
      .onChanged { gesture in
        withAnimation(.easeIn(duration: 0.2)) {
          isOn = gesture.translation.width > 0
        }
      }
    let tapGesture = TapGesture()
      .onEnded { _ in
        withAnimation(.easeIn(duration: 0.2)) {
          isOn.toggle()
        }
      }
    let combinedGesture = dragGesture.simultaneously(with: tapGesture)
    
    ZStack {
      // BG
      RoundedRectangle(cornerRadius: 30)
        .fill(Color(white: isOn ? 0.1 : 0.6))
      
      // On / Off text
      ShiftedTextView(text: isOn ? "on" : "off",
                      xShift: -xShift,
                      color: textColor)
      
      CircularKnob(xShift: xShift,
                   color: textColor)
      
    }
    .frame(width: height * factor, height: height, alignment: .leading)
    .gesture(combinedGesture)
  }
}

#Preview {
  VStack {
    Toggler(isOn: .constant(true))
    Toggler(isOn: .constant(false))
  }
}
