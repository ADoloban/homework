import UIKit

// MARK: - 🏠 Домашнее задание.

// TODO: - 🧑‍💻
/*
 Создайте класс Car. Наделите его свойствами и методами на ваше усмотрение.
 Класс должен содержать свойства, которые будут является типами перечислений. Подумайте, какие свойства удобнее объявлять как перечисления.
 Создайте 2 класса наследника - Sedan и Crossover (или другие типы автомобилей на ваше усмотрение)
 Добавьте в классы-наследники свойства, которые отличают ваши автомобили друг от друга. Напр. блокировка дифференциала, рама, привод 4х4 и др.
 В родительский класс добавьте метод start, который будет заводить вашу машину. Закройте этот метод от переопределения.
 В родительский класс добавьте метод setup, который будет задавать вашему авто какие либо характеристики.
 Переопределите метод setup в классах-наследниках.
 */

enum EngineType {
    case gasoline
    case diesel
    case electric
    case hybrid
}

enum DriveType {
    case frontWheel
    case rearWheel
    case allWheel
}

class Car {
    let brand: String
    let model: String
    let year: Int
    let driveType: DriveType
    let engineType: EngineType
    var color: String = ""
    var maxSpeed: Int = 0
    
    init(brand: String, model: String, year: Int, driveType: DriveType, engineType: EngineType) {
        self.brand = brand
        self.model = model
        self.year = year
        self.driveType = driveType
        self.engineType = engineType
    }
    
    final func start() {
        print("Starting the \(brand) \(model)")
    }
    
    func setup(){
        self.color = "white"
        self.maxSpeed = 210
    }
}

class Sedan: Car{
    var hasSpoiler: Bool
    
    init(brand: String, model: String, year: Int, driveType: DriveType, engineType: EngineType, hasSpoiler: Bool) {
        self.hasSpoiler = hasSpoiler
        super.init(brand: brand, model: model, year: year, driveType: driveType, engineType: engineType)
    }
    
    override func setup() {
        hasSpoiler = true
        super.setup()
    }
}

class Crossover: Car {
    var hasDifferentialLock: Bool
    
    init(brand: String, model: String, year: Int, driveType: DriveType, engineType: EngineType, hasDifferentialLock: Bool) {
        self.hasDifferentialLock = hasDifferentialLock
        super.init(brand: brand, model: model, year: year, driveType: driveType, engineType: engineType)
    }
    
    override func setup(){
        hasDifferentialLock = true
        color = "black"
        maxSpeed = 150
    }
}

/*
 TODO: - ❓ Вопросы к изучению:
 - Что значит наследование?
 - Какой класс называется базовым или суперклассом, какой подклассом наследником?
 - В чем заключается механизм переопределения? Что мы можем переопределять?
 - Как запретить переопределение?
 - Как запретить наследование от класса?
 */

