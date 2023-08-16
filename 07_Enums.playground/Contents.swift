import UIKit

// MARK: - 🏠 Домашнее задание.

// TODO: - 🧑‍💻 Выполните каждый из пунктов для закрепления материала. Решение пишите на следующей строке после задания:
// - создайте enumeration с разными направлениями музыки, а-ля pop, rock, classic и т.д.

enum Music: String, CaseIterable {
    case pop = "Billie Eilish"
    case rock = "Linkin Park"
    case classic = "Amadeus Mozart"
    case rap = "Guf"
    case jazz = "Art Blakey"
}

// - объявите константу myFavoriteStyle и присвойте ей любое значение из enumeration

let myFavoriteStyle: Music = .classic

// - распечатайте каждое значение enumeration, используя итерацию

for genre in Music.allCases{
    print(genre)
}

// - добавьте в enumeration raw value типа String, которое будет являться именем исполнителя данного жанра

//Done👆

// - проинициализируйте константу singerStyle, используя rawValue
let singerStyle = Music.rap.rawValue

// - напишите switch statement, который будет сравнивать singerStyle с cases для каждого направления музыки и печатать название какой-нибудь песни соответствующего жанра

switch singerStyle {
case Music.pop.rawValue:
    print("Ocean Eyes")
case Music.rock.rawValue:
    print("Numb")
case Music.classic.rawValue:
    print("Eine kleine Nachtmusik")
case Music.rap.rawValue:
    print("Баста - Моя игра")
case Music.jazz.rawValue:
    print("Moanin'")
default:
    print("Unknown Genre")
}


// - Представте, что мы работаем над приложением для заказа пиццы. Создайте enumeration содержащий три разных размера для пиццы small, medium, big. Это должен быть enum с associated values, которые будут использованы для указания дополнительных ингридиентов: для small - один, для medium - два, для big - три ингридиента.

enum PizzaSize{
    case small(String)
    case medium(String, String)
    case big(String, String, String)
}

// - Создайте три константы, которым присвойте три разных значения из enum с пиццой.

let smallPizza: PizzaSize = .small("cheese")
let mediumPizza: PizzaSize = .medium("bacon", "sausage")
let bigPizza: PizzaSize = .big("pepperoni", "pineapples", "mushrooms")

// - Напишите switch, который будет выводить в консоль сообщение о размере заказанной пиццы и дополнительных ингредиентах. Что-то типа "Your order is - The big pizza with mushrooms, cheese, bacon".

switch bigPizza{
case .small(let ingredient):
    print("Your order is: The small pizza with \(ingredient)")
case .medium(let firstIngredient, let secondIngredient):
    print("Your order is: The medium pizza with \(firstIngredient) and \(secondIngredient)")
case .big(let firstIngredient, let secondIngredient, let thirdIngredient):
    print(("Your order is: The medium pizza with \(firstIngredient), \(secondIngredient) and \(thirdIngredient)"))
}

/*
 TODO: - ❓ Вопросы к изучению (писать ответы не нужно, но быть готовым ответить):
 - Что такое enumerations?
 - Для чего нужен протокол CaseIterable?
 - Что такое Recursive Enumerations?
 
 */
