// Polymorphism allows objects of different types to be treated as objects of a common type.
// This is often achieved through inheritance and overriding.


// Types of Polymorphism

// 1. Compile-time Polymorphism (Static Polymorphism)
// This type of polymorphism is achieved by method overloading and operator overloading.
// Method Overloading: Multiple methods in the same class have the same name but different parameters.

class Printer {
    var value: Any
    
    init(value: Any) {
        self.value = value
    }
    
    func printInt(value: Int) {
        print("Printing Int: \(value)")
    }

    func printString(value: String) {
        print("Printing String: \(value)")
    }
}

let printer = Printer(value: 123) // You need to provide an argument for `value`
printer.printInt(value: 123)   // Output: Printing Int: 123
printer.printString(value: "Hello") // Output: Printing String: Hello






// 2. Run-time Polymorphism (Dynamic Polymorphism)
// This type of polymorphism is achieved through method overriding, where a subclass 
// provides a specific implementation of a method that is already defined in its superclass.
// The method to be called is determined at runtime based on the object type.

class Animal {
    func makeSound() {
        print("Some generic animal sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Woof!")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("Meow!")
    }
}

let animals: [Animal] = [Dog(), Cat()]
for animal in animals {
    animal.makeSound()
}
// Output:
// Woof!
// Meow!
