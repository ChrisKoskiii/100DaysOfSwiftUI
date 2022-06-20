//
//  ActivitiesViewModel.swift
//  MilestoneHabitTracker
//
//  Created by Christopher Koski on 6/19/22.
//

import Foundation

class ActivitiesViewModel: ObservableObject {
  
  @Published var activities: [Activity] {
    didSet {
      if let encoded = try? JSONEncoder().encode(activities) {
        UserDefaults.standard.set(encoded, forKey: "Activities")
      }
    }
  }
  
  init() {
    if let saved = UserDefaults.standard.data(forKey: "Activities") {
      if let decoded = try? JSONDecoder().decode([Activity].self, from: saved) {
        activities = decoded
        return
      }
    }
    
    activities = []
  }
  
}
