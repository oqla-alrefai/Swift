import Foundation

struct UserData {
    let username: String
    let password: String
    let email: String
}

enum UserDataError: Error {
    case invalidFormat
    case invalidUsername
    case invalidEmail
    case invalidPassword
}

class UserDataValidator {
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let regex = try? NSRegularExpression(pattern: emailRegex, options: [])
        let range = NSRange(location: 0, length: email.utf16.count)
        return regex?.firstMatch(in: email, options: [], range: range) != nil
    }

    static func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9]).{6,}$"
        let regex = try? NSRegularExpression(pattern: passwordRegex, options: [])
        let range = NSRange(location: 0, length: password.utf16.count)
        return regex?.firstMatch(in: password, options: [], range: range) != nil
    }

    static func isValidUsername(_ username: String) -> Bool {
        let usernameRegex = "^[a-zA-Z][a-zA-Z0-9_]{2,}$"
        let regex = try? NSRegularExpression(pattern: usernameRegex, options: [])
        let range = NSRange(location: 0, length: username.utf16.count)
        return regex?.firstMatch(in: username, options: [], range: range) != nil
    }
}

func validateUserData(from user: [String: String]) throws -> UserData {
    guard let username = user["username"],
          let password = user["password"],
          let email = user["email"] else {
        throw UserDataError.invalidFormat
    }

    guard UserDataValidator.isValidUsername(username) else {
        throw UserDataError.invalidUsername
    }
    
    guard UserDataValidator.isValidPassword(password) else {
        throw UserDataError.invalidPassword
    }
    
    guard UserDataValidator.isValidEmail(email) else {
        throw UserDataError.invalidEmail
    }

    return UserData(username: username, password: password, email: email)
}

// Example usage
let userData: [String: String] = [
    "username": "aliref",
    "password": "Te1221",
    "email": "ali@gmailcom"
]

do {
    let validatedUserData = try validateUserData(from: userData)
    print("User data is valid!")
    print("Username: \(validatedUserData.username)")
    print("Password: \(validatedUserData.password)")
    print("Email: \(validatedUserData.email)")
} catch UserDataError.invalidFormat {
    print("Invalid user data structure.")
} catch UserDataError.invalidUsername {
    print("The username should be at least 3 characters and start with a letter.")
} catch UserDataError.invalidPassword {
    print("The password should be at least 6 characters, have capital letters, and contain numbers.")
} catch UserDataError.invalidEmail {
    print("Invalid Email")
}