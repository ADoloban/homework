import UIKit

// MARK: - 🏠 Домашнее задание.

// TODO: - 🧑‍💻
// Напишите generic функцию, которая принимает массив любого типа и возвращает первый элемент.

func returnFirstValue<T>(array: [T]) -> T? {
    return array.first
}


// Создайте функцию printArray, которая принимает массив любого типа и печатает каждый элемент массива на новой строке.

func printArray<T>(array: [T]) {
    array.forEach {
        print($0)
    }
}

// Напишите функцию findMax, которая принимает массив любого типа, соответствующего протоколу Comparable и возвращает максимальный элемент массива. Если массив пустой, функция должна возвращать nil.

func findMax<T: Comparable>(array: [T]) -> T? {
    guard let maxValue = array.max() else {
        return nil
    }
    return maxValue
}

// Extra task*
// Создайте generic протокол CompareProtocol, который объявляет функцию для сравнения двух элементов одного и того же типа. Метод должен возвращать Bool value как результат сравнения двух объектов. Объявите структуру или класс, подчините протоколу, добавьте реализацию. Создайте массив элементов и отсортируйте его, используя ваш метод.

protocol CompareProtocol {
    associatedtype T
    func compare(_ element1: T, _ element2: T) -> Bool
}

struct Comparator<T: Comparable>: CompareProtocol {
    func compare(_ element1: T, _ element2: T) -> Bool {
        return element1 < element2
    }
}

let wordComparable = Comparator<String>()

let stringArray = ["Car", "Pig", "Dog", "Cat"]

let sortedStringArray = stringArray.sorted(by: wordComparable.compare)

/*
 TODO: - ❓ Вопросы к изучению:
 - Зачем нужны дженерики?
 - Синтаксис объявления дженерик функции?
 - Как ограничить тип, который может быть использован в дженерик функции и дженерик типе?
 */

