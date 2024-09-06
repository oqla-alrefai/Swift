import Foundation

func calculateFutureValueRecursively(principal: Double, annualRate: Double, timesCompounded: Int, years: Int) -> Double {
    if years == 0 {
        return principal
    } else {
        let rate = annualRate / 100
        let factor = 1 + rate / Double(timesCompounded)
        let newPrincipal = principal * pow(factor, Double(timesCompounded))
        return calculateFutureValueRecursively(principal: newPrincipal, annualRate: annualRate, timesCompounded: timesCompounded, years: years - 1)
    }
}

let principal = 1000.0 
let annualRate = 5.0 
let timesCompounded = 4 
let years = 10

let futureValue = calculateFutureValueRecursively(principal: principal, annualRate: annualRate, timesCompounded: timesCompounded, years: years)

print("The future value of the investment is \(futureValue) JOD.")
