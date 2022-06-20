//
//  AddView.swift
//  MilestoneHabitTracker
//
//  Created by Christopher Koski on 6/19/22.
//

import SwiftUI

struct AddView: View {
  @Environment(\.presentationMode) var presentationMode
  
  @State private var activityName: String = ""
  @State private var activityDescription: String = ""
  
  @ObservedObject var vm: ActivitiesViewModel
  
  var body: some View {
    ZStack {
      Form {
        Section {
          TextField("Activity Name", text: $activityName)
        } header: {
          Text("Add an Activity")
        }
        Section {
          TextEditor(text: $activityDescription)
        } header: {
          Text("Description")
        }
      }
      VStack {
        Spacer()
        Button {
          createNewItem(itemName: activityName, itemDescription: activityDescription)
          presentationMode.wrappedValue.dismiss()
        } label: {
          Text("Add item")
        }
      }
    }
  }
  
  func createNewItem(itemName: String, itemDescription: String) {
    let trimmedTitle = itemName.trimmingCharacters(in: .whitespaces)
    guard trimmedTitle.isEmpty == false else { return }
    let newItem = Activity(title: trimmedTitle, description: itemDescription)
    vm.activities.append(newItem)
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    AddView(vm: ActivitiesViewModel())
  }
}
