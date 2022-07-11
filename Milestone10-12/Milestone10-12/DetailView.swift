//
//  DetailView.swift
//  Milestone10-12
//
//  Created by Christopher Koski on 7/10/22.
//

import SwiftUI

struct DetailView: View {
  var user: CachedUser

  var body: some View {
    List {
      HStack {
        VStack(alignment: .leading) {
          Text(user.name ?? "Unknown")
            .font(.title)
          Text("Age: \(user.age)")
            .font(.caption)
          Text(user.company ?? "Unknown")
            .font(.caption)
          Text(user.email ?? "Unknown")
            .font(.caption)
          Text(user.address ?? "Unknown")
            .font(.caption)
        }
        .padding(4)
        Spacer()
        VStack {
          VStack(spacing: 0) {
          Circle()
            .fill(user.isActive ? .green : .red)
            .frame(width: 20, height: 20)
            Text(user.isActive ? "Online" : "Offline")
              .font(.caption2)
          }
          .padding(.top, 4)
          Spacer()
        }
      }
      Text(user.about ?? "Unknown")
        .padding(4)
      Section("Friends") {
        ForEach(user.friendsArray) { friend in
          Text(friend.wrappedName)
        }
      }
    }
  }
}

//struct DetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    DetailView(user: User(id: "111", isActive: true, name: "Christopher Koski", age: 31, company: "Guy Next Door Window Cleaining", email: "ckoski18@gmail.com", address: "1512 Barrymore Ct, Wellington FL", about: "Im an iOS developer from south FL! Whats up!? Im an iOS developer from south FL! Whats up!? Im an iOS developer from south FL! Whats up!? Im an iOS developer from south FL! Whats up!? Im an iOS developer from south FL! Whats up!? Im an iOS developer from south FL! Whats up!? Im an iOS developer from south FL! Whats up!? Im an iOS developer from south FL! Whats up!? Im an iOS developer from south FL! Whats up!? Im an iOS developer from south FL! Whats up!?", registered: "Yeserday", tags: [], friends: []))
//  }
//}
