//
//  AuthManager.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 28.03.23.
//

import Foundation

enum AuthManagerErrors: Error {
    case emptyEmail
    case emptyPassword
    case noUppercase
    case noDigit
    case noLowercase
    case noMinCharacters
    case wrongEmail
}

protocol AuthManagerProtocol {
    func check(email: String, password: String, complition: @escaping((Result<Bool, AuthManagerErrors>) -> Void))
}

final class AuthManager {}

extension AuthManager: AuthManagerProtocol {
    func check(email: String, password: String, complition: @escaping((Result<Bool, AuthManagerErrors>) -> Void)) {
        DispatchQueue.global().async {
            if email.isEmpty {
                DispatchQueue.main.async {
                    complition(.failure(AuthManagerErrors.emptyEmail))
                }
                return
            }
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailPred.evaluate(with: email) {
                DispatchQueue.main.async {
                    complition(.failure(AuthManagerErrors.wrongEmail))
                }
            }
            if password.isEmpty {
                DispatchQueue.main.async {
                    complition(.failure(AuthManagerErrors.emptyPassword))
                }
                return
            }
            if password.count < 8 {
                DispatchQueue.main.async {
                    complition(.failure(AuthManagerErrors.noMinCharacters))
                }
                return
            }
            if(!NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: password)){
                DispatchQueue.main.async {
                    complition(.failure(AuthManagerErrors.noUppercase))
                }
                return
            }
            if(!NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: password)){
                DispatchQueue.main.async {
                    complition(.failure(AuthManagerErrors.noDigit))
                }
                return
            }
            if(!NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: password)){
                DispatchQueue.main.async {
                    complition(.failure(AuthManagerErrors.noLowercase))
                }
                return
            }
            DispatchQueue.main.async {
                complition(.success(true))
            }
        }
    }
}
