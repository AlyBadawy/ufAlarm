//
//  SplashScreen.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct SplashScreen: View {
  @State private var isActive = false
  @State private var opacity = 0.3
  @State private var fontSize = 12.0
  
  var body: some View {
    if isActive {
      MainAlarmView()
    } else {
      ZStack {
        FourAnimatedGradCirclesView(color1: .teal, color2: .green)
        
        VStack {
          VStack(alignment: .leading, spacing: 0) {
            CustomTextView(text: "Hello There", size: fontSize)
            CustomTextView(text: "let's add an alarm", size: fontSize)
          }
          .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
          .padding()
          .onAppear {
            withAnimation(.easeIn(duration: 1.5)) {
              opacity = 1.0
              fontSize = 36
            }
          }
          
          Spacer()
          
          Image("welcome")
            .resizable()
            .scaledToFit()
            .opacity(0.8)
          
          Spacer()
        }
        
        
      }
      .opacity(opacity)
      .onAppear {
        DispatchQueue.main
          .asyncAfter(deadline: .now() + 20.0) {
            withAnimation {
              isActive = true
            }
          }
      }
      .onTapGesture {
        withAnimation {
          isActive = true
        }
      }
    }
  }
}

#Preview {
  SplashScreen()
}
