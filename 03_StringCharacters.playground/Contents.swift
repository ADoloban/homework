import UIKit

/*
 MARK: - 🏠 Домашнее задание.
 
 TODO: - 🧑‍💻 Выполните каждый из пунктов для закрепления материала. Решение пишите на следующей строке после задания:
 */
 // - проинициализируйте пустую строку let emptyString с помощью строкового литерала
 
let emptyString: String = ""
 
 // - проинициализируйте пустую строку var message с помощью инициализатора

var message: String = String()
 
 // - проинициализируйте многострочную константу

 let multilineString = """
It is a multiline string.
It can display many lines of text.
"""
 
 // - используя интерполяцию, создайте строку "The images were loaded", в которой вместо "The" подставьте количество картинок из переменной count (объявить)

let count: Int = 7
let taskString: String = "\(count) images were loaded"
 
 // - используя конкатенацию добавьте message новое значение из предыдущего пункта

 message += taskString
 
 // - распечатайте в консоль количество символов в message если строка не пустая, если строка пустая - ничего делать не надо

if !message.isEmpty {
    print(message.count)
}
 
 // - распечатайте в консоль следующие текст (три строчки с прямой речью). Строки должны начинаться с -, как в примере. Отступ для второй строки должен быть сохранен. Чтобы вставить смайлики, используйте юникод. Весь текст должен представлять собой одну константу или переменную, которую и нужно распечатать. Для формирования String можно использовать конкатенацию и/или интерполяцию.
/*
    - "Hello, how are you?" - asked he.
        - "I'm nice, thank you 😊. And you?" - answered Mary.
    - "Not so good 😒"
*/

let firstString: String = "- \"Hello, how are you?\" - asked he."
let secondString: String = "\t- \"I'm nice, thank you \u{1F60A}. And you?\" - answered Mary."
let thirdString: String = "- \"Not so good \u{1F612}\""
var resultString: String = firstString + "\n" + secondString + "\n" + thirdString
print(resultString)

// MARK: - Task with *
/* Для выполнения этой задачи вам потребуется хорошо изучить документацию по String.

 Для многострочного текста из предыдущего задания:
 - подсчитайте количество слов в тексте
 - подсчитайте количество предложений в тексте
 - замените все глассные буквы на *

 */

let words = resultString.split(separator: " ")
let wordCount = words.count
print(wordCount)

let sentences = resultString.components(separatedBy: [".", "!", "?"])
let sentenceCount = sentences.count

var charArray = Array(resultString)
resultString = ""
for char in charArray {
    if "aeiouyAEIOUY".contains(char) {
        resultString += "*"
    } else {
        resultString += String(char)
    }
}
print(resultString)

// TODO: - ❓ Вопросы к изучению (писать ответы не нужно, но быть готовым ответить):
/*
 - Что такое конкатенация?
 - Что такое интерполяция?
 - Что представляет из себя тип Character?
 - Что представляет из себя тип String?
 */

