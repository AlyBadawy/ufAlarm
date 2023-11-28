//
//  CustomTextView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct CustomTextView: View {
  let text: LocalizedStringKey
  let size: CGFloat
  
  var body: some View {
    Text(text)
      .font(.customFont(size: size))
      .shadow(color: .shadow,
              radius: 3, x: 0, y: 0)
  }
}

#Preview {
    CustomTextView(text: "Add Alarm",
                   size: 36)
}
