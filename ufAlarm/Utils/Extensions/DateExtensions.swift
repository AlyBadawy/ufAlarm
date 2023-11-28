//
//  DateExtensions.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import Foundation

extension Date {
  static func - (lhs: Date, rhs: Date) -> TimeInterval {
    lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
  }
}
