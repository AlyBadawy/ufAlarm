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
    
    @Environment(\.locale) var locale: Locale
    
    let language = Locale.preferredLanguages[0]
    
    
    print("language", language)
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
