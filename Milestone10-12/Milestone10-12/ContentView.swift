//
//  ContentView.swift
//  Milestone10-12
//
//  Created by Christopher Koski on 7/8/22.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users: FetchedResults<CachedUser>
  
  var body: some View {
    NavigationView {
      List {
        ForEach(users) { user in
          NavigationLink {
            DetailView(user: user)
          } label: {
            HStack {
              Circle()
                .fill(user.isActive ? .green : .red)
                .frame(width: 15, height: 15)
              Text(user.wrappedName)
            }
          }
        }
      }
      .navigationTitle("FriendFace")
      .task {
        await loadData()
      }
    }
  }
  
  func loadData() async {
    guard users.isEmpty else { return }
    
    do {
      let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")
      
      let (data, _) = try await URLSession.shared.data(from: url!)
      if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
        let users = decodedResponse
        await MainActor.run {
          self.updateCache(with: users)
        }
      }
    } catch {
      print("Invalid data")
    }
  }
  
  func updateCache(with downloadedUsers: [User]) {
    for user in downloadedUsers {
      let fetchedUser = CachedUser(context: self.moc)
      
      fetchedUser.id = user.id
      fetchedUser.isActive = user.isActive
      fetchedUser.name = user.name
      fetchedUser.age = Int16(user.age)
      fetchedUser.company = user.company
      fetchedUser.email = user.email
      fetchedUser.address = user.address
      fetchedUser.about = user.about
      
      for friend in user.friends {
        let cachedFriend = CachedFriend(context: moc)
        cachedFriend.id = friend.id
        cachedFriend.name = friend.name
        
        fetchedUser.addToFriends(cachedFriend)
      }
    }
    
    try? self.moc.save()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
