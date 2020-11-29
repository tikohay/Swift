import UIKit

var deposit = 5.0
var percent = 2.0
var percentage: Double
var i = 0

for _ in 1...5 {
    percentage = (deposit / 100) * percent
    deposit = deposit + percentage
}

print("Сумма вашего вкалада равна", String(format: "%.2f", deposit))
