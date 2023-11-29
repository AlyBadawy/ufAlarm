//
//  EnableNotificationsView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct EnableNotificationsView: View {
  @Environment(LocalNotificationManager.self) var lnMAnager
  
  var body: some View {
    ZStack {
      FourAnimatedGradCirclesView()
      
      VStack {
        Spacer()
        
        CustomTextView(text: "Enable notifications, please!", size: 36)
          .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
        
        Spacer()
        
        Button {
          lnMAnager.openSettings()
        } label: {
          UfButton(text: "Enable")
        }
      }
    }
  }
}

#Preview {
  EnableNotificationsView()
    .environment(LocalNotificationManager())
}
