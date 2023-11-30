//
//  UfSound.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import Foundation

enum SoundUf: String, CaseIterable, Codable {
  case wake_up = "Sound Wake up.aiff"
  case lagrima = "Lagrima.aiff"
  case car_alarm = "car_alarm.mp3"
  case short_clock_alarm = "short_clock_alarm.mp3"
  case alarm = "alarm.mp3"
  case clock_alarm = "clock_alarm.mp3"
  case facility_alarm = "facility_siren.mp3"
  case fire_alarm = "fire_alarm.mp3"
  case military_alarm = "military_alarm.mp3"
  case red_alert = "red_alert.mp3"
  case security_alarm = "security_alarm.mp3"
  case tic_tac  = "tic_tac .mp3"
  
  func formatSoundName() -> String {
    String(describing: self)
      .replacingOccurrences(of: "_", with: " ")
      .capitalized
  }
}

let ringToneSoundsList: [SoundUf] = [
  .alarm,
  .wake_up,
  .lagrima,
  .clock_alarm,
  .short_clock_alarm,
  .car_alarm,
  .fire_alarm,
  .military_alarm,
  .security_alarm,
  .facility_alarm,
  .red_alert,
  .tic_tac
]

let natureSoundList: [SoundUf] = [
  .car_alarm,
  .fire_alarm,
  .military_alarm,
  .security_alarm,
  .facility_alarm
]
