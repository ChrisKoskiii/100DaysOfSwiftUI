//
//  DetailView.swift
//  MilestoneHabitTracker
//
//  Created by Christopher Koski on 6/19/22.
//

import SwiftUI

struct DetailView: View {
  @ObservedObject var vm: ActivitiesViewModel
  var activity: Activity
  
  var body: some View {
    Form {
      Section{
        Text(activity.title)
      } header: {
        Text("Activity")
      }
      Section {
        Text(activity.description)
      } header: {
        Text("Description")
      }
      Section {
        Text("Completion Count: \(activity.timesCompleted)")
        Button("Mark Completed") {
          var newActivity = activity
          newActivity.timesCompleted += 1
          
          if let index = vm.activities.firstIndex(of: activity) {
            vm.activities[index] = newActivity
          }
        }
      }
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  
  static var previews: some View {
    DetailView(vm: ActivitiesViewModel(), activity: Activity(title: "Running", description: "Run twice a week"))
  }
}

