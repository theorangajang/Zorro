//
//  CreditCardTests.swift
//  ZorroTests
//
//  Created by Alex Jang on 6/26/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import XCTest
@testable import Zorro

class CreditCardTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testVisaCards() {
        visaCards.forEach {
            XCTAssertTrue(CreditCardMock(.visa, $0).validCardNumber(), "this visa card is invalid")
        }
    }
    
    func testMasterCards() {
        masterCards.forEach {
            XCTAssertTrue(CreditCardMock(.mastercard, $0).validCardNumber(), "Invalid card number")
        }
    }
    
    func testAmexCards() {
        amexCards.forEach {
            XCTAssertTrue(CreditCardMock(.amex, $0).validCardNumber(), "Invalid card number")
        }
    }
    
    func testDiscoverCards() {
        discoverCards.forEach {
            XCTAssertTrue(CreditCardMock(.discover, $0).validCardNumber(), "Invalid card number")
        }
    }
}
