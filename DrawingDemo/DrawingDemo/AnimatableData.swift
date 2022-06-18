//
//  animatableData.swift
//  DrawingDemo
//
//  Created by Christopher Koski on 6/16/22.
//

import SwiftUI

struct Trapazoid: Shape {
  var insetAmount: Double
  
  var animatableData: Double {
    get { insetAmount }
    set { insetAmount = newValue}
  }
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    path.move(to: CGPoint(x: 0, y: rect.maxY))
    path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: 0, y: rect.maxY))
    
    return path
  }
}

struct AnimatableData: View {
  @State private var insetAmount: Double = 50.0
  
  var body: some View {
    Trapazoid(insetAmount: insetAmount)
      .frame(width: 200, height: 100)
      .onTapGesture {
        withAnimation {
          insetAmount = Double.random(in: 10...90)
        }
      }
  }
}

struct animatableData_Previews: PreviewProvider {
  static var previews: some View {
    AnimatableData()
  }
}
