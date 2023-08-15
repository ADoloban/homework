import UIKit

/*
 MARK: - 🏠 Домашнее задание.
 
 TODO: - 🧑‍💻 Выполните каждый из пунктов для закрепления материала. Решение пишите на следующей строке после задания:
 */

 // - Объявите и реализуйте простую функцию, которая ничего не принимает и ничего не возвращает. Функция должна печатать в консоль приветствие. Добавьте вызов функции.

func greeting(){
    print("Hello!")
}
greeting()


 // - Объявите и реализуйте функцию, которая принимает одно значение - имя, и печатает в консоль именованное приветствие. Используйте parameter name only. Вызовите функцию

func greeting(name: String){
    print("Hello \(name)!")
}
greeting(name: "John")

 // - Скопируйте предыщее решение и измените его, используя argument label.

func greeting(to name: String){
    print("Hello \(name)!")
}
greeting(to: "Joe")

 // - Объявите массив типа String с несколькими значениями. Реализуйте функцию, которая принимает объявленный массив, добавляет к каждому значению массива "!" и возвращает массив с измененными значениями.

let names: [String] = ["Kiril", "Vlad", "Dima", "Sasha"]
func addToWords(_ array: [String]) -> [String]{
    var result: [String] = []
    for name in array{
        result.append("\(name)!")
    }
    return result
}
addToWords(names)


 // - Измените предыдущее решение, используя сквозной параметр inout.

func addToWords(_ array: inout [String]){
    for i in 0..<array.count{
        array[i] += "!"
    }
}
addToWords(names)


 // - Напишите функцию, которая принимает 2 параметра типа Int и возвращает сумму этих параметров.

func summ(firstNumber: Int, secondNumber: Int) -> Int{
    return firstNumber + secondNumber
}
summ(firstNumber: 4, secondNumber: 5)

 // - Создайте функцию, которая принимает массив типа Int и возвращает tuple с минимальным и максимальным значениями массива.

let numbers: [Int] = [2, 4, 8, 45, -9]

// first solution
func findMinAndMax(in array: [Int]) -> (Int?, Int?){
    return(array.min(), array.max())
}

//second solution
func findMinAndMax(array: [Int]) -> (Int, Int){
    let min = array.min() ?? 0
    let max = array.max() ?? 0
    return (min, max)
}

findMinAndMax(in: numbers)
findMinAndMax(array:  numbers)


/*
 Представьте, что вы работаете над программой по учету студентов в университете.
 Создайте словарь, который будет содержать имена студентов и средний бал каждого из них. Это будут студенты, зачисленные в наш университет.
 Добавьте функцию, которая будет в качестве параметра принимать имя студента и зачислять его в университет. Срединй бал в начале обучения неизвестен.
 Добавьте функцию, которая будет присваивать студентам средний балл. В итоге все студенты должны иметь средний балл.
 Добавьте функцию, которая определит лучшего студента для произношения речи на церемонии выдачи дипломов.
 Добавьте функцию, которая будет распечатывать в консоль речь лучшего ученика. Пометьте, кто ее произносит.
 Добавьте функцию, которая будет выдавать студенту диплом (в качестве действия можете распечатать информацию в консоль с именем студента и информацией о выдаче ему диплома).
 Добавьте функцию, которая будет отчислять студента из университета. Ведь после выдачи дипломов, студентов нужно отчислить.
 Наполните университет студентами и доведите их до выпуска!
 */

var students: [String : Double?] = [:]

func addToUniversity(name: String){
    students.updateValue(nil, forKey: name)
}

func addStudentMark(mark: Double, name: String){
    students.updateValue(mark, forKey: name)
}

func findBestStudent() -> String{
    var bestStudent: String = ""
    var highestRating: Double = 0.0
    for (student, rating) in students{
        if let rating = rating {
            if rating > highestRating {
                bestStudent = student
                highestRating = rating
            }
        }
    }
    return bestStudent
}

func studentsSpeech(){
    print("It's a \(findBestStudent())'s speech. Bla-bla-bla.")
}

func giveDiplom(){
    for (student, _) in students{
        print("\(student) received a diploma")
    }
}

func deductStudent(_ name: String){
    students.removeValue(forKey: name)
}

addToUniversity(name: "Vanya")
addToUniversity(name: "Vika")
addToUniversity(name: "Oleg")
addToUniversity(name: "Anya")

addStudentMark(mark: 89.4, name: "Vanya")
addStudentMark(mark: 95.2, name: "Vika")
addStudentMark(mark: 73.8, name: "Oleg")
addStudentMark(mark: 84.9, name: "Anya")
print(students)
studentsSpeech()

giveDiplom()

deductStudent("Vanya")
deductStudent("Vika")
deductStudent("Oleg")
deductStudent("Anya")

print(students)
/*
 TODO: - ❓ Вопросы к изучению (писать ответы не нужно, но быть готовым ответить):
 - Что такое функции?
 - Что такое argument label and parameter name?
 - Что такое сквозной параметр (inout)?
 - Что такое nested functions?
 */
