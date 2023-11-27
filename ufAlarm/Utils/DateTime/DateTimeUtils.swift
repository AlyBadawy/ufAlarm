//
//  DateTimeUtils.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import Foundation


func dateTimeToPercent(dateTime: Date) -> CGFloat {
  let result = getDateTimeComponents(dateTime: dateTime)
  return ((CGFloat(result.hour) / 24) + (CGFloat(result.minute / (60 * 24))))
}

func getDateTimeComponents(dateTime: Date) -> (hour: Int, minute: Int, day: Int, month: Int, year: Int) {
  let components = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: dateTime)
  
  let hour = components.hour ?? 0
  let minute = components.minute ?? 0
  let day = components.day ?? 0
  let month = components.month ?? 0
  let year = components.year ?? 0
  
  return (hour: hour, minute: minute, day: day, month: month, year: year)
}

func getTimeFromDateTime(dateTime: Date) -> String {
  let result = getDateTimeComponents(dateTime: dateTime)
  let hour = result.hour
  let minute = result.minute
  let time = String(format: "%02d:%02d", hour, minute)
  
  return time
}

func addTimeToDateTime(dateTime: Date, numHours: Int, numMinutes: Int) -> Date {
  dateTime.addingTimeInterval(TimeInterval((numMinutes * 60) + (numHours * 60 * 60)))
}

func formatDate(dateTime: Date) -> String {
  let result = getDateTimeComponents(dateTime: dateTime)
  return "\(result.day)-\(result.month)-\(result.year)(\(result.hour):\(result.minute))"
}


