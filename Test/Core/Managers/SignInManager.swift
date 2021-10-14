//
//  SignInManager.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import Foundation

final class SignInManager {
    
    // MARK: - Services
    private let keychainAccessService: KeychainAccessService = KeychainAccessServiceImp.shared
    private let jsonEncoder: JSONEncoder = .init()
    private let key: String = "user"
}

extension SignInManager {
    func execute(login: String, password: String) -> Result<Void, Error> {
        guard login == "qwerty" && password == "qwerty" else { return .failure(NSError(domain: "", code: 0, userInfo: nil)) }
        
        let user = User(login: login, passsword: password)
        
        do {
            let encodedUser = try jsonEncoder.encode(user)
            
            try keychainAccessService.set(data: encodedUser, key: key)
            
            return .success(())
        } catch {
            return .failure(NSError(domain: "", code: 0, userInfo: nil))
        }
    }
}
