//
//  CreditCardMock.swift
//  ZorroTests
//
//  Created by Alex Jang on 6/26/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation
@testable import Zorro

struct CreditCardMock: CreditCardManager {
    var isValid: Bool { return validLength() && validCardNumber() }
    
    internal var cardType: CreditCardType
    internal var cardNumber: String
    
    init(_ cardType: CreditCardType = .visa,_ cardNumber: String = "") {
        self.cardType = cardType
        self.cardNumber = cardNumber
    }
    
}
