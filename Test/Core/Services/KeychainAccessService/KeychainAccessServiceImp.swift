//
//  KeychainAccessService.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import Foundation
import KeychainAccess

final class KeychainAccessServiceImp {
    
    // MARK: - Shared
    
    static let shared = KeychainAccessServiceImp()
    
    // MARK: - Initialization
    
    private init() {}
    
    // MARK: - Private properties
    
    private let keychain: Keychain = .init(service: "com.fedoro.Test.keychain")
}

// MARK: - KeychainAccessService

extension KeychainAccessServiceImp: KeychainAccessService {
    func set(data: Data, key: String) throws {
        try keychain.set(data, key: key)
    }
    
    func get(key: String) throws -> Data? {
        try keychain.getData(key)
    }
    
    func reset(key: String) throws {
        try keychain.remove(key)
    }
}
