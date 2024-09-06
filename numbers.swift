var a: Int = 1
var b: Float = 1.002
var c: Double = 1.00000013

// you cannot apply any math operation until you make sure both varaibles has the same datatype

var res = Float(a) + b
var res1 = Double(b) + c
var res2 = Int(b) + a
print(res, res1, res2)


// ternary operator
let ternary = res2 > 2 ? true : false 