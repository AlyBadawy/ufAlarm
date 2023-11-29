//
//  UfSound.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import Foundation

enum UfSound: String, CaseIterable, Codable {
  case wake_up = "Sound Wake up"
  case lagrima = "Lagrima"
  
  func formatSoundName() -> String {
    String(describing: self)
      .replacingOccurrences(of: "_", with: " ")
      .capitalized
  }
}
