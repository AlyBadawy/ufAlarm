//
//  AddEditAlarmView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct AddEditAlarmView: View {
  let currentAlarmIndex: Int?
  
  @State var alarm: UfAlarm
  @State private var showConfirmation = true
  
  var body: some View {
    ZStack {
      Color(.subtleBgUf)
        .ignoresSafeArea()
      
      VStack {
        if showConfirmation {
          AlarmConfirmationView()
        }
        
        AlarmDetailsForm(currentAlarmIndex: currentAlarmIndex, alarm: alarm)
      }
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
  AddEditAlarmView(currentAlarmIndex: nil, alarm: .defaultAlarm())
}
