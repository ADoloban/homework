import UIKit

// MARK: - 🏠 Домашнее задание.

// TODO: - 🧑‍💻
/*
 Создайте структуру футболист.
 Добавьте свойства: имя, фамилия, возраст, количество голов, должность (нападающий, защитник, вратарь... - подумайте, каким типом данных будет это свойство).
 Создайте несколько экземпляров типа футболист и заполните их данными.
 Добавьте все экземпляры в массив игроков - это будет футбольная команда.
 
 Напишите функцию, которая принимает массив игроков и печатает в консоль их данные. В строке перед данными каждого игрока должен печататься его порядковый номер.
 
 Отсортируйте массив по количеству забитых голов по убыванию и распечатайте в новом порядке.
 Отсортируйте массив по фамилии игроков (по возрастанию). Если фамилии одинаковые, сравнивайте по имени. Распечатайте.
 Напишите функцию, которая отсортирует массив на разные массивы по должностям (т.е. нападающие в отдельный и т.д.)
 Посчитайте общее количество забитых командой голов.
 */

enum PlayerPosition: String{
    case forward
    case defender
    case goalkeeper
}

struct Player{
    let name: String
    let surname: String
    let age: Int
    let countOfGoals: Int
    let position: PlayerPosition
}

let defender = Player(name: "John", surname: "Bradley", age: 30, countOfGoals: 3, position: .defender)
let forward = Player(name: "Sam", surname: "Williams", age: 23, countOfGoals: 8, position: .forward)
let goalkeeper = Player(name: "David", surname: "Brown", age: 27, countOfGoals: 0, position: .goalkeeper)

let footballTeam = [defender, forward, goalkeeper]

func printTeam(_ team: [Player]){
    team.enumerated().forEach {
        print("Player \($0). Name: \($1.name), surname: \($1.surname), age: \($1.age), count of goals: \($1.countOfGoals), position: \($1.position)")
    }
}

printTeam(footballTeam)

let sortedByGoals = footballTeam.sorted { $0.countOfGoals > $1.countOfGoals }

let sortedBySurname = footballTeam.sorted {
    if $0.surname != $1.surname {
        return $0.surname < $1.surname
    } else {
        return $0.name < $1.name
    }
}

print(sortedByGoals)
print(sortedBySurname)

//First solution
func sortByPosition(_ team: [Player]) -> [String: [Player]] {
    var sortedPlayers = [String: [Player]]()
    
    team.forEach {
        if sortedPlayers[$0.position.rawValue] == nil{
            sortedPlayers[$0.position.rawValue] = [$0]
        } else {
            sortedPlayers[$0.position.rawValue]?.append($0)
        }
    }
    return sortedPlayers
}

//Second solution
func sortByPosition2(_ team: [Player]) -> ([Player], [Player], [Player]) {
    var forwards = [Player](), defenders = [Player](), goalkeepers = [Player]()
    
    forwards = team.filter { $0.position == .forward }
    defenders = team.filter { $0.position == .defender }
    goalkeepers = team.filter { $0.position == .goalkeeper }
    
    return (forwards, defenders, goalkeepers)
}

let sortedByPosition = sortByPosition(footballTeam)

let numberOfGoals = footballTeam.reduce(0, { $0 + $1.countOfGoals })

/*
 TODO: - ❓ Вопросы к изучению:
 Повторите название и назначение всех изученных функций высшего порядка. Будьте готовы рассказать о каждой.
 */

