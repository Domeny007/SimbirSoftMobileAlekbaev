import UIKit

//First task
var myClosure: () -> () = {
    print("I love Swift")
}

myClosure()

func repeatTask (times: Int, task: () -> Void) {
    for _ in 0..<times {
        task()
    }
}
repeatTask(times: 10, task: myClosure)


// Second task
enum Directions {
    case up
    case down
    case left
    case right
}


let directionsArray:[Directions] = [.up, .up, .left, .down, .left, .down, .down, .right, .right, .down, .right]
var location = (0,0)
for direction in directionsArray {
    switch direction {
    case .up:
        location.1 += 1
    case .down:
        location.1 -= 1
    case .left:
        location.0 -= 1
    case .right:
        location.0 += 1
    }
}

print(location)

//Third task
class Rectangle {
    var width = 0
    var height = 0
    
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    func calculateThePerimeterOfARectangle() {
        let perimeter = 2 * (width + height)
        print("Perimeter of a rectangle: ",perimeter)
    }
}

let rectangle = Rectangle(width: 30, height: 25)
rectangle.calculateThePerimeterOfARectangle()

//Fourth task
extension Rectangle {
    func calculatуTheAreaOfARectangle() {
        let area = width * height
        print("Area of a rectangle: ",area)
    }
}

rectangle.calculatуTheAreaOfARectangle()

