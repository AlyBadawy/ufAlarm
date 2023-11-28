//
//  ToBedWakeUpView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct AlarmDetailsForm: View {
  let currentAlarmIndex: Int?
  
  @State var alarm: UfAlarm
  
  var body: some View {
    VStack {
      CancelSaveAlarmView(currentAlarmIndex: currentAlarmIndex, alarm: $alarm)
      
      ToggleAlarmView(isOn: $alarm.alarmEnabled)
      Divider()
      
      HStack {
        Grid {
          GridRow {
            TimeIcon(dateTime: alarm.start)
              .font(.largeTitle)
            
            VStack(alignment: .leading) {
             GrayedTextView(text: "Start")
              
              TimePicker(time: $alarm.start, scale: 1.3)
            }
          }
          
          GridRow {
            HStack {
              Divider()
                .frame(height: 30)
                .padding(2)
            }
          }
          
          GridRow {
            Image(systemName: alarm.activity)
              .foregroundColor(alarm.activityColor)
              .font(.headline)
            
            SelectActivityView(currentColorIndex: $alarm.colorIndex, currentActivity: $alarm.activity)
          }
          .padding(.vertical)
          
          GridRow {
            HStack {
              Divider()
                .frame(height: 30)
                .padding(2)
            }
          }
          
          GridRow {
            TimeIcon(dateTime: alarm.end)
              .font(.largeTitle)
            
            VStack(alignment: .leading) {
              TimePicker(time: $alarm.end, scale: 1.3)
              GrayedTextView(text: "End")
              
              
            }
          }
          
          GridRow {
            Text("")
            HStack {
              Text("Sound")
                .fontWeight(.semibold)
              Text(alarm.sound.rawValue)
                .font(.caption)
                .fontWeight(.thin)
            }
            .padding(7)
            .overlay {
              Capsule()
                .stroke()
            }
            .contextMenu {
              ForEach(UfSound.allCases, id: \.self) {sound in
                Button {
                  alarm.sound = sound
                } label: {
                  Text(sound.rawValue)
                }
              }
              .padding(.vertical)
            }
          }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
      }
      .padding()
    }
    .padding()
    .background(
      Color(.color1)
        .cornerRadius(20)
    )
    .padding()
  }
}

#Preview {
  AlarmDetailsForm(currentAlarmIndex: nil, alarm: .defaultAlarm())
}
