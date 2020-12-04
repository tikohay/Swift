import UIKit

enum EngineState {
    case stop
    case run
}

enum WindowState {
    case open
    case close
}

enum TruncState {
    case load
    case unload
}

enum CarActions {
    case engine(EngineState)
    case windows(WindowState)
    case trunc(TruncState)
}

struct SportCar {
    var carBrand: String
    var year: Int
    var truncVolume: Double
    var isEngineRunning: EngineState
    var isWindowOpen: WindowState
    var filledTrunc: Double
    var volumeСargo: Double {
        willSet {
            print("ваш груз в машине \(carBrand) составляет: \(newValue) кг \n")
        }
    }
    
    mutating func makeAction(action: CarActions, value: Double = 0) {
        switch action {
        case .engine(.run):
            self.isEngineRunning = .run
        case .engine(.stop):
            self.isEngineRunning = .stop
            
        case .windows(.open):
            self.isWindowOpen = .open
        case .windows(.close):
            self.isWindowOpen = .close
            
        case .trunc(.load):
            self.volumeСargo -= value
        case .trunc(.unload):
            self.volumeСargo += value
        }
    }
}

struct TrunkCar {
    var carBrand: String
    var year: Int
    var truncVolume: Double
    var isEngineRunning: EngineState
    var isWindowOpen: WindowState
    var filledTrunc: Double
    var volumeСargo: Double {
        willSet {
            print("ваш груз в машине \(carBrand) составляет: \(newValue) кг\n")
        }
    }
    
    mutating func makeAction(action: CarActions, value: Double = 0) {
        switch action {
        case .engine(.run):
            self.isEngineRunning = .run
        case .engine(.stop):
            self.isEngineRunning = .stop
            
        case .windows(.open):
            self.isWindowOpen = .open
        case .windows(.close):
            self.isWindowOpen = .close
            
        case .trunc(.load):
            self.volumeСargo -= value
        case .trunc(.unload):
            self.volumeСargo += value
        }
    }
}

var sportCar = SportCar(
    carBrand: "Mercedes",
    year: 2015,
    truncVolume: 300,
    isEngineRunning: .run,
    isWindowOpen: .close,
    filledTrunc: 1000,
    volumeСargo: 1000
)

sportCar.makeAction(action: .trunc(.load), value: 10)
sportCar.makeAction(action: .engine(.run))
sportCar.makeAction(action: .windows(.open))

print("""
    sport car: \(sportCar.carBrand)
    год выпуска: \(sportCar.year)
    объем багажника: \(sportCar.truncVolume)
    двигатель заведен: \(sportCar.isEngineRunning)
    окна открыты: \(sportCar.isWindowOpen)
    вместительность багажника: \(sportCar.filledTrunc)
    объем заполненного груза: \(sportCar.volumeСargo)\n
    """)
    

var trunkCar = TrunkCar(
    carBrand: "Peugeuat",
    year: 2020,
    truncVolume: 1000,
    isEngineRunning: .run,
    isWindowOpen: .close,
    filledTrunc: 2000,
    volumeСargo: 1500
)

trunkCar.filledTrunc = 3000
trunkCar.makeAction(action: .trunc(.unload), value: 20)
trunkCar.makeAction(action: .engine(.run))
trunkCar.makeAction(action: .windows(.open))

print("""
    trunk car: \(trunkCar.carBrand)
    год выпуска: \(trunkCar.year)
    объем багажника: \(trunkCar.truncVolume)
    двигатель заведен: \(trunkCar.isEngineRunning)
    окна открыты: \(trunkCar.isWindowOpen)
    вместительность багажника: \(trunkCar.filledTrunc)
    объем заполненного груза: \(trunkCar.volumeСargo)
    """)





