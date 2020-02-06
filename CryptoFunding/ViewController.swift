//
//  ViewController.swift
//  CryptoFunding
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import UIKit
import Web3swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let receipt = try! Web3Util.instance.eth.getTransactionReceipt("0xe159c0af9743bf6517621d705dc9cbd79ec9493ad82ed619e68b66730f4a97a3")
//        print(receipt.contractAddress?.address)
        let repoInstance = WalletRepositoryFactory.getFakeDaoRepository()
        let wallet = WalletHandler.generateWalletFromPrivateKey(privateKey: "7EB64DDB45D47DEF728B97D2B539B62CE7FCBF278D9610C96D8ED279A527FC96", password: "test", walletName: "MyWallet")!
        repoInstance.setCurrent(wallet: wallet)
        let currentWallet = WalletRepository.instance.getCurrent()
        if let currentWallet = currentWallet {
            let result = SimpleTestContract.deploy(address: currentWallet.getAddress()!, password: "test")
            if let result = result {
                print(result.hash)
                Web3Util.getTransactionReceipt(hash: result.hash)
                print("test")
            }
        }
        
    }


}

