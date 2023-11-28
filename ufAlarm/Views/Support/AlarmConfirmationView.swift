//
//  AlarmConfirmationView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct AlarmConfirmationView: View {
  let prompt: LocalizedStringResource = "You did it! Here you can manage your alarm, change time, etc..."
  
  var body: some View {
    MainGradient(endRadius: 120, scaleX: 1.5, yellowColor: .yellow.opacity(0.4))
      .cornerRadius(20)
      .frame(height: screenHeight / 4)
      .overlay(
        HStack {
          CustomTextView(text: prompt, size: 18)
            .padding(.horizontal)
            .padding(.horizontal)
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .frame(width: screenWidth / 1.8)
          
          Spacer()
          
          Image("beach_day")
            .resizable()
            .scaledToFit()
            .padding(.horizontal)
            .opacity(9)
        }
      )
      .padding()
  }
}

#Preview {
  AlarmConfirmationView()
}
