//
//  CachedFriend+CoreDataProperties.swift
//  Milestone10-12
//
//  Created by Christopher Koski on 7/11/22.
//
//

import Foundation
import CoreData


extension CachedFriend {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
    return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
  }
  
  @NSManaged public var id: String?
  @NSManaged public var name: String?
  @NSManaged public var user: CachedUser?
  
  var wrappedName: String {
    name ?? ""
  }
}

extension CachedFriend : Identifiable {
  
}
