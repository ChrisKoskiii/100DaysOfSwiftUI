import UIKit

struct Car {
  let model: String
  let seats: Int
  var currentGear = 1
  
  mutating func changeGear(difference: Int) {
      let newGear = currentGear + difference

      if newGear > 1 && newGear <= 10 {
          currentGear = newGear
      }
  }
}

var Nissan = Car(model: "xTerra", seats: 5)
Nissan.changeGear(difference: 3)
Nissan.currentGear



