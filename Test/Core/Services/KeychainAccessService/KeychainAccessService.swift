//
//  KeychainAccessService.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import Foundation

protocol KeychainAccessService {
    func set(data: Data, key: String) throws
    func get(key: String) throws -> Data?
    func reset(key: String) throws
}
