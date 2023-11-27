//
//  CustomTextView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct CustomTextView: View {
  let fontName = "WorkSans-VariableFont_wght"
  let text: LocalizedStringKey
  let size: CGFloat
  
  var body: some View {
    Text(text)
      .font(Font.custom(fontName, size: size))
      .shadow(color: .black.opacity(0.3),
              radius: 3, x: 0, y: 0)
  }
}

#Preview {
    CustomTextView(text: "let's add an alarm",
                   size: 36)
}
