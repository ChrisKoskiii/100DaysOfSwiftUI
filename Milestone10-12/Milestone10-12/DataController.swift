//
//  DataController.swift
//  Milestone10-12
//
//  Created by Christopher Koski on 7/11/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
  let container = NSPersistentContainer(name: "Milestone10-12")
  
  init() {
    container.loadPersistentStores { description, error in
      if let error = error {
        print("Core Data failed to load: \(error.localizedDescription)")
      }
    }
  }
}
