//
//  GrayedTextView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct GrayedTextView: View {
  let text: LocalizedStringResource
  
  var body: some View {
    Text(text)
      .foregroundStyle(.gray)
      .font(.customFont(size: 24))
  }
}

#Preview {
  GrayedTextView(text: "Add Alarm")
}
