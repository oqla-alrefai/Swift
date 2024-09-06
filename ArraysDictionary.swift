// array
var names : [String] = ["qdw", "qddw", "qwe", "qdq"]
var nums : [Int] = [1, 14, 5]
var values : [Any] = [15, "qddw", 10, "qdq"]

print(names, nums, values)

for number in nums {
    print(number)
}

var cars: [String:Int] = ["BMW":1, "Benz":2, "Audi":3]
print(cars["Benz"])

for (key, value) in cars{
    print("\(key) -> \(value)")
}