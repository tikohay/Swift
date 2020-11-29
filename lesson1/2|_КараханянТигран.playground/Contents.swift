import UIKit

var a = 2
var b = 4
var c: Int //- гипотенуза
var s: Int
var p: Int

s = (a * b) / 2
c = Int(pow(Double(a), 2)) + Int(pow(Double(b), 2))
p = a + b + c

print("Площадь =", s, "Гипотенуза =", c, "Периметр =", p)
