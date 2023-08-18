import UIKit

// MARK: - 🏠 Домашнее задание.

// TODO: - 🧑‍💻
/*
 Давайте представим, что у вас компания, сдающая недвижимость в аренду.
 
 Создайте структуру House.
 Добавьте свойства: адрес, площадь, количество комнат, количество туалетных комнат, наличие бассейна, стоимость аренды в месяц.
 Создайте экземпляр структуры.
 Объявите еще одну константу и присвойте ей уже созданный экземпляр структуры.
 Измените во втором экземпляре стоимость аренды. Обратите внимание на ошибку, которую выдаст Xcode. Исправьте ее.
 Распечатайте стоимость аренды для обоих экземпляров.
 Изменилось ли значение для первого экзепляра?
 */

struct House{
    let address: String
    let area: Int
    let countOfRooms: Int
    let countOfToiletRooms: Int
    let hasSwimmingPool: Bool
    var pricePerMonth: Int
}
let firstHouse = House(address: "Kyiv, Lesya Ukrainka Boulevard 12",
                       area: 67,
                       countOfRooms: 3,
                       countOfToiletRooms: 1,
                       hasSwimmingPool: false,
                       pricePerMonth: 500)

var secondHouse = firstHouse

secondHouse.pricePerMonth = 600

print(firstHouse.pricePerMonth)
print(secondHouse.pricePerMonth)

/*
 Создайте класс Apartment.
 Добавьте такие же свойства (представим, что у нас встречаются варианты с бассейном 😁)
 Создайте экземпляр класса.
 Объявите еще одну константу и присвойте ей уже созданный экземпляр класса.
 Измените во втором экземпляре стоимость аренды. Обратите внимание на отсутсвие ошибки!
 Распечатайте стоимость аренды для обоих экземпляров.
 Изменилось ли значение для первого экзепляра?
 
 Найдите разницу между использованием классов и структур.
 
 Выведите в консоль информацию, ссылаются ли 2 переменные класса на один и тот же объект или на разные.
 */

class Apartment{
    let address: String
    let area: Int
    let countOfRooms: Int
    let countOfToiletRooms: Int
    let hasSwimmingPool: Bool
    let pricePerMonth: Int
    
    init(address: String, area: Int, countOfRooms: Int, countOfToiletRooms: Int, hasSwimmingPool: Bool, pricePerMonth: Int){
        self.address = address
        self.area = area
        self.countOfRooms = countOfRooms
        self.countOfToiletRooms = countOfToiletRooms
        self.hasSwimmingPool = hasSwimmingPool
        self.pricePerMonth = pricePerMonth
    }
}
let firstApartment = Apartment(address: "Kyiv, Lesya Ukrainka Boulevard 12",
                               area: 80,
                               countOfRooms: 4,
                               countOfToiletRooms: 2,
                               hasSwimmingPool: true,
                               pricePerMonth: 800)

let secondApartment = firstApartment
secondHouse.pricePerMonth = 900
/*
 TODO: - ❓ Вопросы к изучению (писать ответы не нужно, но быть готовым ответить):
 - Для чего нужны классы и структуры?
 - Что общего между классами и структурами?
 - Чем отличаются классы от структур?
 - Что такое value и reference types?
 */

