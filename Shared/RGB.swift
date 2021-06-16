//
//  RGB.swift
//  GradientGrid
//
//  Created by yk on 2021/6/17.
//

import SwiftUI

extension Color {
  static func rgb(_ value: Int32) -> Self {
    let red = (value >> 16) & 0xff
    let green = (value >> 8) & 0xff
    let blue = value & 0xff

    return Self.init(red: Double(red) / 255, green: Double(green) / 255, blue: Double(blue) / 255)
  }

  static func rgba(_ value: Int64) -> Self {
    let red = (value >> 24) & 0xff
    let green = (value >> 16) & 0xff
    let blue = (value >> 8) & 0xff
    let alpha = (value) & 0xff

    return Self.init(red: Double(red) / 255, green: Double(green) / 255, blue: Double(blue) / 255, opacity: Double(alpha) / 255)
  }

}
