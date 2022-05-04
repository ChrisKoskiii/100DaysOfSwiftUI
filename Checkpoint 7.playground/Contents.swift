import UIKit
import Darwin


class Animal {
  var legs: Int
  
  init(legs: Int) {
    self.legs = legs
  }
}

class Dog: Animal {
  func speak() {
    print("Bark Bark Bark")
  }
}

class Cat: Animal {
  var isTame: Bool
  
  init(isTame: Bool, legs: Int) {
    self.isTame = isTame
    super.init(legs: legs)
  }
  
  func speak() {
    "Purrrr Meow"
  }
}

class Corgi: Dog {
  override func speak() {
    "Barkity Bark"
  }
}

class Poodle: Dog {
  override func speak() {
    "Yap Yap Yappity Yap"
  }
}

class Persian: Cat {
  override func speak() {
    "Rahhhh"
  }
}

class Lion: Cat {
  override func speak() {
    "ROAAARR"
  }
}
