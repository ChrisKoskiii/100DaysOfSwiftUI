//
//  ContentView.swift
//  Milestone10-12
//
//  Created by Christopher Koski on 7/8/22.
//

import SwiftUI

struct ContentView: View {
  @StateObject var manager = APIManager()
  @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
  
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
              Text(user.name ?? "Unknown")
            }
          }
        }
      }
      .task {
        await manager.loadData()
      }
      .navigationTitle("FriendFace")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
