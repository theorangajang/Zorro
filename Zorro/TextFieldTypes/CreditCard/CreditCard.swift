//
//  CreditCardType.swift
//  Zorro
//
//  Created by Alex Jang on 6/24/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation

public struct CreditCard: CreditCardManager {
    var fieldType: FieldType { return .creditCard(cardType) }
    internal var text: String
    
    public var cardType: CreditCardType
    
    init(_ cardType: CreditCardType,_ cardNumber: String) {
        self.cardType = cardType
        self.text = cardNumber
    }
}
