//
//  TimeIcon.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

struct TimeIcon: View {
  let dateTime: Date
  var percent: CGFloat {
    return dateTimeToPercent(dateTime: dateTime)
  }
  var hour: Int {
    Int(24 * percent)
  }
  var image: (name: String, color: Color) {
    switch hour {
    case 5...6:
      return ("sunrise.fill", .orange)
    case 7...16:
      return ("sun.max.fill", .yellow)
    case 17...19:
      return ("sunset.fill", .pink)
    case 20...22:
      return ("moon.fill", .black)
    default:
      return("moon.stars.fill", .black)
    }
  }
  
    var body: some View {
      Image(systemName: image.name)
        .foregroundStyle(image.color)
    }
}

#Preview {
  return List(0 ..< 24) { i in
    HStack {
      let theDate = addTimeToDateTime(dateTime: Date(), numHours: i, numMinutes: 0)
      Text(getTimeFromDateTime(dateTime: theDate))
      Spacer()
     TimeIcon(dateTime: theDate)
    }
  }
  .padding()
}
