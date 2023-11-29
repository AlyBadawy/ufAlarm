//
//  CircularTimeView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct CircularTimeView: View {
  @Binding var alarm: UfAlarm
  
  let currentAlarmIndex: Int?
  let size: CGFloat
  
  var percentDifference:CGFloat {
    let value = dateTimeToPercent(dateTime: alarm.end) - dateTimeToPercent(dateTime: alarm.start)
    
    return value >= 0 ? value : value + 1
  }
  
  var startTimeToPercent: CGFloat {
    dateTimeToPercent(dateTime: alarm.start)
  }
  var endTimeToPercent: CGFloat {
    startTimeToPercent + percentDifference
  }
  
  var rotateCircleOffset: CGFloat {
    360 * startTimeToPercent
  }
   
  var body: some View {
    ZStack {
      ClockTicks(size: size - 24)
        .padding()
      
      CentralDatePicker(alarm: $alarm, size: size)
      
      TimeArc(percentDifference: percentDifference,
              strokeStyle: .init(lineWidth: 20,
                                 lineCap: .round,
                                 lineJoin: .round),
              size: size,
              rotateCircleOffset: rotateCircleOffset,
              color: .black)
      
      TimeArc(percentDifference: percentDifference,
              strokeStyle: .init(lineWidth: 15,
                                 dash: [1, 2]),
              size: size,
              rotateCircleOffset: rotateCircleOffset,
              color: .gray)
      
      DisplayIconOnCicularTime(time: alarm.start,
                               size: size,
                               percent: startTimeToPercent)
      
      DisplayIconOnCicularTime(time: alarm.end,
                               size: size,
                               percent: endTimeToPercent)
      

      
    }
  }
}

#Preview {
  CircularTimeView(alarm: .constant(.defaultAlarm()),
                   currentAlarmIndex: nil,
                   size: (screenWidth * 0.5))
}
