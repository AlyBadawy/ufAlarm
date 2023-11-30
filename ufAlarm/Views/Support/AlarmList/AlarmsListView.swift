//
//  AlarmsListView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct AlarmsListView: View {
  @Environment(LocalNotificationManager.self) var lnManager
  
  @State var isActive = false
  @State var currentIdx: Int? = nil
  
  func deleteAlarms(indexSet: IndexSet) {
    
    // Remove from pending alarms
    for idx in indexSet {
      lnManager.removeRequest(id: lnManager.alarmVMs[idx].id)
    }
    

    // Remove from the alarmVMs
    lnManager.alarmVMs.remove(atOffsets: indexSet)
  }
  
  var body: some View {
    NavigationStack {
      ZStack {
        List {
          ForEach(lnManager.alarmVMs.indices, id: \.self) { idx in
            let alarm = lnManager.alarmVMs[idx]
            
            Button {
              currentIdx = idx
              isActive.toggle()
            } label: {
              AlarmRowView(alarm: alarm, idx: idx)
                .padding(.vertical)
            }

            
//            NavigationLink {
//              MainAddEditAlarmView(currentAlarmIndex: idx, alarm: alarm)
//            } label: {
//              AlarmRowView(alarm: alarm, idx: idx)
//            }
          }
          .onDelete(perform: deleteAlarms)
        }
        .overlay(Group {
          if lnManager.alarmVMs.isEmpty {
            Text("Oops, looks like there's no alarms...")
          }
        })
        
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
  AlarmsListView()
    .environment(LocalNotificationManager())
}
