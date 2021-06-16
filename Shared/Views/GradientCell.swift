//
//  GradientCell.swift
//  GradientGrid
//
//  Created by yk on 2021/6/17.
//

import SwiftUI

struct GradientCell: View {
  let startColor: Color
  let endColor: Color
  var body: some View {
    Circle()
      .fill(
        LinearGradient(
          colors: [startColor, endColor],
          startPoint: .top,
          endPoint: .bottom
        )
      )
  }
}

extension GradientCell {
  func radius(with r: CGFloat) -> some View {
    self.modifier(RadiusModifier(radius: r))
  }
}

struct GradientCell_Previews: PreviewProvider {
  static var previews: some View {
    HStack {
      GradientCell(
        startColor: Color.rgb(0xff9a93),
        endColor: Color.rgb(0xfad0c4)
      )
        .radius(with: 50)

      GradientCell(
        startColor: Color.rgb(0xa18cd1),
        endColor: Color.rgb(0xfbc2eb)
      )
        .radius(with: 50)
    }
  }
}

struct RadiusModifier: ViewModifier {
  let radius: CGFloat
  func body(content: Content) -> some View {
    content.frame(width: radius * 2, height: radius * 2)
  }
}
