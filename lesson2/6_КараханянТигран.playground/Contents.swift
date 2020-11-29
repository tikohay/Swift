import UIKit

var array: [Int] = Array(2...100)
var p = array.first!

func deleteEveryNElement() {
    var numToRemove = 0
    var i = 2
    
    for _ in array {
        numToRemove = i * p

        if array.firstIndex(of: numToRemove) != nil {
            array.remove(at: array.firstIndex(of: numToRemove)!)
        }
        i += 1
    }
}

var x = 0

while (pow(Double(x), 2) <= Double(array.count)) {
    deleteEveryNElement()
    x += 1
    p += 1
}

print(array)


