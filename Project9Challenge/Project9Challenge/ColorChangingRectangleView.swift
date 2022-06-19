//
//  ColorChaningRectangleView.swift
//  Project9Challenge
//
//  Created by Christopher Koski on 6/18/22.
//

import SwiftUI

struct ColorChangingRectangleView: View {
  @State private var colorCycle = 0.0
  
  @State private var startingX: Double = 0.5
  @State private var startingY: Double = 0
  @State private var endingX: Double = 0.5
  @State private var endingY: Double = 0.5
  
  var body: some View {
    VStack {
      ColorChangingRectangle(amount: colorCycle, startingX: startingX, startingY: startingY, endingX: endingX, endingY: endingY)
        .padding()
      
      Slider(value: $startingX)
        .padding()
      Slider(value: $startingY)
        .padding()
      Slider(value: $endingX)
        .padding()
      Slider(value: $endingY)
        .padding()
    }
  }
}

struct ColorChangingRectangle: View {
  var amount = 0.0
  var steps = 100
  
  var startingX: Double = 0.5
  var startingY: Double = 0
  var endingX: Double = 0.5
  var endingY: Double = 0.5
  
  var body: some View {
    ZStack {
      ForEach(0..<steps) { value in
        Rectangle()
          .inset(by: Double(value))
          .strokeBorder(
            LinearGradient(
              gradient: Gradient(colors: [
                color(for: value, brightness: 1),
                color(for: value, brightness: 0.5)
              ]),
              startPoint: UnitPoint(x: startingX, y: startingY),
              endPoint: UnitPoint(x: endingX, y: endingY)
            ),
            lineWidth: 2
          )
      }
    }
    .drawingGroup()
  }
  
  func color(for value: Int, brightness: Double) -> Color {
    var targetHue = Double(value) / Double(steps) + amount
    
    if targetHue > 1 {
      targetHue -= 1
    }
    
    return Color(hue: targetHue, saturation: 1, brightness: brightness)
  }
}

struct ColorChaningRectangleView_Previews: PreviewProvider {
  static var previews: some View {
    ColorChangingRectangleView()
  }
}
