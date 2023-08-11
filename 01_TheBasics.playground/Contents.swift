import UIKit

/*
 MARK: - 🏠 Домашнее задание.
 
 TODO: - 🧑‍💻 Описать страну, в которой вы сейчас находитесь, используя:
 - константы для неизменных характеристик
 - переменные для изменяемых
 - опционалы для необязательно присутствующих
 - изученные типы данных хотя бы по одному разу: Int, UInt, Float, Double, Bool, String.
 - type aliasses, tuples.
 
 TODO: - ❓ Вопросы к изучению (писать ответы не нужно, но быть готовым ответить):
 - Что такое опционал?
 - Назовите способы разворачивания опционала?
 - Какая разница между Float и Double? Что рекомендуется использовать?
 - Какая разница между UInt и Int? Что рекомендуется использовать?
 
 */

/*
 TODO: - 🏆 Ваше решение здесь:
 */

typealias Country = (String, String)

let myCountry: Country = ("Ukraine", "Kyiv")
let (countryName, capital) = myCountry
let continent: String = "Europe"
let areaOfCountry: Double = 603700.0
let currency: String = "UAH"
let neighboringCountries: [String] = ["Poland", "Belarus", "Slovakia", "Hungary", "Romania", "Moldova", "Russia"] //we haven't taught it, but I decided to add it😅
let numberOfRegions: Int = 24

var populationOfCountry: UInt = 36_700_000
var isNuclearCountry: Bool? = false
var averageTemperature: Float = 10.7
var isDemocracy: Bool = true


/*
 MARK: - 📃 Пример выполнения домашнего задания.
 Описание города
 */

typealias City = (String, String)

let city: City = ("Cordoba", "Cordoba")
let (cityName, provinceName) = city
let country: String = "Argentina"
let zipCode: UInt = 5000

var area: UInt = 576
var population: UInt = 1329604
var countOfAreas: UInt

var minTemperature: Float = -7.1
var maxTemperature: Float = 43.1

var isSafeCity: Bool? = true // Вы можете не знать, а можете и знать ответ на этот вопрос
