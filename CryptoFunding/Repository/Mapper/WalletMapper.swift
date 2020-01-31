//
//  WalletMapper.swift
//  CryptoFunding
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation

class WalletMapper {
    
    static func modelToData(model: Wallet) -> WalletData {
        return WalletData(address: model.address, data: model.data, name: model.name)
    }
    
    static func dataToModel(data: WalletData) -> Wallet {
        return Wallet(address: data.address, data: data.data, name: data.name)
    }
    
    static func dataListToModelList(datas: [WalletData]) -> [Wallet] {
        var listOfWallets = [Wallet]()
        
        for data in datas {
            listOfWallets.append(Wallet(address: data.address, data: data.data, name: data.name))
        }
        
        return listOfWallets
    }
    
    static func modelListToDataList(models: [Wallet]) -> [WalletData] {
        var listOfWalletData = [WalletData]()
        
        for model in models {
            listOfWalletData.append(WalletData(address: model.address, data: model.data, name: model.name))
        }
        
        return listOfWalletData
    }
}
