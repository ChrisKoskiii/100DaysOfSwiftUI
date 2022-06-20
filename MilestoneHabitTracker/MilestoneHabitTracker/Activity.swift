//
//  Activity.swift
//  MilestoneHabitTracker
//
//  Created by Christopher Koski on 6/19/22.
//

import Foundation

struct Activity: Identifiable, Codable {
  
  var id = UUID()
  let title: String
  let description: String
  var timesCompleted: Int = 0
  
}
