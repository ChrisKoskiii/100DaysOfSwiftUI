//
//  ContentView.swift
//  DrawingDemo
//
//  Created by Christopher Koski on 5/27/22.
//

import SwiftUI

struct CustomPathsView: View {
    var body: some View {
      VStack {
        Text("Custom Paths")
      Path { path in
          path.move(to: CGPoint(x: 200, y: 100))
          path.addLine(to: CGPoint(x: 100, y: 300))
          path.addLine(to: CGPoint(x: 300, y: 300))
          path.addLine(to: CGPoint(x: 200, y: 100))
      }
      .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
    }
}

struct CustomPathsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPathsView()
    }
}
