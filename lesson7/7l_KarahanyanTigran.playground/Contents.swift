import UIKit

enum ErrorValue: Error {
    case valueIsNotExist
    case valueLessThanZero
}

class ShuffledArray {
    var array: [Int] = []
    
    init() {
        self.generateRandomArray();
        print(array)
    }
    
    func generateRandomArray() {
        for _ in 0...10 {
            let randomInt = Int.random(in: 1..<20)
            array.append(randomInt)
        }
    }
}

// 1 задание
class GuessNumGame: ShuffledArray {
    
    func guess(num: Int) -> (Int?, ErrorValue?) {
        
        guard num > 0 else { return (nil, ErrorValue.valueLessThanZero) }
          
        guard let index = array.firstIndex(of: num) else { return (nil, ErrorValue.valueIsNotExist) }
        
        return (index, nil)
    }
    
    func addNumberToArray(num: Int) -> (Int?, ErrorValue?) {
        guard num > 0 else { return (nil, ErrorValue.valueLessThanZero) }
        
        array.append(num)
        return (num, nil)
    }
}

// 2 задание
class GuessNumGameV2: ShuffledArray {
    
    func guess(num: Int) throws -> Int {
        
        guard num > 0 else { throw ErrorValue.valueLessThanZero }
        
        guard let index = array.firstIndex(of: num) else { throw ErrorValue.valueIsNotExist }
        
        return (index)
    }
    
    func addNumberToArray(num: Int) throws -> Int {
        guard num > 0 else { throw ErrorValue.valueLessThanZero }
        
        array.append(num)
        return num
    }
}


var player1 = GuessNumGame()

var (index, error) = player1.guess(num: 50)

if let index = index {
    print("Вы угадали! Ваше число находится под индексом \(index)")
} else if let error = error {
    switch error {
    case ErrorValue.valueIsNotExist:
        print("Число отсутствует в массиве")
    case ErrorValue.valueLessThanZero:
        print("Число не может быть меньше нуля")
    }
}


var player2 = GuessNumGameV2()

do {
    let index = try player2.guess(num: -8)
    print("Вы угадали! Ваше число находится под индексом \(index)")
} catch ErrorValue.valueIsNotExist {
    print("Число отсутствует в массиве")
} catch ErrorValue.valueLessThanZero {
    print("Число не может быть меньше нуля")
}

