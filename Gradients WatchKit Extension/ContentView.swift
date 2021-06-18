//
//  ContentView.swift
//  Gradients WatchKit Extension
//
//  Created by yk on 2021/6/17.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      GradientGrid(radius: 50)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
