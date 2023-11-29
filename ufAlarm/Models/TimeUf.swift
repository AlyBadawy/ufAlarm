//
//  TimeModel.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import Foundation


struct TimeUf: Equatable, Comparable, Identifiable {
  let id = UUID()
  let hours: Int
  let minutes: Int
  
  static func < (lhs: TimeUf, rhs: TimeUf) -> Bool {
    (lhs.hours < rhs.hours) || (lhs.hours == rhs.hours && lhs.minutes < rhs.minutes)
  }
}
