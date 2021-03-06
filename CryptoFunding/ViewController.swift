//
//  ViewController.swift
//  CryptoFunding
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import UIKit
import web3swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let repoInstance = WalletRepositoryFactory.getFakeDaoRepository()
        /* Exemple d'import de portefeuille avec une clé privée, la création d'un nouveau portefeuille n'est pas plus compliqué */
        let wallet = WalletHandler.generateWalletFromPrivateKey(privateKey: "7EB64DDB45D47DEF728B97D2B539B62CE7FCBF278D9610C96D8ED279A527FC96", password: "test", walletName: "MyWallet")!
        repoInstance.setCurrent(wallet: wallet)
        let currentWallet = WalletRepository.instance.getCurrent()
        if let currentWallet = currentWallet {
            /* Exemple d'intéraction avec la blockchain en lecture -> Pas de coût en gas */
//            let result = FundingContract.getTotalTasks(userAddress: currentWallet.getAddress()!, projectId: 0)
//            print(result)
            /* Exemple d'intéraction avec la blockchain en écriture -> Coût en gas, récupération de l'estimation du coût, écriture de la transaction avec le mdp du portefeuille et récupération de la recette à la fin de la transaction */
//            let writeTx = FundingContract.launchFundingProject(userAddress: currentWallet.getAddress()!, taskNumber: 1, deadlines: [100000000000000000], amountAsked: [500])
//            if let writeTx = writeTx {
//                let estimatedGasCost = Web3Util.estimateGasCost(tx: writeTx)
//                print(estimatedGasCost ?? "")
//                guard let sentTx = Web3Util.writeTransaction(tx: writeTx, password: "test") else {return}
//                print(sentTx.hash)
//                Web3Util.getTransactionReceipt(hash: sentTx.hash)
//                print("test")
//            }
        }
        
    }


}

