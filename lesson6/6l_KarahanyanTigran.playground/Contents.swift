import UIKit


var even: (Int) -> Bool = { (n: Int) -> Bool in
    return n % 2 == 0
}

var odd: (Int) -> Bool = { (n: Int) -> Bool in
    return n % 2 != 0
}

var prefix: (String, String) -> Bool = { (str: String, char: String) -> Bool in
    return str.uppercased().hasPrefix("\(char.uppercased())")
}

var suffix: (String, String) -> Bool = { (str: String, char: String) -> Bool in
    return str.uppercased().hasSuffix("\(char.uppercased())")
}


class Queue<T> {
    
    private var array: [T] = []
    
    func addElements(_ element: [T]) {
        array.append(contentsOf: element)
    }
    
    func deleteElement() -> T? {
        guard !array.isEmpty else { return nil }
        return array.removeFirst()
    }
    
    func filter(predicate: (T) -> Bool) -> [T] {
        var filteredArray: [T] = []

        for element in array where predicate(element) {
            filteredArray.append(element)
        }

        return filteredArray
    }
    
    func findWords(with: Character, in predicate: (String, String) -> Bool) -> [String] {
        var namesArray: [String] = []
        
        for name in array where predicate(name as! String, String(with)) {
            namesArray.append(name as! String)
        }
        return namesArray
    }
    
    subscript(index: Int) -> T? {
        guard index < self.array.count else { return nil }
        
        return array[index]
    }
}


var a = Queue<Int>()

a.addElements([1, 3, 4, 2, 1, 6, 2])
a.filter(predicate: even)
a.filter(predicate: odd)
a[1]
a[7]

var b = Queue<String>()
b.addElements(["Jacob", "Anna", "Peter", "Jane"])

b.findWords(with: "j", in: prefix)
b.findWords(with: "r", in: suffix)
