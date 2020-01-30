//
//  WalletData.swift
//  CryptoFunding
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation

struct WalletData {
    let address: String
    let data: Data
    let name: String
    
    init(address: String, data: Data, name: String) {
        self.address = address
        self.data = data
        self.name = name
    }
}
