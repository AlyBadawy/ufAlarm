//
//  AboutView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
    ZStack {
      MainGradient(endRadius: 0)
        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
        .ignoresSafeArea()
      
      VStack(spacing: 20) {
        CustomTextView(text: "About VexUf Alarm", size: 28)
        
        // TODO: Replace this with an image of app screenshots
        Image("time_management")
          .resizable()
          .scaledToFit()
          .shadow(radius: 3, x:2, y: 5)
          .frame(width: screenWidth * 0.8)
        
        Text("VexUf-Alarm is part of the VexUf family of applications")
          .font(.customFont(size: 18))
          .multilineTextAlignment(.leading)
          .minimumScaleFactor(0.1)
        
          
        
        Spacer()
        
        if let url = URL(string: "https://alybadawy.com") {
          Link(destination: url, label: {
            UfButton(text: "To Aly Badawy's page")
              .padding()
          })
        }
      }
      .padding()
      
      
    }
  }
}

#Preview {
  AboutView()
}
