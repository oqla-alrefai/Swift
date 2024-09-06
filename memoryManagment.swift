// strong vs weak
// you can define strong or weak variables by default the variable will be strong
// It determin what the type of usage of the variable
// for memory management, especially when dealing with reference types like classes
// Understanding these concepts is crucial to prevent memory leaks and ensure efficient memory usage.


// A strong reference is the default type of reference in Swift. 
// When you create a strong reference to an object, that object is kept in memory
//  as long as there is at least one strong reference pointing to it. 
// This ensures that the object remains alive and accessible.

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var person1: Person? = Person(name: "John")
var person2 = person1 // person2 is a strong reference to the same Person object

person1 = nil // person2 still holds a strong reference, so the Person object is not deallocated
print(person2?.name) // Output: John



// A weak reference does not keep a strong hold on the object it refers to. 
// If all strong references to an object are removed, the object can be deallocated, 
// even if there are weak references pointing to it. Weak references are typically 
// used to avoid strong reference cycles (retain cycles), which can lead to memory leaks.


// if we change the tenant property in the Apartment class to a weak reference,
// the Person object will be deallocated when all strong references are removed:

class Apartment {
    weak var tenant: Person?
}

var john: Person? = Person(name: "John")
var apartment: Apartment? = Apartment()

apartment?.tenant = john // apartment holds a weak reference to the Person object
john = nil // The Person object is deallocated because there are no strong references to it
print(apartment?.tenant?.name) // Output: nil

// When john is set to nil, the Person object is deallocated because there are no strong references to it.
//  Consequently, apartment?.tenant becomes nil.