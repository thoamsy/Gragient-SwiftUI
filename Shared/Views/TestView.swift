//
//  TestView.swift
//  GradientGrid
//
//  Created by yk on 2021/6/30.
//

import SwiftUI

struct TestView: View {
    var body: some View {
      VStack {
        ZStack {
          Text("Text")
            .foregroundColor(.yellow)
          Rectangle().background(.red)
        }
        Text("Text")
          .background(Rectangle().foregroundColor(.red))
        Circle().overlay(Text("Text").foregroundColor(.white))
      }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
