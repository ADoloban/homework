import UIKit

// MARK: - Task 1:
/*
 Create a protocol called Drawable with a draw() method. Implement this protocol for various classes like Square, Triangle, and Line, method must print "Drawing <FigureName>".
 Create a new class called FiguresKeeper, this class has a collection of figures, and methods: addFigure, drawAllFigures and draw some special Figure
 Method 'draw some special Figure' must take a figure from the collection and draw this figure, if there is no such figure method must throw error with description "Draw error, has no <Figure>, print this error."
 Feel free to use any approach to find special Figure in your collection. Ask me if u have no idea.
 */

protocol Drawable: AnyObject {
    func draw()
}

class Square: Drawable {
    
}

class Triangle: Drawable {
    
}

class Line: Drawable {
    
}

class FigureKeeper {
    var figures: [Drawable] = []
    
    func addFigure(_ figure: Drawable) {
        figures.append(figure)
    }
    
    func drawAllFigures() {
        for figure in figures {
            figure.draw()
        }
    }
    
    func drawSpecialFigure(_ figure: Drawable) throws {
        if figures.contains(where: { $0 === figure } ) {
            figure.draw()
        } else {
            let figureName = String(describing: type(of: figure))
            throw DrawingError.figureNotFound("Draw error, has no \(String(describing: type(of: figure))), print this error.")
        }
    }
}

enum DrawingError: Error {
    case figureNotFound(String)
}

/*
 Extra task.
 Using default implementation for protocol Figure implement default implementation for method func draw(). Method must do the same print.
 As result u should not have func draw() in the Square, Triangle, and Line, and have it in one place (extension for  Figure).
 */

// TODO: - Your solution

extension Drawable {
    func draw() {
        print("Drawing \(String(describing: type(of: self)))")
    }
}

// MARK: - Task 2:
/*
 Write an extension for the String type that adds a computed property isPalindrome which returns true if the string is a palindrome (reads the same forwards and backwards).
 */

// TODO: - Your solution

extension String {
    var isPalindrome: Bool {
        let string = self.lowercased()
        let characters = Array(string)
        
        var startIndex = 0
        var endIndex = characters.count - 1
        
        while startIndex < endIndex {
            if characters[startIndex] != characters[endIndex] {
                return false
            }
            
            startIndex += 1
            endIndex += -1
        }
        return true
    }
}

// MARK: - Task 3:
/*
 Let's say we need some functionality for Int type.
 I would like to use simple loop having only Int value.
 How this method must work:
 I have for example any Int, let's say 5. I should be able to call method 'times' for this int(5) and this method will do a loop 5 times
 */


extension Int {
    func times(_ closure: () -> Void) {
        for _ in 1...self {
            closure()
        }
    }
}

let five = 5
//TODO: - went u finish implementation in the extension code below should works without any changes, just un-comment code.
five.times {
    print("Hello!")
}
