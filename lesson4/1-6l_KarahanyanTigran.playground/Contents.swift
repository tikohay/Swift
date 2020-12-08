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

enum SportCarAction {
    case engine(EngineState)
    case window(WindowState)
    case tuning(TuningState)
    case speed(Speed)
}

enum TrunkCarAction {
    case engine(EngineState)
    case window(WindowState)
    case cargo(CargoState)
}

class Car {
    var color: UIColor
    var brand: String
    var year: Int
    var isEnginRunning: EngineState
    var isWindowOpen: WindowState
    static var countOfCar = 0
    static var releasedCar = 0
    static var numDecommissionedCars = 0
    
    init(
        color: UIColor,
        brand: String,
        year: Int,
        isEngineRunning: EngineState,
        isWindowOpen: WindowState
    ) {
        self.color = color
        self.brand = brand
        self.year = year
        self.isEnginRunning = isEngineRunning
        self.isWindowOpen = isWindowOpen
        Car.releasedCar += 1
        Car.countOfCar += 1
        self.congratulation()
    }
    
    deinit {
        Car.numDecommissionedCars += 1
        Car.countOfCar -= 1
    }
    
    func congratulation() {
        print("Поздравляем с приобретением новой машины")
    }
    
    static func carCount() {
        print("количество выпущенных машин - \(Car.releasedCar)\nколичество списанных машин - \(Car.numDecommissionedCars)\nколичество машин - \(Car.countOfCar)\n")
    }
}


class SportCar: Car {
    var maximumSpeed: Int
    var numOfDoor: Int
    var tuning: TuningState
    var speed: Int = 0
    
    init(
        color: UIColor,
        brand: String,
        year: Int,
        isEngineRunning: EngineState,
        isWindowOpen: WindowState,
        maxumumSpeed: Int,
        numOfDoor: Int,
        tuning: TuningState
    ) {
        self.maximumSpeed = maxumumSpeed
        self.numOfDoor = numOfDoor
        self.tuning = tuning
        
        super.init(
            color: color,
            brand: brand,
            year: year,
            isEngineRunning: isEngineRunning,
            isWindowOpen: isWindowOpen
        )
    }
    
    override func congratulation() {
        super.congratulation()
        print("Ваш спорткар \(self.brand) готов к использованию\n")
    }
    
    func change(action: SportCarAction, value: Int = 10) {
        switch action {
        case .engine(.run):
            self.isEnginRunning = .run
        case .engine(.stop):
            self.isEnginRunning = .stop
        case .window(.open):
            self.isWindowOpen = .open
        case .window(.close):
            self.isWindowOpen = .close
        case .tuning(.yes):
            self.tuning = .yes
        case .tuning(.no):
            self.tuning = .no
        case .speed(.speedUp):
            self.speed = self.checkSpeed(speed: value)
        case .speed(.speedDown):
            self.speed = self.checkSpeed(speed: -value)
        }
    }
    
    private func checkSpeed(speed: Int) -> Int {
        let newSpeed = self.speed + speed;

        if newSpeed < 0 {
            return 0
        } else if newSpeed > self.maximumSpeed {
            return self.maximumSpeed
        }
        return newSpeed
    }
}


class TrunkCar: Car {
    var carrying: Double
    var сargoWeight: Double {
        willSet {
            if newValue > carrying {
                print("Ваш груз превышает норму на \(newValue - carrying) кг!\n")
            }
        }
    }
    
    init(
        color: UIColor,
        brand: String,
        year: Int,
        volumeOfTrunc: Double,
        isEngineRunning: EngineState,
        isWindowOpen: WindowState,
        carrying: Double,
        cargoWeight: Double
    ) {
        
        self.carrying = carrying
        self.сargoWeight = cargoWeight
        
        super.init(
            color: color,
            brand: brand,
            year: year,
            isEngineRunning: isEngineRunning,
            isWindowOpen: isWindowOpen
        )
    }
    
    override func congratulation() {
        super.congratulation()
        print("Ваш грузовой автомобиль \(self.brand) готов к использованию\n")
    }
    
    func change(action: TrunkCarAction, value: Double = 10){
        switch action {
        case .engine(.run):
            self.isEnginRunning = .run
        case .engine(.stop):
            self.isEnginRunning = .stop
        case .window(.open):
            self.isWindowOpen = .open
        case .window(.close):
            self.isWindowOpen = .close
        case .cargo(.load):
            self.сargoWeight = self.сargoWeight + value
        case .cargo(.unload) where value < self.сargoWeight:
            self.сargoWeight = self.сargoWeight - value
        default:
            self.сargoWeight = 0
        }
    }
}


var sportCar = SportCar(
    color: .black,
    brand: "BMW",
    year: 2020,
    isEngineRunning: .run,
    isWindowOpen: .close,
    maxumumSpeed: 300,
    numOfDoor: 2,
    tuning: .yes
)

sportCar.change(action: .engine(.stop))
sportCar.change(action: .speed(.speedUp), value: 400)
sportCar.change(action: .engine(.run))
sportCar.maximumSpeed = 200
sportCar.change(action: .engine(.run))
sportCar.change(action: .tuning(.no))

print("""
    Sport car: \(sportCar.brand)
    цвет: \(sportCar.color)
    год: \(sportCar.year)
    двигатель: \(sportCar.isEnginRunning)
    окно: \(sportCar.isWindowOpen)
    максимальная скорость: \(sportCar.maximumSpeed)
    количество дверей: \(sportCar.numOfDoor)
    тюнинг: \(sportCar.tuning)\n
    """)


var trunkCar = TrunkCar(
    color: .brown,
    brand: "Mercedes",
    year: 1995,
    volumeOfTrunc: 3,
    isEngineRunning: .run,
    isWindowOpen: .open,
    carrying: 1000,
    cargoWeight: 1000
)


trunkCar.change(action: .engine(.stop))
trunkCar.сargoWeight
trunkCar.carrying = 4000
trunkCar.change(action: .cargo(.load), value: 4100)
trunkCar.сargoWeight

print("""
    Trunk car: \(trunkCar.brand)
    цвет: \(trunkCar.color)
    год: \(trunkCar.year)
    двигатель: \(trunkCar.isEnginRunning)
    окно: \(trunkCar.isWindowOpen)
    грузоподъемность: \(trunkCar.carrying)
    вес груза: \(trunkCar.сargoWeight)\n
    """
)

var opel: Car? = Car(color: .black, brand: "Opel", year: 2, isEngineRunning: .run, isWindowOpen: .open)

opel = nil

Car.carCount()
