//
//  GrayedTextView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct GrayedTextView: View {
  let text: String
  var font = Font.headline
  
  var body: some View {
    Text(text)
      .foregroundStyle(.gray)
      .font(font)
  }
}

#Preview {
    GrayedTextView(text: "Add Alarm")
}
