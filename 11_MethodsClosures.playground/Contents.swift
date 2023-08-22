import UIKit

// MARK: - 🏠 Домашнее задание.

// TODO: - 🧑‍💻
/*
 Напишите замыкание, которое принимает 2 числа, а возвращает сумму их сложения. Присвойте замыкание переменной и вызовите его.
 */

let multiplyClosure = { (a: Double, b: Double) -> Double in
    return a + b
}

multiplyClosure(3,8)

/*
 Объявите строку произвольного значения. Отсортируйте ее по возрастанию, используя sorted и синтаксис последующего замыкания.
 */

let randomString = "London is the capital of Great Britain"

randomString.sorted(by: <)

/*
 Напишите функцию, которая принимает замыкание и ничего не возвращает. Замыкание тоже ничего не возвращает и не принимает.
 Функция должна посчитать от 1 до 5, каждый раз печатая номер итерации.
 После завершения цикла, вызовите замыкание.
 При вызове функции добавьте в замыкание print("Closure").
 Обратите внимание на порядок выполнения кода.
 */

func printNumber(closure: () -> Void) {
    for i in 1...5 {
        print(i)
    }
    closure()
}

printNumber { print("Closure") }

/*
 Напишите функцию modify, которая принимает массив типа Int и замыкание типа (Int) -> Int. Функция должна возвращать массив типа Int. Напишите реализацию функции, в которой замыкание будет вызвано для каждого элемента массива и будет этот элемент неким образом преобразовывать. Верните из функции массив, состоящий из элементов возвращенных замыканием.
 Вызовите функцию modify и напишите реализацию замыкания, пусть замыкание возвращает элемент умноженный на 2.
 */

let numbers = [4, 8, 5, -3, 2, -4]

let addFive = { $0 + 5 }

func modify(array: [Int], closure: (Int) -> Int) -> [Int] {
    let modifyArray = array.map{ closure($0) }
    return modifyArray
}

let newNumbers = modify(array: numbers, closure: addFive)

/*
 Создайте класс Task. Объявите в нем свойство reloadData опционального типа (([String]) -> Void)?.
 Добавьте в класс метод get, который будет генерировать массив из 5 случайных чисел в любом промежутке и передавать в свойство reloadData полученный массив, но с элементами типа String. Чтобы вызвать опциональное замыкание, поставьте знак вопроса после названия свойства и перед круглыми скобками с параметрами типа closure?(parameters)
 Создайте экземпляр этого класса, присвойте свойству reloadData замыкание, которое будет распечатывать в консоль каждый элемент массива.
 Вызовите метод get.
 */

class Task {
    let reloadData: (([String]) -> Void)?
    
    func get(){
        var number: Int
        var numbersArray = [String]()
        for _ in 1...5 {
            number = Int.random(in: -100...100)
            numbersArray.append(String(number))
        }
        reloadData?(numbersArray)
    }
    
    init(reloadData: (([String]) -> Void)?) {
        self.reloadData = reloadData
    }
}

let task = Task(reloadData: { print($0) })

task.get()

/* Дополнительное задание по желанию
 
 Создайте структуру Car со свойствами brand, number, isBroken (false по умолчанию).
 Добавьте инициализатор и метод move, который будет печать "move" если машина не сломана или сообещние о том, что машина сломана, если она сломана.
 
 Создайте класс Autoservice со свойством cars, которое будет хранить экземпляры машин, приехавших на ремонт.
 Добавьте в свойство cars наблюдателя, чтобы при изменении значения печатать в консоль информацию о том, что такая-то машина с таким-то номером принята в ремонт либо выдана из ремонта.
 Добавьте в класс Autoservice функцию fix, которая будет принимать в качестве параметров Car и замыкание (ничего не принимающее и ничего не возвращающее).
 
 Внутри функции выполните задержку в 3 секунды, сымитировав процесс ремонта. Для задержки используйте следующий код:
 
 DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
 // Это замыкание, которое вызывается после задержки в 3 сек. Вызовете здесь замыкание, которое функция принимает как параметр.
 }
 
 Не забудьте при принятии машины в ремонт добавить ее в свойство cars, а после выполнения ремонта - удалить.
 
 Создайте класс Person. В классе должны быть свойства name, car, service.
 Добавьте инициализатор.
 Добавьте метод goToHome, который будет обращаться к экземпляру машины и вызывать метод move.
 Добавьте метод goToService, который будет обращаться к экземпляру сервиса и вызывать метод fix. По завершении ремонта пометьте, что машина больше не сломана, изменив значение isBrocken на false.
 
 Проинициализируйте экземпляры классов, сначала Autoservice, потом Car, потом Person.
 У person вызовите метод goToHome()
 Обратитесь к экземпляру Car и сломайте машину.
 У person вызовите метод goToService() и следом goToHome().
 Разберитесь в порядке выполнения кода.
 
 */

struct Car {
    let brand: String
    let number: String
    var isBroken = false
    
    init(brand: String, number: String){
        self.brand = brand
        self.number = number
    }
    
    func move(){
        if isBroken {
            print("Car is broken")
        } else {
            print("Move")
        }
    }
}

class Autoservice{
    var cars: [Car] = [] {
        didSet {
            if let car = cars.last {
                if car.isBroken {
                    print("Car with number \(car.number) has been taken for repair.")
                } else {
                    print("Car with number \(car.number) has been repaired and returned.")
                }
            }
        }
    }
    
    func fix(car: Car, closure: @escaping () -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            closure()
        }
    }
}

class Person {
    let name: String
    var car: Car
    let service: Autoservice
    
    init(name: String, car: Car, service: Autoservice){
        self.name = name
        self.car = car
        self.service = service
    }
    
    func goToHome(){
        car.move()
    }
    
    func goToService(){
        service.cars.append(car)
        service.fix(car: car, closure: { print("Car is repaired")})
        service.cars.remove(at: 0)
        car.isBroken = false
    }
}

let person = Person(name: "Tom", car: Car(brand: "BMW", number: "SDR351"), service: Autoservice())
person.goToHome()
person.car.isBroken = true
person.goToService()
person.goToHome()

/*
 TODO: - ❓ Вопросы к изучению:
 - Что такое методы?
 - Что такое closures?
 - Как используются trailing closures?
 - В чем особенность захвата значений внутри замыкания?
 - Что такое escaping closures (сбегающие замыкания)?
 - Как используются автозамыкания?
 */

