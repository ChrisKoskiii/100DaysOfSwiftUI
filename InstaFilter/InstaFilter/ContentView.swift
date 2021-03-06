//
//  ContentView.swift
//  InstaFilter
//
//  Created by Christopher Koski on 7/18/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
  @State private var image: Image?
  @State private var filterIntensity = 0.5
  
  var body: some View {
    NavigationView {
      VStack {
        ZStack {
          Rectangle()
            .fill(.secondary)
          
          Text("Tap to select a picture")
            .foregroundColor(.white)
            .font(.headline)
          
          image?
            .resizable()
            .scaledToFit()
        }
        .onTapGesture {
          //select an image
        }
        
        HStack {
          Text("Intensity")
          Slider(value: $filterIntensity)
        }
        .padding(.vertical)
        
        HStack {
          Button("Change Filter") {
            //change filter
          }
          
          Spacer()
          
          Button("Save", action: save)
        }
      }
    }
    .padding([.horizontal, .bottom])
    .navigationTitle("InstaFilter")
  }
  
  func save() {
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
