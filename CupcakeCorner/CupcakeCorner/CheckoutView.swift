//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Christopher Koski on 6/22/22.
//

import SwiftUI

struct CheckoutView: View {
  @ObservedObject var order: SharedOrder
  @State private var confirmationMessage = ""
  @State private var showingConfirmation = false
  @State private var showingNoConnection = false
  var body: some View {
    ScrollView {
      VStack {
        AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
          image
            .resizable()
            .scaledToFit()
        } placeholder: {
          ProgressView()
        }
        .frame(height: 233)
        
        Text("Your total is \(order.data.cost, format: .currency(code: "USD"))")
          .font(.title)
        
        Button("Place Order") {
          Task {
            await placeOrder()
          }
        }
        .padding()
      }
    }
    .alert("Thank you!", isPresented: $showingConfirmation) {
      Button("OK") { }
    } message: {
      Text(confirmationMessage)
    }
    .alert("No internet connection, please try again.", isPresented:  $showingNoConnection) {
      Button("OK") { }
    }
  }
  
  func placeOrder() async {
    //1. Convert order object to JSON
    guard let encoded = try? JSONEncoder().encode(order.data) else {
      print("Failed to encode order")
      return
    }
    
    //2. Tell swift how to send over a network
    let url = URL(string: "https://reqres.in/api/cupcakes")!
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    
    //3. Run the request and process response
    do {
      let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
      let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
      confirmationMessage = "Your order for \(decodedOrder.quantity)x \(SharedOrder.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
      showingConfirmation = true
    } catch {
      showingNoConnection = true
      print("Checkout failed")
    }
  }
}

struct CheckoutView_Previews: PreviewProvider {
  static var previews: some View {
    CheckoutView(order: SharedOrder())
  }
}
