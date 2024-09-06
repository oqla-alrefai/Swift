// Class hierarchies organize classes in a tree-like structure based on inheritance. 
// A superclass is at the top, and subclasses extend from it.
// This promotes code reuse and logical organization

// Base class
class Shape {
    func draw() {
        print("Drawing a shape")
    }
}

// Subclasses forming a hierarchy
class Circle: Shape {
    override func draw() {
        print("Drawing a circle")
    }
}

class Square: Shape {
    override func draw() {
        print("Drawing a square")
    }
}

// Example usage
let shape: Shape = Circle()
shape.draw() // Outputs: Drawing a circle