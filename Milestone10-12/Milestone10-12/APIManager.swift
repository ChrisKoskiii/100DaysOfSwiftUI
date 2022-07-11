//
//  APIManager.swift
//  Milestone10-12
//
//  Created by Christopher Koski on 7/9/22.
//

import SwiftUI

class APIManager: ObservableObject {
  @Environment(\.managedObjectContext) var moc
  
  @Published var users: [User] = []
  
  
  let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")
  
  func loadData() async {
    do {
      let (data, _) = try await URLSession.shared.data(from: url!)
      
      if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
        DispatchQueue.main.async {
          self.users = decodedResponse
          print(self.users)
          for user in decodedResponse {
            let fetchedUser = CachedUser(context: self.moc)
            fetchedUser.id = user.id
            fetchedUser.isActive = user.isActive
            fetchedUser.name = user.name
            fetchedUser.age = Int16(user.age)
            fetchedUser.company = user.company
            fetchedUser.email = user.email
            fetchedUser.address = user.address
            fetchedUser.about = user.about
            
            try? self.moc.save()
          }
        }
      }
    } catch {
      print("Invalid data")
    }
  }
}
