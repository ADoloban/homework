import UIKit

/*
 Создать в playground такую иерархию классов, чтобы хотя бы по одному разу использовать каждый из существующих типов
 инициализаторов. Добавить деинициализатор.
 */

class Vehicle {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    required init() {
        self.brand = "Unknown"
    }
    
    deinit {
        print("\(brand) is being deallocated")
    }
}

class Car: Vehicle {
    var numberOfDoors: Int
    
    init(brand: String, doors: Int) {
        self.numberOfDoors = doors
        super.init(brand: brand)
    }
    
    required init() {
        self.numberOfDoors = 4
        super.init()
    }
    
    override init(brand: String) {
        self.numberOfDoors = 4
        super.init(brand: brand)
    }
    
    convenience init(doors: Int) {
        self.init(brand: "Unknown", doors: doors)
    }
    
    deinit {
        print("Car with \(numberOfDoors) doors is being deallocated")
    }
}


class ElectricCar: Car {
    var batteryCapacity: Double
    
    init(brand: String, doors: Int, batteryCapacity: Double) {
        self.batteryCapacity = batteryCapacity
        super.init(brand: brand, doors: doors)
    }
    
    required init() {
        self.batteryCapacity = 0.0
        super.init()
    }
    
    deinit {
        print("Electric car with battery capacity \(batteryCapacity) is being deallocated")
    }
}


let car = Car()
