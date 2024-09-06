// closure is the function that can be passed around in computer science its called a `Lambda`.

// Closures are often used when you need to pass a block of code as an argument to a function,
// or when you want to capture values from the surrounding context.


// closures can be defined inline and used immediately, 
// which makes them very handy for short, simple operations, 
// especially as arguments to higher-order functions



// Closures can be written inline and do not require a nam
var myFunction: ((Int) -> Bool) = {number in
    if number > 5 {
        return true
    }
    return false
}

print(myFunction(7))
func isGreaterThanFive(number: Int) -> Bool {
    if number > 5 {
        return true
    }
    return false
}

print(isGreaterThanFive(number: 7))

// if you want your function to return nothing use (Void) or empty paranthesis

// closure can capture the value
// 1. function
func makeGreeting(greeting:String,name: String) -> String {
    return "\(greeting), \(name)!" // it will raise an error because there is no greeting value 
}

var greeting = "Hello"
print(makeGreeting(greeting: greeting, name: "Bob")) // Output: Hello, Bob!

// 2. closure:
let closure = { (name: String) in
    return "\(greeting), \(name)!" // it will works because it capture the value
}



greeting = "Hi"
print(closure("Bob")) // Output: Hi, Bob!
