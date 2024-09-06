// Overriding
// With overriding, a subclass can provide a specific implementation for a method or property 
// that is already defined in its superclass.

// Base class
class Vehicle {
    func startEngine() {
        print("Engine started")
    }
}

// Subclass overriding startEngine
class Car: Vehicle {
    override func startEngine() {
        print("Car engine started")
    }
}

// Example usage
let vehicle = Vehicle()
let car = Car()

vehicle.startEngine() // Outputs: Engine started
car.startEngine()     // Outputs: Car engine started

