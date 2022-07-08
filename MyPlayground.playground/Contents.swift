func printSorted(_ array: [Int]) {
  // 1
  guard !array.isEmpty else { return }

  // 2
  var currentCount = 0
  var minValue = Int.min

  // 3
  for value in array {
    if value == minValue {
      print(value)
      currentCount += 1
    }
  }

  while currentCount < array.count {

    // 4
    var currentValue = array.max()!

    for value in array {
      if value < currentValue && value > minValue {
        currentValue = value
      }
    }

    // 5
    for value in array {
      if value == currentValue {
        print(value)
        currentCount += 1
      }
    }

    // 6
    minValue = currentValue
  }
}

let myInts = [4,5,4,3,12,4,56,3,2]
printSorted(myInts)
print(Int.min)
print(Int.max)
