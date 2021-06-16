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
  var radius: CGFloat = 50

  var body: some View {

    VStack {
      HStack{
        Text("Color Name")
          .font(.body)
        Spacer()
      }
      GradientCircle(
        startColor: startColor,
        endColor: endColor,
        radius: radius
      )
      HStack {
        HStack {
          Text(startColor.description)
          Image(systemName: "arrow.right")
          Text(endColor.description)
        }
          .font(.system(.footnote, design: .rounded))
        Spacer()
        Button(action: {
          UIPasteboard.general.string = "linear-gradient(45deg, \(startColor.description), \(endColor.description))"
        }) {
          Label("Copy CSS", systemImage: "doc.on.doc")
            .labelStyle(.iconOnly)
            .foregroundColor(Color(UIColor.label))
        }
      }
    }
    .padding(16)
    .frame(width: 320, height: 320)
    .background(Color(UIColor.secondarySystemGroupedBackground))
    .cornerRadius(16)
    .shadow(
      color: Color(red: 36/255, green: 37/255, blue: 38/255, opacity: 0.13),
      radius: CGFloat(20.0),
      x: CGFloat(5.0),
      y: CGFloat(12.0)
    )
  }
}

struct GradientCircle: View {
  let startColor: Color
  let endColor: Color
  let radius: CGFloat

  var body: some View {
    Circle()
      .fill(
        LinearGradient(
          colors: [startColor, endColor],
          startPoint: .top,
          endPoint: .bottom
        )
      )
      .frame(width: radius * 2, height: radius * 2)
  }
}

extension GradientCell {
  func radius(with r: CGFloat) -> some View {
    self.modifier(RadiusModifier(radius: r))
  }
}

struct GradientCell_Previews: PreviewProvider {
  static var previews: some View {
    GradientCell(
      startColor: Color.rgb(0xff9a93),
      endColor: Color.rgb(0xfad0c4),
      radius: 100
    )
      .preferredColorScheme(.dark)
      .frame(width: 200)
  }
}

struct RadiusModifier: ViewModifier {
  let radius: CGFloat
  func body(content: Content) -> some View {
    content.frame(width: radius * 2, height: radius * 2)
  }
}
