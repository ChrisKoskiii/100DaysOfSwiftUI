//
//  DetailView.swift
//  MilestoneHabitTracker
//
//  Created by Christopher Koski on 6/19/22.
//

import SwiftUI

struct DetailView: View {
  var name: String
  var description: String
  
  @State var timesCompleted: Int
  var body: some View {
    Form {
      Section{
        Text(name)
      } header: {
        Text("Activity")
      }
      Section {
        Text(description)
      } header: {
        Text("Description")
      }
      Section {
        Stepper("Times Completed: \(timesCompleted)", value: $timesCompleted)
      }
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(name: "Example", description: "Example", timesCompleted: 5)
  }
}

