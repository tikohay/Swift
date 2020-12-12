import UIKit

enum EngineState {
    case run
    case stop
}
enum WindowState {
    case open
    case close
}
enum CargoState {
    case load
    case unload
}
enum TuningState {
    case yes
    case no
}
enum Speed {
    case speedUp
    case speedDown
}

protocol Car {
    var brand: String { get }
    var year: Int { get }
    var isEngineState: EngineState { get set }
    var isWindowState: WindowState { get set }

    mutating func changeWindowState(action: WindowState)
    mutating func changeEngineState(action: EngineState)
}

extension Car {
    mutating func changeWindowState(action: WindowState) {
        switch action {
        case .open:
            self.isWindowState = .open
        case .close:
            self.isWindowState = .close
        }
    }

    mutating func changeEngineState(action: EngineState) {
        switch action {
        case .run:
            self.isEngineState = .run
        case .stop:
            self.isEngineState = .stop
        }
    }
}


class SportCar: Car {
    var brand: String
    var year: Int
    var isEngineState: EngineState
    var isWindowState: WindowState
    var tuning: TuningState
    var speed = 0
    var maximumSpeed: Int
    
    init(
        brand: String,
        year: Int,
        isEngineState: EngineState,
        isWindowState: WindowState,
        tuning: TuningState,
        maximumSpeed: Int
    ) {
        self.brand = brand
        self.year = year
        self.isEngineState = isEngineState
        self.isWindowState = isWindowState
        self.tuning = tuning
        self.maximumSpeed = maximumSpeed
    }
    
    func changeSpeed(action: Speed, value: Int) {
        switch action {
        case .speedUp:
            self.speed = checkSpeed(speed: value)
        case .speedDown:
            self.speed = checkSpeed(speed: -value)
        }
    }

    func changeTuningState(action: TuningState) {
        switch action {
        case .yes:
            self.tuning = .yes
        case .no:
            self.tuning = .no
        }
    }
    
    private func checkSpeed(speed: Int) -> Int {
        let newSpeed = self.speed + speed
        
        if (newSpeed > self.maximumSpeed) {
            return self.maximumSpeed
        } else if (newSpeed < 0) {
            return 0
        }
        return newSpeed
    }
}

class TrunkCar: Car {
    var brand: String
    var year: Int
    var isEngineState: EngineState
    var isWindowState: WindowState
    var carrying: Double
    var cargoWeight: Double {
        willSet {
            if (newValue > self.carrying) {
                print("Ваш груз превышает норму на \(newValue - carrying)")
            }
        }
    }
    
    init(
        brand: String,
        year: Int,
        isEngineState: EngineState,
        isWindowState: WindowState,
        carrying: Double,
        cargoWeight: Double
    ) {
        self.brand = brand
        self.year = year
        self.isEngineState = isEngineState
        self.isWindowState = isWindowState
        self.carrying = carrying
        self.cargoWeight = cargoWeight
    }
    
    func changeCargoWeight(action: CargoState, value: Double) {
        switch action {
        case .load:
            self.cargoWeight = self.cargoWeight + value
        case .unload where self.cargoWeight >= value:
            self.cargoWeight = self.cargoWeight - value
        default:
            self.cargoWeight = 0
        }
    }
}


extension SportCar: CustomStringConvertible {
    var description: String {
        return "sport car: \(brand)\nгод выпуска: \(year)\nдвигатель: \(isEngineState)\nстекло: \(isWindowState)\nмаксимальная скорость: \(maximumSpeed)\nскорость: \(speed)"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Trunk car: \(brand)\nгод выпуска: \(year)\nдвигатель: \(isEngineState)\nстекло: \(isWindowState)\nгрузоподъемность: \(carrying)\nвес груза: \(cargoWeight)"
    }
}


var bmw = SportCar(
    brand: "BMW",
    year: 2020,
    isEngineState: .run,
    isWindowState: .close,
    tuning: .no,
    maximumSpeed: 320
)

bmw.changeSpeed(action: .speedUp, value: 400)
bmw.changeTuningState(action: .yes)
bmw.changeEngineState(action: .stop)
bmw.changeWindowState(action: .open)


var mercedes = SportCar(
    brand: "Mercedes",
    year: 2019,
    isEngineState: .run,
    isWindowState: .close,
    tuning: .no,
    maximumSpeed: 300
)

mercedes.changeSpeed(action: .speedUp, value: 200)
mercedes.changeTuningState(action: .yes)
mercedes.changeEngineState(action: .stop)
mercedes.changeWindowState(action: .open)


var opel = TrunkCar(
    brand: "Opel",
    year: 2015,
    isEngineState: .run,
    isWindowState: .open,
    carrying: 3500,
    cargoWeight: 1000
)

opel.changeCargoWeight(action: .load, value: 1000)
opel.changeEngineState(action: .run)
opel.changeWindowState(action: .close)


var peugeot = TrunkCar(
    brand: "Peugeot",
    year: 2011,
    isEngineState: .run,
    isWindowState: .open,
    carrying: 4000,
    cargoWeight: 2000
)

peugeot.changeCargoWeight(action: .load, value: 2000)
peugeot.changeEngineState(action: .stop)
peugeot.changeWindowState(action: .open)


var carsArray: [Car] = [bmw, mercedes, opel, peugeot]

for car in carsArray {
    print("\(car)\n")
}
