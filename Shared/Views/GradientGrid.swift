//
//  GradientGrid.swift
//  GradientGrid
//
//  Created by yk on 2021/6/17.
//

import SwiftUI

struct GradientGrid: View {
  @StateObject private var colors = Gradients()
  var radius: CGFloat = 100

  typealias GradientColor = (startRGB: Int32, endRGB: Int32)

  func colorString(of color: String) -> Color {
    let index = color.index(after: color.startIndex)
    if let result = Int32(color.suffix(from: index), radix: 16) {
      return Color.rgb(result)
    }
    return Color.black
  }

  var colorList: some View {
    ForEach(colors.items) { color in
      let startColor = colorString(of: color.gradient[0].color)
      let endColor = colorString(of: color.gradient[1].color)
      NavigationLink {
        PureColor(
          startColor: startColor,
          endColor: endColor
        )
          .navigationTitle(color.name)
      } label: {
        GradientCell(
          group: (
            startColor,
            endColor
          ),
          colorName: color.name,
          radius: radius
        )
      }
    }
    .frame(minWidth: radius * 2, minHeight: radius * 2)
    .padding()
  }

  var body: some View {
    VStack {
#if os(iOS)
      ScrollView {
        LazyVStack {
          colorList
        }
      }
#elseif os(watchOS)
      List {
        colorList
      }.listStyle(.carousel)
#endif
    }
    .navigationBarTitle("Colors")
    .task {
      await colors.updateGradients()
    }
  }
}

struct GradientGrid_Previews: PreviewProvider {
  static var previews: some View {
    GradientGrid(radius: 50)
  }
}
