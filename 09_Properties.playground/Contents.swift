import UIKit

// MARK: - 🏠 Домашнее задание.

// TODO: - 🧑‍💻
/* 1.
 Создайте класс Student со свойством firstName. Добавьте property observer для свойства firstName, чтобы печатать сообщение каждый раз как свойство будет изменено.
 Добавьте в класс свойство isValid, которое будет проверять минимальную и максимальную длину имени. Оно не может быть короче 2 символов и длиннее 15 символов.
 */

class Student{
    var firstName: String {
        didSet {
            print("firstName was changed from \"\(oldValue)\" to \"\(firstName)\"")
        }
    }
    var isValid: Bool {
        return  firstName.count >= 2 && firstName.count <= 15
    }
    
    init(firstName: String) {
        self.firstName = firstName
    }
}

/* 2.
 Создайте класс Person со свойством age, типа Int. Добавьте property observer к свойству age, чтобы гарантировать, что свойство не может быть отрицательным. Если приходит отрицательное значение, то свойство должно возвращать 0.
 */

class Person{
    var age: Int {
        didSet {
            if age < 0 {
                age = 0
            }
        }
    }
    
    init(age: Int){
        self.age = age
    }
}


/*
 Создайте структуру Rectangle со свойствами width и height. Добавьте computed property с именем area, которое будет возвращать площадь прямоугольника (width * height).
 */

struct Rectangle {
    var width: Double
    var height: Double
    var area: Double {
        width * height
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

/*
 Создайте класс User, который должен содержать имя, фамилию, возраст, рост.
 Измените свойство возраст так, чтобы при изменении его значения в консоль выводилось поздравление с Днем Рождения.
 Добавьте в класс свойства, чтобы контролировать минимальный и максимальный вес объекта (3 свойства - вес, минимальный вес и максимальный вес). При несоответствии выводить сообщение с указанием разницы и присваивать свойству пороговое значение (если ниже минимального, то минимальное и если выше максимального, то максимальное).
 Измените свойство вес так, чтобы при присваивавши ему значения в консоль выводилось сообщение похудел или потостел объект.
 Создайте свойство, которое будет содержать общее количество всех созданных объектов класса User.
 */

class User{
    let name: String
    let surname: String
    var age: Int{
        didSet{
            print("Happy birthday!!!")
        }
    }
    let height: Int
    var weight: Int {
        didSet {
            if weight < minWeight {
                print("Lost weight! The difference in weight is \(minWeight - weight) kilograms!")
                weight = minWeight
            } else if weight > maxWeight {
                print("Gained weight! The difference in weight is \(maxWeight - weight) kilograms!")
                weight = maxWeight
            }
        }
    }
    var minWeight: Int = 50
    var maxWeight: Int = 100
    static var userCount = 0
    
    init(name: String, surname: String, age: Int, height: Int, weight: Int){
        self.name = name
        self.surname = surname
        self.age = age
        self.height = height
        self.weight = weight
        User.userCount += 1
    }
}

/*
 Дополнительное задание (по желанию)
 
 Решите задачу №2, используя геттер и сеттер вместо property observer
 */

class secondPerson{
    private var age: Int = 0
    
    var _age: Int {
        get {
            return age
        }
        set {
            if newValue >= 0 {
                age = newValue
            } else {
                age = 0
            }
        }
    }
    
    init(_age: Int){
        self._age = _age
    }
}

/*
 TODO: - ❓ Вопросы к изучению:
 - В чем разница между stored и computed properties?
 - Что значит lazy?
 - Что такое getter и setter?
 - Когда используются property observers?
 - Зачем нужны и как используются property wrappers?
 */

