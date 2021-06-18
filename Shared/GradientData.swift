//
//  GradientData.swift
//  GradientGrid
//
//  Created by yk on 2021/6/17.
//

import Foundation
import SwiftUI

struct GradientData: Codable, Identifiable {

  var id: String {
    name
  }

  let name: String
  let gradient: [Gradient]

  struct Gradient: Codable {
    let color: String
    let pos: Int8

//    var yes: Color {
//      colorString(of: color)
//    }

    func colorString(of color: String) -> Color {
      // skip the #
      let startIndex = color.firstIndex(of: "#").flatMap { color.index(after: $0) } ?? color.startIndex
      if let result = Int32(color.suffix(from: startIndex), radix: 16) {
        return Color.rgb(result)
      }
      return Color.black
    }
  }
}



@MainActor
class Gradients: ObservableObject {
  @Published private(set) var items: [GradientData] = []
  @Published private(set) var isFetching = false

  func updateGradients() async {
    let fetched = await self.fetchGradients()
    items = fetched
  }

  func fetchGradients() async -> [GradientData] {
    isFetching = true
    let (data, _) = try! await URLSession.shared.data(from: URL(string: "https://raw.githubusercontent.com/itmeo/webgradients/master/gradients-parsed.json")!)

    isFetching = false
    let decoder = JSONDecoder()
    return try! decoder.decode([GradientData].self, from: data)
  }

  // just placeholder, data doesn't matter
  var placeholder: [GradientData] = [
    .init(name: "name1", gradient: [GradientData.Gradient(color: "#fefefe", pos: 0), GradientData.Gradient(color: "#000000", pos: 100)]),
    .init(name: "name2", gradient: [GradientData.Gradient(color: "#fefefe", pos: 0), GradientData.Gradient(color: "#808080", pos: 100)]),
    .init(name: "name3", gradient: [GradientData.Gradient(color: "#fefefe", pos: 0), GradientData.Gradient(color: "#909090", pos: 100)])
  ]
}
