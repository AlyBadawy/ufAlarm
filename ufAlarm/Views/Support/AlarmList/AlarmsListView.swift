//
//  AlarmsListView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct AlarmsListView: View {
  
  var alarmViewModels: [UfAlarm]
  var body: some View {
    NavigationStack {
      ZStack {
        List {
          ForEach(0 ..< alarmViewModels.count, id: \.self) { idx in
            let alarm = alarmViewModels[idx]
            NavigationLink {
              MainAddEditAlarmView(currentAlarmIndex: idx, alarm: alarm)
            } label: {
              AlarmRowView(alarm: alarm, idx: idx)
            }
          }
        }
        
        FourAnimatedGradCirclesView()
          .opacity(0.2)
      }
      .navigationTitle("Alarm List")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          EditButton()
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          NavigationLink {
            MainAddEditAlarmView(currentAlarmIndex: nil, alarm: .defaultAlarm())
          } label: {
            Image(systemName: "plus.circle.fill")
              .foregroundStyle(.subtleHighlightUf)
              .offset(y: 5)
          }
        }
      }
    }
  }
}

#Preview {
  AlarmsListView(alarmViewModels: UfAlarm.dummyAlarmData())
}
