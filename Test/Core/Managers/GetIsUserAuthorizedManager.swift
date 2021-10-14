//
//  GetIsUserAuthorizedManager.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import Foundation

final class GetIsUserAuthorizedManager {
    
    // MARK: - Services
    private let keychainAccessService: KeychainAccessService = KeychainAccessServiceImp.shared
    private let jsonDecoder: JSONDecoder = .init()
    private let key: String = "user"
}

extension GetIsUserAuthorizedManager {
    func execute() -> Result<Bool, Error> {
        do {
            guard try keychainAccessService.get(key: key) != nil else { return .success(false) }
            
            return .success(true)
        } catch {
            return .failure(NSError(domain: "", code: 0, userInfo: nil))
        }
    }
}
