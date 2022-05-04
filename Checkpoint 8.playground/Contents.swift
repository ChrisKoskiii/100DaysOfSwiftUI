import UIKit

protocol Building {
  var rooms: Int { get set }
  var price: Int { get set }
  var agent: String { get set }
  
  func salesSummary(rooms: Int, price: Int, agent: String) -> String
}

struct House: Building {
  var rooms = 5
  
  var price = 400000
  
  var agent: "Chris Koski"
  
  func salesSummary(rooms: Int, price: Int, agent: String) -> String {
    <#code#>
  }
  
  
}

struct Office: Building {
  
}
