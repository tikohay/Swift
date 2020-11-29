import UIKit

//первое задание
func isEvenNumber(a: Int) -> Bool {
   return (a % 2) == 0
}

//второе задание
func isDivisibleByThree(a: Int) -> Bool {
    return (a % 3) == 0
}

//третье задание
func createIncreasingArray() -> [Int] {
    var arrayOfNumbers: [Int] = []
    
    for num in 1...100 {
        arrayOfNumbers.append(num)
    }
    return arrayOfNumbers
}

var arrayOfNumbers: [Int] = createIncreasingArray()

print("третье задание:", arrayOfNumbers)

//четвертое задание
for i in arrayOfNumbers where (isEvenNumber(a: i) || !isDivisibleByThree(a: i)) {
    arrayOfNumbers.remove(at: arrayOfNumbers.firstIndex(of: i)!)
}

print("четвертое задание:", arrayOfNumbers)
