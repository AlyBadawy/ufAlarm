//
//  TimeModel.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import Foundation


struct UfTime: Equatable, Comparable, Identifiable {
  let id = UUID()
  let hours: Int
  let minutes: Int
  
  static func < (lhs: UfTime, rhs: UfTime) -> Bool {
    (lhs.hours < rhs.hours) || (lhs.hours == rhs.hours && lhs.minutes < rhs.minutes)
  }
}
