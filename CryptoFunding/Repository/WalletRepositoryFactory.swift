//
//  WalletRepositoryFactory.swift
//  CryptoFunding
//
//  Created by student5308 on 05/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation

class WalletRepositoryFactory {
    static func getFakeDaoRepository() -> WalletRepository {
        return WalletRepository.instance.openConnection(for: FakeDao())
    }
}
