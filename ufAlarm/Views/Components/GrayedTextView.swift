//
//  GrayedTextView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct GrayedTextView: View {
  let text: LocalizedStringResource
  var fontSize: CGFloat = 18.0
  
  var body: some View {
    Text(text)
      .foregroundStyle(.gray)
      .font(.customFont(size: fontSize))
  }
}

#Preview {
  GrayedTextView(text: "Add Alarm")
}
