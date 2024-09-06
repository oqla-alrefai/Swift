import Foundation

func isValidDiscountCode(_ code: String) -> Bool {
    let discPattern = "^DISC_\\d{4}$"
    let salePattern = "^SALE_\\d{3}$"
    
    let discRegex = try? NSRegularExpression(pattern: discPattern)
    let saleRegex = try? NSRegularExpression(pattern: salePattern)
    
    let range = NSRange(location: 0, length: code.utf16.count)
    
    if let _ = discRegex?.firstMatch(in: code, options: [], range: range) {
        return true
    }
    
    if let _ = saleRegex?.firstMatch(in: code, options: [], range: range) {
        return true
    }
    
    return false
}

// Test cases
print(isValidDiscountCode("DISC_1234"))
print(isValidDiscountCode("SALE_123"))
print(isValidDiscountCode("DISC_123")) 
print(isValidDiscountCode("SALE1234"))
print(isValidDiscountCode("DIS1234"))
print(isValidDiscountCode("SALE12"))
