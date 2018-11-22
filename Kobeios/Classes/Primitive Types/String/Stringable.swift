//
//  Stringable.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import Foundation

public protocol Stringable {}

public extension Stringable {
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValid(password: String, validatorRegex: String = ".{5,}") -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", validatorRegex)
        return passwordTest.evaluate(with: password)
    }
    
}
