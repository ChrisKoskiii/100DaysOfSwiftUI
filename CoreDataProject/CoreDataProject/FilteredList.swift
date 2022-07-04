//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Christopher Koski on 7/2/22.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
  @FetchRequest var fetchRequest: FetchedResults<T>
  
  let content: (T) -> Content
  
  var body: some View {
    List(fetchRequest, id: \.self) { singer in
      self.content(singer)
    }
  }
  
  init(type: String = "CONTAINS[c]", filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
    _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(type) %@", filterKey, filterValue))
    self.content = content
  }
}
