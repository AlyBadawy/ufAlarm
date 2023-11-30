//
//  StringExtensions.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/29/23.
//

import Foundation

extension String {
  var formatSoundName: String {
    var result = String(describing: self)
      .replacingOccurrences(of: "_", with: " ")
      .capitalized
    
    let periodIndex: Index? = result.firstIndex(of: ".")
    
    if let idx = periodIndex {
      result.removeSubrange(idx...)
    }
    return result
  }
}
