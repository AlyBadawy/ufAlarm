//
//  AddEditAlarmView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct AlarmDetailView: View {
  let currentAlarmIndex: Int?
  
  @Binding var alarm: UfAlarm
  @State private var showConfirmation = true
  
  var body: some View {
    ZStack {
      Color(.subtleBgUf)
        .ignoresSafeArea()
      
      ScrollView {
        if showConfirmation {
          AlarmConfirmationView()
        }
        AddEditAlarmForm(currentAlarmIndex: currentAlarmIndex, alarm: $alarm)
      }.scrollDisabled(!showConfirmation)
    }
    .onAppear {
      DispatchQueue.main
        .asyncAfter(deadline: .now() + 3) {
          withAnimation {
            showConfirmation = false
          }
        }
    }
  }
}

#Preview {
  AlarmDetailView(currentAlarmIndex: nil, alarm: .constant(.defaultAlarm()))
}
