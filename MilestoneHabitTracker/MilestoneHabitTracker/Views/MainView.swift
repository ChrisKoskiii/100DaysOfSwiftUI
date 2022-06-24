//
//  TabView.swift
//  MilestoneHabitTracker
//
//  Created by Christopher Koski on 6/20/22.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      ActivitiesView()
        .tabItem {
          Image(systemName: "house")
      }
      CalendarView()
        .tabItem {
          Image(systemName: "calendar")
        }
      Text("Second View")
        .tabItem {
          Image(systemName: "gear")
        }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
