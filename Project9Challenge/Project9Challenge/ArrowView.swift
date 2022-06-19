//
//  ContentView.swift
//  Project9Challenge
//
//  Created by Christopher Koski on 6/18/22.
//

import SwiftUI

struct ArrowView: View {
  @State private var height: Double = 0.5
  @State private var thickness: Double = 0.25
  
  var body: some View {
    Arrow(shaftWidth: thickness, headHeight: height)
      .fill(.blue)
      .onTapGesture {
        withAnimation {
          height = Double.random(in: 0.2...0.8)
          thickness = Double.random(in: 0.2...0.8)
        }
      }
    
  }
}

struct Arrow: Shape {
  var shaftWidth: Double = 0.25
  var headHeight: Double = 0.5
  
  var animatableData: AnimatablePair<Double, Double> {
    get { AnimatablePair(shaftWidth, headHeight) }
    set { headHeight = newValue.first
      shaftWidth = newValue.second
    }
  }
  
func path(in rect: CGRect) -> Path {
  let height = rect.height * headHeight
  let thickness = rect.width * shaftWidth / 2
  return Path { path in
    path.move(to: CGPoint(x: rect.midX, y: 0))
    path.addLine(to: CGPoint(x: rect.maxX, y: height))
    path.addLine(to: CGPoint(x: rect.midX + thickness, y: height))
    path.addLine(to: CGPoint(x: rect.midX + thickness, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.midX - thickness, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.midX - thickness, y: height))
    path.addLine(to: CGPoint(x: rect.minX, y: height))
    path.closeSubpath()
  }
}
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Arrow()
  }
}
