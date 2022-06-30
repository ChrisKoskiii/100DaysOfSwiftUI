//
//  Order.swift
//  CupcakeCorner
//
//  Created by Christopher Koski on 6/22/22.
//

import Foundation

class SharedOrder: ObservableObject {
  @Published var data = Order()
  
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
}

struct Order: Codable {
  var hasValidAddress: Bool {
    if name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zip.isReallyEmpty {
      return false
    }
    return true
  }
  
  var cost: Double {
    //$2 per cake
    var cost = Double(quantity) * 2
    
    //Complicated cakes cost more
    cost += (Double(type) / 2)
    
    // $1/cake for extrafrosting
    if extraFrosting {
      cost += Double(quantity)
    }
    
    // $0.50/cake for sprinkles
    if addSprinkles {
      cost += Double(quantity) / 2
    }
    
    return cost
  }
  
  var type = 0
  var quantity = 3
  
  var specialRequestEnabled = false {
    didSet {
      if specialRequestEnabled == false {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
  var extraFrosting = false
  var addSprinkles = false
  
  var name = ""
  var streetAddress = ""
  var city = ""
  var zip = ""
  
  enum CodingKeys: CodingKey {
    case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
  }
}



















