//
//  GradientGrid.swift
//  GradientGrid
//
//  Created by yk on 2021/6/17.
//

import SwiftUI

struct GradientGrid: View {
  @StateObject private var colors = Gradients()

  typealias GradientColor = (startRGB: Int32, endRGB: Int32)

  //  let colors: [GradientColor] = [
  //    (0xff9a93, 0xfad0c4),
  //    (0xa18cd1, 0xfbc2eb),
  //    (0xfad0c4, 0xffd1ff),
  //    (0xffecd2, 0xfcb69f)
  //  ]

  func colorString(of color: String) -> Color {
    let index = color.index(after: color.startIndex)
    if let result = Int32(color.suffix(from: index), radix: 16) {
      return Color.rgb(result)
    }
    return Color.black
  }

  var colorList: some View {
    ForEach(colors.items) { color in
      GradientCell(
        group: (
          colorString(of: color.gradient[0].color),
          colorString(of: color.gradient[1].color)
        ),
        colorName: color.name
      )
    }
  }

  var body: some View {
    NavigationView {
      VStack {
        #if os(iOS)
        ScrollView {
          LazyVStack(spacing: 20) {
            colorList
          }
        }
        #elseif os(watchOS)
        List {
          colorList
        }.listStyle(.carousel)
      #endif
      }
      .navigationTitle("Colors")
      .task {
        await colors.updateGradients()
      }
    }
  }
}

struct GradientGrid_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      GradientGrid()
    }
  }
}
