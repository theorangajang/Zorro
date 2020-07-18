//
//  File.swift
//  Zorro
//
//  Created by Alex Jang on 6/26/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation

protocol TextFieldType {
    var fieldType: FieldType { get }
    var text: String { get set }
    func validLength() -> Bool
    func isValid(_ text: String) -> Bool
    mutating func setTextTo(_ text: String)
    mutating func formatText(_ oldText: String)
}

extension TextFieldType {
    mutating func setTextTo(_ text: String) {
        self.text = text
    }
}

extension TextFieldType where Self: CreditCardManager {
    mutating func formatText(_ oldText: String) {
        switch self.cardType {
        case .visa, .discover, .mastercard:
            if text.count == 4 || text.count == 9 || text.count == 14 {
                if text.count > oldText.count {
                    text.insert("-", at: text.endIndex)
                }
            }
        case .amex:
            if text.count == 4 || text.count == 10 {
                if text.count > oldText.count {
                    text.insert("-", at: text.endIndex)
                }
            }
        }
    }
}
