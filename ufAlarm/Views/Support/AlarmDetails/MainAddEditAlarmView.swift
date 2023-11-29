//
//  MainEditAlarmView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct MainAddEditAlarmView: View {
  let currentAlarmIndex: Int?
  
  @State var alarm: AlarmUf
  @State private var selectedTab = "One"
  
  var body: some View {
    TabView(selection: $selectedTab) {
      AlarmDetailView(currentAlarmIndex: currentAlarmIndex,
                       alarm: $alarm)
      .tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }
      .tag("form")
      
      AddEditAlarmCircular(currentAlarmIndex: currentAlarmIndex,
                           alarm: $alarm)
      .tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }
      .tag("circular")
    }
    .onAppear() {
      UIPageControl
        .appearance()
        .currentPageIndicatorTintColor = .gray
        
    }
    .tabViewStyle(.page(indexDisplayMode: .always))
//    .ignoresSafeArea()
  }
}

#Preview {
  MainAddEditAlarmView(currentAlarmIndex: nil, alarm: .defaultAlarm())
}
