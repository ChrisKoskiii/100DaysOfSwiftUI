//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Christopher Koski on 6/22/22.
//

import Foundation
import SwiftUI

struct AddressView: View {
  @ObservedObject var order: SharedOrder
  
  var body: some View {
    Form {
      Section {
        TextField("Name", text: $order.data.name)
        TextField("Street Address", text: $order.data.streetAddress)
        TextField("City", text: $order.data.city)
        TextField("Zip", text: $order.data.zip)
      }
      
      Section {
        NavigationLink {
          CheckoutView(order: order)
        } label: {
          Text("Checkout")
        }
      }
      .disabled(order.data.hasValidAddress == false)
    }
  }
}

struct AddressView_Previews: PreviewProvider {
  static var previews: some View {
    AddressView(order: SharedOrder())
  }
}
