//
//  SoundMenuFromButton.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/29/23.
//

import SwiftUI

struct SoundMenuFromButton: View {
  @Binding var alarm: AlarmUf
  
  var body: some View {
    NavigationLink {
      SoundMenu(alarmSound: $alarm.sound)
    } label: {
      HStack {
        Text("Sound")
          .fontWeight(.semibold)
        Text(alarm.sound.rawValue.formatSoundName)
          .font(.caption)
          .fontWeight(.thin)
      }
      .padding(7)
      .overlay {
        Capsule()
          .stroke()
      }
    }

  }
}

#Preview {
  NavigationStack {
    SoundMenuFromButton(alarm: .constant(.defaultAlarm()))
  }
}
