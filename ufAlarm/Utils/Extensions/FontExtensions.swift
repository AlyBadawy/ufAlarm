//
//  FontExtension.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/27/23.
//

import SwiftUI

extension Font {
  static func customFont(size: CGFloat) -> Font {
    let latinFontName = "WorkSans-Regular"
    let arabicFontNAme = "ElMessiri-Regular"
    
    let language = Locale.preferredLanguages[0]
    
    switch language {
    case "ar":
      return .custom(arabicFontNAme, size: size, relativeTo: .body)
    case "AR":
      return .custom(arabicFontNAme, size: size, relativeTo: .body)
    default:
      return .custom(latinFontName, size: size, relativeTo: .body)
    }
  }
}
