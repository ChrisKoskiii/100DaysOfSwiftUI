//
//  ContentView.swift
//  MilestoneHabitTracker
//
//  Created by Christopher Koski on 6/19/22.
//

import SwiftUI

struct ContentView: View {
  @StateObject var vm = ActivitiesViewModel()
  
  @State private var showingSheet = false
  
  var body: some View {
    NavigationView {
      List(vm.activities) { activity in
        NavigationLink {
          DetailView(vm: vm, activity: activity)
        } label: {
          HStack {
            Text(activity.title)
            Spacer()
            Text(String(activity.timesCompleted))
              .font(.caption)
              .padding(5)
              .frame(minWidth: 50)
              .background(color(for: activity))
              .clipShape(Capsule())
            
          }
        }
      }
      .navigationTitle("Habits")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            showingSheet.toggle()
          } label: {
            Image(systemName: "plus")
          }
        }
      }
    }
    .onAppear(perform: loadData)
    .sheet(isPresented: $showingSheet) {
      AddView(vm: vm)
    }
  }
  
  func loadData() {
    if let savedItems = UserDefaults.standard.object(forKey: "activities") as? [Activity] {
      vm.activities.append(contentsOf: savedItems)
    }
  }
  
  func delete(at offsets: IndexSet) {
    vm.activities.remove(atOffsets: offsets)
  }
  
  func color(for activity: Activity) -> Color {
    if activity.timesCompleted < 3 {
      return .red
    } else if activity.timesCompleted < 10 {
      return .orange
    } else if activity.timesCompleted < 20 {
      return .green
    } else if activity.timesCompleted < 30 {
      return .blue
    } else {
      return .indigo
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
