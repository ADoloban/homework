import UIKit

/*
 MARK: - 🏠 Домашнее задание.
 
 TODO: - ❓ Вопросы для самопроверки:
 - Какие бывают операторы?
 - Для чего служит тернарный оператор?
 - Какие операторы существуют для объявления range?
 - Какие пять способов разворачивания опционалов вы знаете?
 
 
 
 TODO: - 1. Нечетные числа
 - создать кортеж с произвольными числами, не менее трех значений в кортеже
 - распечатать в консоль только четные числа. Подумайте, чем четные числа отличаются от нечетных и какой оператор может помочь нам выявить различие.
 - решение должно работать для любых чисел, т.е. если вы несколько раз измените ваши числа в кортеже, то каждый раз задача должна выполняться.
 
 TODO: - 2. Нечетные числа
 - создать период произвольного значения
 - распечатать в консоль только четные числа с отрицательным значением
 
 TODO: - 3. Игра в Кости*
 Два игрока. Они по очереди бросают два кубика, на гранях которых числа от 1 до 6. Выпавшее число защитывается игроку, который бросал кости. У каждого из игроков 7 попыток. Используйте random для получения случайного числа в заданном периоде (почитайте про random https://developer.apple.com/documentation/swift/int/random(in:)-9mjpw)
 При каждом броске костей распечатайте в консоль имя игрока, сколько очков он получает в текущей попытке, сколько очком всего он накопил. По истечении 7 бросков для каждого из игроков, определите победителя и распечатайте эту информацию в консоль.
 Используйте знания, полученные и в предыдущих уроках. Найдите самое короткое решение!

 TODO: - 🏆 Ваше решение ⬇️:
 */

//MARK: - 1 Task

let numbers = (4, -3, 28)

if numbers.0 % 2 == 0{
    print(numbers.0)
}
if numbers.1 % 2 == 0{
    print(numbers.1)
}
if numbers.2 % 2 == 0{
    print(numbers.2)
}

//MARK: - 2 Task

let period = -11...4
for number in period{
    if number < 0 && number % 2 == 0{
        print(number)
    }
}

//MARK: - 3 Task

var firstPlayer = (name: "John", count: 0), secondPlayer = (name: "Sam", count: 0)
var point: Int

for i in 1...7{
    print("\n\(i) attempt")
    
    point = Int.random(in:1...6)
    firstPlayer.count += point
    print("\(firstPlayer.name) got \(point) points. He has a total of \(firstPlayer.count) points")
    
    point = Int.random(in:1...6)
    secondPlayer.count += point
    print("\(secondPlayer.name) got \(point) points. He has a total of \(secondPlayer.count) points")
}

if firstPlayer.count == secondPlayer.count{
    print("\nIt is a draw!")
} else if firstPlayer.count > secondPlayer.count{
    print("\n\(firstPlayer.name) is the winner. He has \(firstPlayer.count) points!")
} else {
    print("\n\(secondPlayer.name) is the winner. He has \(secondPlayer.count) points!")
}

