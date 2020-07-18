//
//  FieldType.swift
//  Zorro
//
//  Created by Alex Jang on 7/6/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation

public enum FieldType {
    case customText
    case phoneNumber
    case creditCard(_ cardType: CreditCardType)
}
