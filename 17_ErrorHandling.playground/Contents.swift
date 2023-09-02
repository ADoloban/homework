import UIKit

// MARK: - 🏠 Домашнее задание.
 
// TODO: - 🧑‍💻
/*
 Давайте отправим корабль в круиз.

 Создайте тип, который будет описывать наш корабль.
 Создайте перечисление, для описания должности члена экипажа: капитан, помощник капитана, механик, боцман, доктор, матрос и т.д.
 Создайте перечисление для описания должностей сервисного персонала: повар, горничная, артист и т.д.
 Создайте тип для описания члена экипажа. Должен содержать имя, фамилию, должность, опыт работы.

 Добавьте в корабль свойство, которое будет содержать членов экипажа. Свойство должно быть доступно только для чтения (private(set)).
 Реализуйте метод для посадки члена экипажа.
 Повторите для сервисного персонала

 Реализуйте метод проверки корабля перед отплытием, с обработкой следующих ошибок:
     ⁃    Если не хватает членов экипажа, выведите сообщение сколько не хватает.
     ⁃    Если на корабле нет капитана или механика, корабль отплыть не может. Сообщите, кого еще ждем.
     ⁃    Если у кого-то из членов экипажа стаж меньше 3-х лет, сообщите кто это.

 Создайте перечисление для описания класса кают.
 Создайте тип, который будет описывать пассажира.
 Добавьте в корабль свойства с данными о количестве кают каждого класса.
 Добавьте в корабль свойство для чтения - массив, содержащий пассажиров.
 Реализуйте метод посадки пассажира на корабль. Если у пассажира нет билета, он не может сесть на корабль. Сообщите об этом.
 
 Измените метод проверки корабля перед отплытием так, чтобы если количество пассажиров с билетами определенного класса превышает количество кают данного класса, он возвращал сообщение о том, каких кают и в каком количестве недостаточно.
 Измените метод проверки корабля перед отплытием так, чтобы если количество пассажиров превышает количество сервисного персонала больше чем на 30% отплытие было невозможно по причине неукомплектованности персонала. Выведите сообщение сколько человек еще нужно нанять.

 Если корабль готов к отплытию, выведите сообщение о старте путешествия.
 */

class Ship {
    let name: String
    let type: String
    let length: Double
    var economyCabins: Int
    var businessCabins: Int
    var firstClassCabins: Int
    private(set) var crewMembers: [CrewMember]
    private(set) var serviceStaff: [ServiceStaffMember]
    private(set) var passengers: [Passenger] = []
    
    init(name: String,
         type: String,
         length: Double,
         crewMembers: [CrewMember],
         serviceStaff: [ServiceStaffMember],
         economyCabins: Int,
         businessCabins: Int,
         firstClassCabins: Int) {
        self.name = name
        self.type = type
        self.length = length
        self.crewMembers = crewMembers
        self.serviceStaff = serviceStaff
        self.economyCabins = economyCabins
        self.businessCabins = businessCabins
        self.firstClassCabins = firstClassCabins
    }
    
    func addCrewMember(_ member: CrewMember) {
            crewMembers.append(member)
    }
        
    func addServiceStaffMember(_ member: ServiceStaffMember) {
        serviceStaff.append(member)
    }
    
    func addPassenger(_ passenger: Passenger) {
        if passenger.hasTicket {
            passengers.append(passenger)
        } else {
            print("Пассажир \(passenger.firstName) \(passenger.lastName) не может сесть на корабль без билета.")
        }
    }

    func isShipReady() throws {
        var missingPositions = [CrewPosition]()
        var missingExperienceMembers = [CrewMember]()
        var missingCabins = [String: Int]()
        
        for position in CrewPosition.allCases {
            let membersWithPosition = crewMembers.filter { $0.position == position }
            if membersWithPosition.isEmpty {
                missingPositions.append(position)
            } else {
                let lessExperienceMembers = membersWithPosition.filter { $0.experienceYears < 3 }
                missingExperienceMembers.append(contentsOf: lessExperienceMembers)
            }
        }
        
        if !crewMembers.contains(where: { $0.position == .captain }) {
            throw DepartureError.missingCaptain
        }
        
        if !crewMembers.contains(where: { $0.position == .mechanic }) {
            throw DepartureError.missingMechanic
        }
        
        if !missingPositions.isEmpty {
            throw DepartureError.missingCrewPositions(missingPositions)
        }
        
        if !missingExperienceMembers.isEmpty {
            throw DepartureError.insufficientExperience(missingExperienceMembers)
        }
        
        let totalPassengers = passengers.count
        let totalServiceStaff = serviceStaff.count
        let requiredServiceStaff = Int(Double(totalPassengers) * 0.3)
        
        if totalServiceStaff < requiredServiceStaff {
            let staffNeeded = requiredServiceStaff - totalServiceStaff
            throw DepartureError.insufficientServiceStaff(staffNeeded: staffNeeded)
        }
        
        for passenger in passengers {
            switch passenger.cabinClass {
            case .economy:
                if economyCabins <= 0 {
                    missingCabins["Эконом"] = (missingCabins["Эконом"] ?? 0) + 1
                } else {
                    economyCabins -= 1
                }
            case .business:
                if businessCabins <= 0 {
                    missingCabins["Бизнес"] = (missingCabins["Бизнес"] ?? 0) + 1
                } else {
                    businessCabins -= 1
                }
            case .firstClass:
                if firstClassCabins <= 0 {
                    missingCabins["Первый класс"] = (missingCabins["Первый класс"] ?? 0) + 1
                } else {
                    firstClassCabins -= 1
                }
            }
        }
        
        if let exceededCabins = missingCabins.max(by: { $0.value < $1.value }) {
            throw DepartureError.insufficientCabins(type: exceededCabins.key, count: exceededCabins.value)
        }
        
        print("Начинаем путешествие!")
    }
}

enum CrewPosition: CaseIterable {
    case captain
    case firstMate
    case mechanic
    case boatswain
    case doctor
    case sailor
}

enum ServiceStaffPosition {
    case chef
    case housekeeper
    case entertainer
    case concierge
    case bartender
}

struct CrewMember {
    let firstName: String
    let lastName: String
    let position: CrewPosition
    let experienceYears: Int
}

struct ServiceStaffMember {
    let firstName: String
    let lastName: String
    let position: ServiceStaffPosition
    let experienceYears: Int
}

enum DepartureError: Error {
    case missingCrewPositions([CrewPosition])
    case missingCaptain
    case missingMechanic
    case insufficientExperience([CrewMember])
    case insufficientCabins(type: String, count: Int)
    case insufficientServiceStaff(staffNeeded: Int)
}

enum CabinClass {
    case economy
    case business
    case firstClass
}

struct Passenger {
    let firstName: String
    let lastName: String
    let hasTicket: Bool
    let cabinClass: CabinClass
}


/*
 TODO: - ❓ Вопросы к изучению:
 - Какую функцию называют генерирующей и какие ключевые слова используются при ее написании?
 - Как вызвать генерирующую функцию?
 - Зачем нам нужен do-catch блок?
 - Как использовать тип Result?
 - Что делает defer?
 */


