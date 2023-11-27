//
//  AlarmModel.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import Foundation
import SwiftUI

struct UfAlarm: Identifiable {
  let id = UUID().uuidString
  
  let title: String
  let body: String
  let repeats: Bool
  var sound: UfSound
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
  
  var startTime: UfTime {
    dateToUfTime(dateTime: start)
  }
  
  var endTime: UfTime {
    dateToUfTime(dateTime: end)
  }
  
  static func defaultAlarm() -> UfAlarm {
    UfAlarm(title: "Activity Completed",
               body: "Have a great Day",
               repeats: false,
               sound: .lagrima,
               alarmEnabled: false,
               start: Date(),
               end: Date(),
               activity: ACTIVITIES[0],
               colorIndex: 0)
  }
  
  static func dummyAlarmData() -> [UfAlarm] {
    [
      UfAlarm(title: "Activity Completed",
                 body: "Have a great Day",
                 repeats: false,
                 sound: .lagrima,
                 alarmEnabled: true,
                 start: Date(),
                 end: addTimeToDateTime(dateTime: Date(), numHours: 3, numMinutes: 15),
                 activity: ACTIVITIES[0],
                 colorIndex: 0),
      
      UfAlarm(title: "Yo Yo!",
                 body: "Peace",
                 repeats: false,
                 sound: .lagrima,
                 alarmEnabled: false,
                 start: Date(),
                 end: addTimeToDateTime(dateTime: Date(), numHours: 5, numMinutes: 27),
                 activity: ACTIVITIES[2],
                 colorIndex: 1),
      
      UfAlarm(title: "He He",
                 body: "nyahahaha",
                 repeats: false,
                 sound: .wake_up,
                 alarmEnabled: true,
                 start: Date(),
                 end: addTimeToDateTime(dateTime: Date(), numHours: 6, numMinutes: 40),
                 activity: ACTIVITIES[4],
                 colorIndex: 2),
      
      UfAlarm(title: "Romba",
                 body: "Have a great Day",
                 repeats: false,
                 sound: .lagrima,
                 alarmEnabled: true,
                 start: Date(),
                 end: addTimeToDateTime(dateTime: Date(), numHours: 1, numMinutes: 15),
                 activity: ACTIVITIES[0],
                 colorIndex: 0),
      
      UfAlarm(title: "Zomba!",
                 body: "Another Body",
                 repeats: false,
                 sound: .lagrima,
                 alarmEnabled: false,
                 start: Date(),
                 end: addTimeToDateTime(dateTime: Date(), numHours: 5, numMinutes: 13),
                 activity: ACTIVITIES[2],
                 colorIndex: 1),
      
      UfAlarm(title: "nyahahaha",
                 body: "nyahahaha",
                 repeats: false,
                 sound: .wake_up,
                 alarmEnabled: true,
                 start: Date(),
                 end: addTimeToDateTime(dateTime: Date(), numHours: 13, numMinutes: 40),
                 activity: ACTIVITIES[4],
                 colorIndex: 2),
      
      UfAlarm(title: "He Ha Ho",
                 body: "",
                 repeats: false,
                 sound: .lagrima,
                 alarmEnabled: true,
                 start: Date(),
                 end: addTimeToDateTime(dateTime: Date(), numHours: 0, numMinutes: 30),
                 activity: ACTIVITIES[4],
                 colorIndex: 2),
      
      UfAlarm(title: "Activity Started",
                 body: "Have a great night",
                 repeats: false,
                 sound: .lagrima,
                 alarmEnabled: true,
                 start: Date(),
                 end: addTimeToDateTime(dateTime: Date(), numHours: 1, numMinutes: 7),
                 activity: ACTIVITIES[0],
                 colorIndex: 0),
      
      UfAlarm(title: "Yo YE Ya!",
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

