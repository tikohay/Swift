import UIKit

var numbersOfFibonacci: [Decimal] = [0, 1]

func fibonacci() {
    let lastIndex = numbersOfFibonacci.count - 1
    let newNumber = numbersOfFibonacci[lastIndex] + numbersOfFibonacci[lastIndex - 1]
    
    numbersOfFibonacci.append(newNumber)
}

for _ in 0...99 {
    fibonacci()
}

print(numbersOfFibonacci)



