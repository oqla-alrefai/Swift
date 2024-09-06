// Initialization is the process of preparing an instance of a class for use. 
// It involves setting initial values for properties and performing any necessary setup.

// Class with initialization
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// Example usage
let person = Person(name: "John")
print(person.name) // Outputs: John