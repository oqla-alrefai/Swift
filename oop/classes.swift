// They allow you to model real-world entities,
//  define their properties and behaviors, and organize your code efficiently.

// Base class
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Some generic animal sound")
    }
}


// inheritance. This allows a new class (subclass) 
// to inherit properties and behaviors from an existing class (superclass).

// Subclass inheriting from Animal
class Dog: Animal {
    override func makeSound() {
        print("Woof!")
    }
}

// Example usage
let genericAnimal = Animal(name: "Generic")
let dog = Dog(name: "Buddy")

genericAnimal.makeSound() // Outputs: Some generic animal sound
dog.makeSound() // Outputs: Woof!



