//
//  SoundMenu.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/29/23.
//

import SwiftUI

struct SoundMenu: View {
  //  @Binding var alarm: AlarmUf
  @Binding var alarmSound: SoundUf
  
  var body: some View {
    Form {
      Section(header: Text("Alarm Sounds")) {
        ForEach(ringToneSoundsList, id: \.self  ) { sound in
          SoundItemButton(alarmSound: $alarmSound, sound: sound)
        }
      }
      
      Section(header: Text("Nature Sounds")) {
        ForEach(natureSoundList, id: \.self) { sound in
          SoundItemButton(alarmSound: $alarmSound, sound: sound)
        }
      }
      .onDisappear(perform: {
        stopSound()
      })
    }
  }
}

struct SoundItemButton: View {
  @Binding var alarmSound: SoundUf
  let sound: SoundUf
  
  var body: some View {
    Button {
      if (alarmSound == sound) {
        stopSound()
      } else {
        alarmSound = sound
        playSound(sound: sound.rawValue)
      }
    } label: {
      HStack {
        Image(systemName: "checkmark")
          .foregroundStyle(.accentUf)
          .fontWeight(.semibold)
          .opacity(alarmSound == sound ? 1.0 : 0.0)
        Text(sound.rawValue.formatSoundName)
          .foregroundStyle(.textUf)
          .fontWeight(.semibold)
        
      }
    }
  }
}

#Preview {
  SoundMenu(alarmSound: .constant(AlarmUf.defaultAlarm().sound))
}


//Menu {
//  ForEach(SoundUf.allCases, id: \.self) {sound in
//    Button {
//      alarm.sound = sound
//    } label: {
//      Text(sound.rawValue)
//    }
//  }
//  .padding(.vertical)
//} label: {
//  HStack {
//    Text("Sound")
//      .fontWeight(.semibold)
//    Text(alarm.sound.rawValue)
//      .font(.caption)
//      .fontWeight(.thin)
//  }
//  .padding(7)
//  .overlay {
//    Capsule()
//      .stroke()
//  }
//  .padding(.top, 20)
//  }
