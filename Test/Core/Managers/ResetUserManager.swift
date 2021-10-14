//
//  ResetUserManager.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import Foundation

final class ResetUserManager {
    
    // MARK: - Services
    private let keychainAccessService: KeychainAccessService = KeychainAccessServiceImp.shared
    private let key: String = "user"
}

extension ResetUserManager {
    func execute() -> Result<Void, Error> {
        do {
            try keychainAccessService.reset(key: key)
            
            return .success(())
        } catch {
            return .failure(NSError(domain: "", code: 0, userInfo: nil))
        }
    }
}
