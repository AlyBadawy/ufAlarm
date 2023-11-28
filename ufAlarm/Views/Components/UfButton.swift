//
//  UfButton.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct UfButton: View {
  let text: LocalizedStringResource
  var endRadius = 40.0
  var scaleX = 3.0
  
  var body: some View {
    Text(text)
      .fontWeight(.semibold)
      .font(.customFont(size: 20))
      .foregroundStyle(.textUf)
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color(.subtleButtonUf)
        .cornerRadius(30)
        .shadow(radius: 3, x: 2, y: 3)
      )
      
  }
}

#Preview("English") {
  UfButton(text: "About")
}

#Preview("Arabic") {
  UfButton(text: "About")
}
