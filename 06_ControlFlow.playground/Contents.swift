import UIKit

// MARK: - 🏠 Домашнее задание.

// TODO: - 🧑‍💻 Выполните каждый из пунктов для закрепления материала. Решение пишите на следующей строке после задания:
// - используя while loop распечатайте "Hello" 5 раз

var i: Int = 0
while i<5{
    print("Hello")
    i+=1
}

// - напишите решение для той же задачи, используя repeat-while loop

i = 0
repeat{
    print("Hello")
    i+=1
}while i<5

// - объявите строку произвольного значения и используя switch statement сделайте все гласные в строке заглавными. Распечатайте новое значение

let inputString: String = "I hate Russia"
var resultString: String = String()
for char in inputString{
    switch char{
    case "a", "e", "i", "o", "u", "y":
        resultString += String(char).uppercased()
    default:
        resultString += String(char)
    }
}
print(resultString)

// - объявите произвольное значение типа Int и напишите switch, который будет сравнивать это значение с несколькими range.
let number: Int = 9

switch number{
case (-100...4):
    print("Number is between -100 and 4")
case (3...241):
    print("Number is between 3 and 241")
default:
    print("Range not known")
}

// - объявите tuple с двумя значениями, напиши switch для сравнения значений tuple

let tuple: (String, Int) = ("Sasha", 29)

switch tuple{
case(let name, 0...17):
    print("\(name) is a child")
case(let name, 18...49):
    print("\(name) is an adult")
case(let name, 50...105):
    print("\(name) is a pensioner")
default:
    print("age entered incorrectly")
}
    /*
 Напишите программу для университета. У нас есть несколько студентов, пусть будет 3. Каждый студент посетил 5 курсов и имеет бал по этим курсам, укажите название и средний бал за каждый из этих курсов. Вычислите средний бал студента (в сумме всех курсов) и составьте рейтинг лучших студентов университета. Рейтинг с указанием студентов и их средних баллов выведите в консоль в порядке убывания (от лучшего студента к худшему).
*/
let studentsMarks: [String: [Float]] = [
    "Anya": [67.2, 89.4, 95.9, 80.1, 75.3],
    "Vanya": [73.2, 91.6, 64.7, 80.3, 77.3],
    "Kolya": [93.2, 84.3, 79.2, 67.8, 95.3]]

var rating: [String: Float] = [:]
var averageMark: Float
for (student, marks) in studentsMarks {
    averageMark = 0.0
    for mark in marks{
        averageMark += mark
    }
    averageMark /= 5
    rating.updateValue(averageMark, forKey: student)
}

let sortedDictionary = rating.sorted{ $0.value > $1.value} // I read a little about closure, so I decided to use it

for (student, mark) in sortedDictionary{
    print("The \(student)'s grade is \(mark) points")
}


/*
 TODO: - ❓ К изучению:
 - Выучить синтаксис для всех statements and loops
 - Знать назначение для continue, break, fallthrow, return, throw
 */

