import UIKit


 //MARK: - 🏠 Домашнее задание.
 
 //TODO: - 🧑‍💻 Выполните каждый из пунктов для закрепления материала. Решение пишите на следующей строке после задания:
 // - проинициализируйте два пустых массива foodArray and drinkArray разными способами

var foodArray: [String] = []
var drinkArray: [String] = Array()
 
 // - присвойте первому массиву стринг значения - названия продуктов (минимум 5)

foodArray = ["Milk", "Orange", "Cheese", "Meat", "Potato"]

 // - присвойте второму массиву названия напитков (минимум 5)

drinkArray = ["Coffee", "Tea", "Milk shake", "Mojito", "Beer"]

 // - добавьте в конец foodArray еще одно значение
 
foodArray.append("Eggs")

 // - добавьте в середину drinkArray еще одно значение

drinkArray.insert("Coca Cola", at: drinkArray.count/2)
 
 // - создайте третий массив shoppingList, который должен включать в себя все значения из foodArray and drinkArray
 
var shoppingList: [String] = Array()
shoppingList.append(contentsOf: foodArray + drinkArray)
 
 // - распечатайте в консоль название продуктов и напитков из shoppingList и общее количество продуктов в shoppingList.

print("List of products and drinks: \(shoppingList.joined(separator: ", "))")
print("Total count is \(shoppingList.count)")
 
 // - удалите первое и последнее значение, значение по индексу 2 из shoppingList
    
shoppingList.removeFirst()
shoppingList.removeLast()
shoppingList.remove(at: 2)

 // - объявите словарь priceList, в котором ключами будут названия продуктов, а значениями цены для этих продуктов (цены с дробной частью)

var priceList: [String: Double] = [:]

 // - добавьте и удалите несколько значений из словаря.

priceList["Fish"] = 3.29
priceList["Meat"] = 4.57
priceList["Water"] = 1.2
priceList["Eggs"] = 1.9
priceList["Ice cream"] = 0.9

priceList.removeValue(forKey: "Water")
priceList["Ice cream"] = nil

 // - распечатайте в консоль название и стоимость всех продуктов из словаря

for (product, price) in priceList{
    print("\(product) costs \(price)")
}

 // - объявите два сета со значениями одного типа.

let firstSet: Set<Int> = [2, 5, 21, 9, 8, 18, 4]
let secondSet: Set<Int> = [9, 2, 8, 31, 24, 88, 57]

 // - примените к вышеобъявленным сетами операции symmetricDifference, union, intersection, substracting, isSubset(of:), isSuperset(of:)

firstSet.symmetricDifference(secondSet)
firstSet.union(secondSet)
firstSet.intersection(secondSet)
firstSet.subtracting(secondSet)
firstSet.isSubset(of: secondSet)
firstSet.isSuperset(of: secondSet)

// MARK: - 🏠 Готовим ужин.
/*
 Вам нужно приготовить ужин из 3 блюд - салат, главное блюдо и дессерт. Для каждого блюда требуется определенный набор ингридиетов. Некоторые из этих ингредиентов уже есть в вашем холодильнике. Определите, какие ингридиенты вам необходимо докупить.
 
Внимание! Здесь мы работаем только с названиями ингридиетов, без учета их количества. Т.е. если вам нужны яйца в двух блюдах, в списке для покупок укажите их только один раз.
 
Используйте коллекции для обозначения списка ингридиетов. Для каждого блюда будет свой список ингридиентов, вводим значения. Так же отдельные списки для ингридиетов которые у вас есть (вводим значение) и для ингридиетов, которые нужно купить (вычисляем на основе того, что нужно и того, что есть).
 
 Подумайте, какой тип коллекций лучше всего подходит для решения задачи.
*/
 
let saladIngredients: Set<String> = ["cabbage", "cucumber", "tomato", "onion"]
let mainDishIngredients: Set<String> = ["potato", "soy sauce", "pepper", "chicken", "onion", "salt"]
let dessertIngredients: Set<String> = ["flour", "milk", "sugar", "vanilla"]

let productsInFridge: Set<String> = ["tomato", "potato", "milk"]

let productsToBuy = dessertIngredients.union(saladIngredients).union(mainDishIngredients).subtracting(productsInFridge)

print(productsToBuy)
/*
 TODO: - ❓ Вопросы к изучению (писать ответы не нужно, но быть готовым ответить):
 - Чем отличаются друг от друга array, set and dictionary?
 - Какие операции можно с ними выполнять?
 */
