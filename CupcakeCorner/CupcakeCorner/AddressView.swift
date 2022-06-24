//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Christopher Koski on 6/22/22.
//

import Foundation
import SwiftUI

struct AddressView: View {
  @ObservedObject var order: Order
  
  var body: some View {
    Form {
      Section {
        TextField("Name", text: $order.name)
        TextField("Street Address", text: $order.streetAddress)
        TextField("City", text: $order.city)
        TextField("Zip", text: $order.zip)
      }
      
      Section {
        NavigationLink {
          CheckoutView(order: order)
        } label: {
          Text("Checkout")
        }
      }
      .disabled(order.hasValidAddress == false)
    }
  }
}

struct AddressView_Previews: PreviewProvider {
  static var previews: some View {
    AddressView(order: Order())
  }
}
