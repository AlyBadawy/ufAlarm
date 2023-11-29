//
//  ClockTicks.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct ClockTicks: View {
  let size: CGFloat
  
  var body: some View {
    ZStack {
      ForEach(0 ..< 24) { i in
          ClockTick(i: CGFloat(i), size: size)
      }
    }
  }
}

#Preview {
  ClockTicks(size: (screenWidth / 2) - 10)
}
