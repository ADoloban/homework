import UIKit

// MARK: - Task 1: Basketball team
/*
 You should create a basketball team. Basketball player has name, surname, number and position(enum).
 Team has 2 playing squads(5 players in the each squad) and 2 extra players, so the team count is 12.
 Create a coach which has a basketball team and can control the team.
 Coach responsibilities:
 Compose 1st(start) squad from random players but in the team should contain 5 different by position players.
 Compose 2nd squad from the players who are left.
 Change a players in the current playing squad.
 */

// TODO: - Your solution

enum PlayerPosition: String {
    case pointGuard = "Point Guard"
    case shootingGuard = "Shooting Guard"
    case smallForward = "Small Forward"
    case powerForward = "Power Forward"
    case center = "Center"
}

class BasketballPlayer {
    let name: String
    let surname: String
    let number: Int
    let position: Position
    
    init(name: String, surname: String, number: Int, position: Position) {
        self.name = name
        self.surname = surname
        self.number = number
        self.position = position
    }
}

class BasketballTeam {
    var players: [Player]
    var squad1: [Player] = []
    var squad2: [Player] = []
    var reserves: [Player] = []
    
    init(players: [Player]) {
        guard players.count == 12 else {
            fatalError("The team must have exactly 12 players.")
        }
        self.players = players
    }
    
    func composeFirstSquad() {
        var positionsInSquad1: Set<Position> = []
        
        while positionsInSquad1.count < 5 {
            if let player = players.randomElement(), !positionsInSquad1.contains(player.position) {
                squad1.append(player)
                positionsInSquad1.insert(player.position)
            }
        }
    }
    
    func composeSecondSquad() {
        let remainingPlayers = players.filter { !squad1.contains($0) }
        
        guard remainingPlayers.count == 5 else {
            fatalError("Not enough remaining players to compose the 2nd squad.")
        }
        
        squad2 = Array(remainingPlayers.prefix(5))
    }
    
    func changePlayerInSquad(currentSquad: Int, playerToReplace: PlayerPosition, newPlayer: PlayerPosition) {
        guard currentSquad == 1 || currentSquad == 2 else {
            print("Invalid squad number. Use 1 for the 1st squad or 2 for the 2nd squad.")
            return
        }
        
        var squadToUpdate: [Player]
        squadToUpdate = currentSquad == 1 ? squad1 : squad2
        
        if let index = squadToUpdate.firstIndex(where: { $0 === playerToReplace }) {
            squadToUpdate[index] = newPlayer
            print("\(newPlayer.name) \(newPlayer.surname) is now in the squad.")
        } else {
            print("\(playerToReplace.name) \(playerToReplace.surname) not found in the squad.")
        }
    }
    
    func addReservePlayers(reservePlayers: [Player]) {
        guard reservePlayers.count == 2 else {
            fatalError("The team must have exactly 2 reserve players.")
        }
        reserves = reservePlayers
    }
    
}

class Coach {
    let team: BasketballTeam
    
    init(team: BasketballTeam) {
        self.team = team
    }
    
    func manageTeam() {
        team.composeFirstSquad()
        team.composeSecondSquad()
        
        if let playerToReplace = team.squad1.first,
           let newPlayer = team.players.first(where: { !$0.position.rawValue.isEmpty }) {
            team.changePlayerInSquad(currentSquad: 1, playerToReplace: playerToReplace, newPlayer: newPlayer)
        }
    }
}
// MARK: - Task 2: Implement a contact management system
/*
 Requirements:
 1. Create an abstract object called "Contact" with the following properties: firstName (String), lastName (String), email (String), and phoneNumber (String).
 2. Create a "ContactManager" class that can store multiple contacts.
 3. It should provide functionality to add a contact, remove a contact, and retrieve a contact by email.

 Implement the following functionalities in the ContactManager:
 1. Add a function called "printAllContacts" that prints the details of all contacts.
 2. Add a function called "searchContacts" that takes a keyword(string) as input and returns a list of contacts whose first name, last name, or email contains the keyword.
 3. Add a function called "updatePhoneNumber" that takes an email and a new phone number as input and updates the corresponding contact's phone number.
 4. Add a computed property called "contactCount" that returns the total number of contacts in the manager.
 5. Create a subclass of "Contact" called "VIPContact" with an additional property:
 vipLevel (String)
 6. Create a protocol called "CanEmail" with a function called "sendEmail" that takes a message as input and prints "Sending email: {message}".
 7. Make the "VIPContact" class conform to the "CanEmail" protocol.

 Implement error handling for the following scenarios:
 1. When adding a contact with an existing email, throw a custom error called "duplicateEmailError".
 2. When retrieving a contact by email and the contact doesn't exist, throw a custom error called ".contactNotFoundError".
 3. Create a sample playground that demonstrates the usage of the ContactManager and showcases the functionalities implemented above. The playground should include creating contacts, adding them to the manager, updating phone numbers, searching contacts.
 */

// TODO: - Your solution
struct Contact {
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String
}

class ContactManager {
    
    var contacts: [Contact] = []
    
    var contactCount: Int {
        contacts.count
    }
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }
    
    func removeContact(email: String) {
        contacts = contacts.filter { $0.email != email }
    }
    
    func getContact(email: String) -> Contact? {
        return contacts.first { $0.email == email }
    }
    
    func printAllContacts() {
        for contact in contacts {
            print("Name: \(contact.firstName) \(contact.lastName), Email: \(contact.email), Phone: \(contact.phoneNumber)")
        }
    }
    
    func searchContacts(keyword: String) -> [Contact] {
        return contacts.filter { contact in
            contact.firstName.contains(keyword) || contact.lastName.contains(keyword) || contact.email.contains(keyword)
        }
    }
    
    func updatePhoneNumber(email: String, newPhoneNumber: String) {
        if let index = contacts.firstIndex(where: { $0.email == email }) {
            contacts[index].phoneNumber = newPhoneNumber
        }
    }
}

class VIPContact: Contact {
    let vipLevel: String
    
    init(firstName: String, lastName: String, email: String, phoneNumber: String, vipLevel: String) {
        self.vipLevel = vipLevel
        super.init(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber)
    }
}

protocol CanEmail {
    func sendEmail(message: String)
}

extension VIPContact: CanEmail {
    func sendEmail(message: String) {
        print("Sending email: \(message)")
    }
}

// MARK: - Task 3: Implement a generic data structure for a Stack.
/*
Requirements:
Create a generic class called Stack that represents a stack data structure. The class should have the following features:
1. The stack should be able to store elements of any type.
2. It should provide methods to push an element onto the stack, pop an element from the top of the stack, and check if the stack is empty.
3. The stack should follow the LIFO (Last-In, First-Out) principle.
4. Implement the push method to add an element to the top of the stack.
5. Implement the pop method to remove and return the element from the top of the stack.
6. Implement the isEmpty method to check if the stack is empty.
7. Add a property called count that returns the number of elements in the stack.

Create a sample playground that demonstrates the usage of the Stack class. The playground should include creating stacks of different types, pushing and popping elements, checking if stacks are empty, and accessing the count of elements.
Extend the Stack class to include a map method that accepts a closure as a parameter. The map method should apply the closure to each element in the stack and return a new stack with the transformed elements.
Test the map method by creating a stack of integers, applying a closure to double each element, and printing the resulting stack.
Add a constraint to the Stack class to ensure that the element type must conform to the Equatable protocol. Modify the pop method to only remove and return the element from the top of the stack if it is equal to the specified element. If it is not equal, throw a custom error called ".invalidElementError".
Demonstrate the updated functionality by creating a stack of strings, pushing elements onto the stack, and attempting to pop an element that is not equal to the top element. Catch the error and print an appropriate message.
*/

enum StackError: Error {
    case emptyStackError
    case invalidElementError
}

struct Stack<T> {
    private var elements: [T] = []
    
    var count: Int {
        elements.count
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() throws -> T? {
        guard !isEmpty else {
            throw StackError.emptyStackError
        }
        return elements.popLast()
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    func map<U>(_ transform: (T) -> U) -> Stack<U> {
        var mappedStack = Stack<U>()
        for element in elements {
            let mappedElement = transform(element)
            mappedStack.push(mappedElement)
        }
        return mappedStack
    }
    
    mutating func pop(elementEqualTo element: T) throws {
        guard let topElement = try pop() else {
            throw StackError.emptyStackError
        }
        guard topElement == element else {
            throw StackError.invalidElementError
        }
    }
}


var doubleStack = Stack<Double>()
doubleStack.push(0.4)
doubleStack.push(2.9)
doubleStack.push(11.3)


while !doubleStack.isEmpty {
    do {
        if let element = try doubleStack.pop() {
            print(element)
        }
    } catch Stack<Int>.StackError.emptyStackError {
        print("An error occurred: \(error)")
    }
}
