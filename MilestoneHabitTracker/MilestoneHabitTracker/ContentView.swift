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
          DetailView(name: activity.title, description: activity.description, timesCompleted: activity.timesCompleted)
        } label: {
          Text(activity.title)
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
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
