import UIKit

// MARK: - 🏠 Домашнее задание.

// TODO: - 🧑‍💻
// Создайте расширение для типа String и добавьте в него свойство trim, которое будет возвращать строку без пробелов вначале и конце. Такое расширение удобно использовать, если пользователь вводит какое-то значение, но при этом вначале и/или конце вставляет пробел. Нам нужно отсечь пробелы

extension String {
    var trim: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

// Добавьте в расширение для типа String метод truncate(length: Int), который отсечет лишние символы если строка длиннее чем length и заменит их на ...

extension String {
    func truncate(length: Int) -> Self {
        if self.count > length {
            let index = self.index(self.startIndex, offsetBy: length)
            return self[..<index] + "..."
        } else {
            return self
        }
    }
}

/* Создайте протокол EmployeeProtocol, который должен требовать реализовать свойства:
 - имя. Свойство доступно только для чтения
 - возраст
 - стаж работы
 - зарплата брутто
 - зарплата нетто
 
 Добавьте методы:
 - статический метод, выводящий в консоль информацию о названии класса
 - метод, выводящий в консоль всю информацию о работнике в читаемом виде
 */

protocol EmployeeProtocol {
    var name: String { get }
    var age: Int { get set }
    var experience: Int { get set }
    var grossSalary: Double { get set }
    var netSalary: Double { get }
    
    static func printClassName()
    func printInfo()
}

/* Напишите экстеншен для протокола и реализуйте свойство "зарплата нетто", которое должно вычисляться из зарплаты брутто - налог (21%).
 По возможности реализуйте требуемые методы.
 */

extension EmployeeProtocol {
    var netSalary: Double {
        return grossSalary * 0.79
    }
    
    static func printClassName() {
        print("This class implements employee.")
    }
    
    func printInfo() {
        print("Name: \(name)")
        print("Age: \(age)")
        print("Experience: \(experience)")
        print("Gross salary: \(grossSalary)")
        print("Net salary: \(netSalary)")
    }
}

// Создайте два класса Driver и Pilot, подчините их протоколу. Добавьте инициализаторы.

class Driver: EmployeeProtocol {
    var name: String
    var age: Int
    var experience: Int
    var grossSalary: Double
    var netSalary: Double {
        return grossSalary * 0.79
    }
    
    init(name: String,
         age: Int,
         experience: Int,
         grossSalary: Double) {
        self.name = name
        self.age = age
        self.experience = experience
        self.grossSalary = grossSalary
    }
}

class Pilot: EmployeeProtocol {
    var name: String
    var age: Int
    var experience: Int
    var grossSalary: Double
    var netSalary: Double {
        return grossSalary * 0.79
    }
    
    init(name: String,
         age: Int,
         experience: Int,
         grossSalary: Double) {
        self.name = name
        self.age = age
        self.experience = experience
        self.grossSalary = grossSalary
    }
}

// Создайте экземпляры написанных классов и проверьте работу каждого метода.

var driver = Driver(name: "John", age: 34, experience: 9, grossSalary: 10000)
var pilot = Pilot(name: "Dima", age: 25, experience: 6, grossSalary: 50000)

driver.printInfo()
print("\n")
pilot.printInfo()
print("\n")
Driver.printClassName()
Pilot.printClassName()

/*
 TODO: - ❓ Вопросы к изучению:
 - Что значит наследование?
 - Какой класс называется базовым или суперклассом, какой подклассом наследником?
 - В чем заключается механизм переопределения? Что мы можем переопределять?
 - Как запретить переопределение?
 - Как запретить наследование от класса?
 */

