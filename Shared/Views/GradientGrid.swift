//
//  GradientGrid.swift
//  GradientGrid
//
//  Created by yk on 2021/6/17.
//

import SwiftUI

struct GradientGrid: View {
  let radius: CGFloat = 80
  var columns: [GridItem] {
    Array(
      repeating: .init(.fixed(radius * 2)),
      count: 2
    )
  }

  typealias GradientColor = (startRGB: Int32, endRGB: Int32)

  let colors: [GradientColor] = [
    (0xff9a93, 0xfad0c4),
    (0xa18cd1, 0xfbc2eb),
    (0xfad0c4, 0xffd1ff),
    (0xffecd2, 0xfcb69f)
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 10) {
        ForEach(colors, id: \.0) {
          GradientCell(
            startColor: Color.rgb($0.startRGB),
            endColor: Color.rgb($0.endRGB)
          ).radius(with: radius)
        }
      }
    }
  }
}

struct GradientGrid_Previews: PreviewProvider {
  static var previews: some View {
    GradientGrid()
  }
}
