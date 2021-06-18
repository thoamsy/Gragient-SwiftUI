//
//  PureColor.swift
//  GradientGrid
//
//  Created by yk on 2021/6/18.
//

import SwiftUI

struct PureColor: View {
  let startColor: Color
  let endColor: Color

  var body: some View {
    Rectangle()
      .fill(
        LinearGradient(
          colors: [startColor, endColor],
          startPoint: .top,
          endPoint: .bottom
        )
      )
      .ignoresSafeArea(.all)
      .navigationBarTitleDisplayMode(.inline)
  }
}

struct PureColor_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      PureColor(startColor: .red, endColor: .pink)
        .previewDevice("Apple Watch Series 6 - 44mm")
    }
  }
}
