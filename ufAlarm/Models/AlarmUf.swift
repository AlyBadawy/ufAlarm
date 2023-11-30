//
//  AlarmModel.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import Foundation
import SwiftUI

struct AlarmUf: Identifiable, Codable {
  private(set) var id = UUID().uuidString
  
  let title: String
  let body: String
  let repeats: Bool
  var sound: SoundUf
  var alarmEnabled: Bool
  var start: Date
  var end: Date
  
  var activity: String // TODO:Fix this  - define Activity
  var colorIndex: Int
  var activityColor: Color {
    ALARM_COLORS[colorIndex]
  }
  
  var timeInterval: TimeInterval {
    end - start
  }
  
  var startTime: TimeUf {
    dateToUfTime(dateTime: start)
  }
  
  var endTime: TimeUf {
    dateToUfTime(dateTime: end)
  }
  
  var endDateTimeComponents: DateComponents {
    return Calendar
      .current
      .dateComponents(
        [.hour, .minute],
        from: self.end
      )
  }
  
  static func defaultAlarm() -> AlarmUf {
    AlarmUf(title: "Activity Completed",
            body: "Have a great Day",
            repeats: false,
            sound: .lagrima,
            alarmEnabled: false,
            start: Date(),
            end: Date(),
            activity: ACTIVITIES[0],
            colorIndex: 0)
  }
  
  static func dummyAlarmData() -> [AlarmUf] {
    [
      AlarmUf(title: "Activity Completed",
              body: "Have a great Day",
              repeats: false,
              sound: .lagrima,
              alarmEnabled: true,
              start: Date(),
              end: addTimeToDateTime(dateTime: Date(), numHours: 3, numMinutes: 15),
              activity: ACTIVITIES[0],
              colorIndex: 0),
      
      AlarmUf(title: "Yo Yo!",
              body: "Peace",
              repeats: false,
              sound: .lagrima,
              alarmEnabled: false,
              start: Date(),
              end: addTimeToDateTime(dateTime: Date(), numHours: 5, numMinutes: 27),
              activity: ACTIVITIES[2],
              colorIndex: 1),
      
      AlarmUf(title: "He He",
              body: "nyahahaha",
              repeats: false,
              sound: .wake_up,
              alarmEnabled: true,
              start: Date(),
              end: addTimeToDateTime(dateTime: Date(), numHours: 6, numMinutes: 40),
              activity: ACTIVITIES[4],
              colorIndex: 2),
      
      AlarmUf(title: "Romba",
              body: "Have a great Day",
              repeats: false,
              sound: .lagrima,
              alarmEnabled: true,
              start: Date(),
              end: addTimeToDateTime(dateTime: Date(), numHours: 1, numMinutes: 15),
              activity: ACTIVITIES[0],
              colorIndex: 0),
      
      AlarmUf(title: "Zomba!",
              body: "Another Body",
              repeats: false,
              sound: .lagrima,
              alarmEnabled: false,
              start: Date(),
              end: addTimeToDateTime(dateTime: Date(), numHours: 5, numMinutes: 13),
              activity: ACTIVITIES[2],
              colorIndex: 1),
      
      AlarmUf(title: "nyahahaha",
              body: "nyahahaha",
              repeats: false,
              sound: .wake_up,
              alarmEnabled: true,
              start: Date(),
              end: addTimeToDateTime(dateTime: Date(), numHours: 13, numMinutes: 40),
              activity: ACTIVITIES[4],
              colorIndex: 2),
      
      AlarmUf(title: "He Ha Ho",
              body: "",
              repeats: false,
              sound: .lagrima,
              alarmEnabled: true,
              start: Date(),
              end: addTimeToDateTime(dateTime: Date(), numHours: 0, numMinutes: 30),
              activity: ACTIVITIES[4],
              colorIndex: 2),
      
      AlarmUf(title: "Activity Started",
              body: "Have a great night",
              repeats: false,
              sound: .lagrima,
              alarmEnabled: true,
              start: Date(),
              end: addTimeToDateTime(dateTime: Date(), numHours: 1, numMinutes: 7),
              activity: ACTIVITIES[0],
              colorIndex: 0),
      
      AlarmUf(title: "Yo YE Ya!",
              body: "bbmmm",
              repeats: false,
              sound: .lagrima,
              alarmEnabled: false,
              start: Date(),
              end: addTimeToDateTime(dateTime: Date(), numHours: 2, numMinutes: 2),
              activity: ACTIVITIES[2],
              colorIndex: 1),
    ]
      .sorted(by: {
        $0.endTime < $1.endTime
      })
  }
}

