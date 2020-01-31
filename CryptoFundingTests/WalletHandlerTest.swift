//
//  RepositoryTest.swift
//  CryptoFundingTests
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation
import XCTest
@testable import CryptoFunding

class WalletHandlerTest: XCTestCase {
    func testGenerateNewWallet() {
        let wallet = WalletHandler.generateNewWallet(password: "Test", walletName: "NameTest")
        XCTAssertTrue(wallet.name == "NameTest")
    }
    
    func testLoadingWalletSucceedOnCorrectPasswordAndAddress() {
        let wallet = WalletHandler.generateNewWallet(password: "Test", walletName: "NameTest")
        XCTAssertNotNil(WalletHandler.loadCurrentWallet(password: "Test", walletAddress: wallet.address))
    }
    
    func testLoadingWalletFailsOnWrongPasswordAndAddress() {
        let wallet = WalletHandler.generateNewWallet(password: "Test", walletName: "NameTest")
        XCTAssertNil(WalletHandler.loadCurrentWallet(password: "sdfsdf", walletAddress: wallet.address))
        XCTAssertNil(WalletHandler.loadCurrentWallet(password: "Test", walletAddress: "sffdgdfg"))
    }
    
    func testGeneratingWalletFromPrivateKey() {
        let wallet = WalletHandler.generateWalletFromPrivateKey(privateKey: "7EB64DDB45D47DEF728B97D2B539B62CE7FCBF278D9610C96D8ED279A527FC96", password: "Test", walletName: "TestName")
        XCTAssertNotNil(wallet)
        XCTAssertTrue(wallet?.address ?? "" == "0x5Ac5A604D32eFB8C3eE1aDbC8fc1bc6Ec4Bc95AC")
    }
    
    func testLoadingWalletGeneratedFromPrivateKey() {
        let wallet = WalletHandler.generateWalletFromPrivateKey(privateKey: "7EB64DDB45D47DEF728B97D2B539B62CE7FCBF278D9610C96D8ED279A527FC96", password: "Test", walletName: "TestName")
        XCTAssertNotNil(WalletHandler.loadCurrentWallet(password: "Test", walletAddress: wallet?.address ?? ""))
    }
    
    func testLoadingWalletGeneratedFromPrivateKeyFailsOnWrongPasswordAndAddress() {
        let wallet = WalletHandler.generateWalletFromPrivateKey(privateKey: "7EB64DDB45D47DEF728B97D2B539B62CE7FCBF278D9610C96D8ED279A527FC96", password: "Test", walletName: "TestName")
        XCTAssertNil(WalletHandler.loadCurrentWallet(password: "sdfsdf", walletAddress: wallet?.address ?? ""))
        XCTAssertNil(WalletHandler.loadCurrentWallet(password: "Test", walletAddress: "sffdgdfg"))
    }
    
    func testGeneratingWalletsAddsThemToStorage() {
        let repo = WalletRepository.instance
        let _ = WalletHandler.generateNewWallet(password: "Test", walletName: "NameTest")
        let _ = WalletHandler.generateWalletFromPrivateKey(privateKey: "7EB64DDB45D47DEF728B97D2B539B62CE7FCBF278D9610C96D8ED279A527FC96", password: "sdfsf", walletName: "SecondWallet")
        XCTAssertTrue(repo.getAllWallets().count == 2)
    }
}
