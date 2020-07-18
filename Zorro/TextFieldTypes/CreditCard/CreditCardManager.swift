//
//  CreditCardManager.swift
//  Zorro
//
//  Created by Alex Jang on 6/26/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation

protocol CreditCardManager: TextFieldType {
    var cardType: CreditCardType { get set }
    func validLength() -> Bool
    func getFullCardNameForCardType() -> String
    func validCardNumber() -> Bool
    func performLuhnAlgorithm(with cardNumber: [Int]) -> Bool
}

extension CreditCardManager {
    func isValid(_ text: String) -> Bool {
        return validLength() && validCardNumber()
    }
    
    func validLength() -> Bool {
        switch cardType {
        case .amex:
            return text.count == 15
        case .discover, .mastercard:
            return text.count == 16 || text.count == 19
        case .visa:
            return text.count == 13 || text.count == 16 || text.count == 19
        }
    }
    
    func validCardNumber() -> Bool {
        performLuhnAlgorithm(with: text.digits)
    }
    
    internal func performLuhnAlgorithm(with cardNumber: [Int]) -> Bool {
        guard cardNumber.count >= 9 else { return false }
        let originalCheckDigit = cardNumber.last
        let characters = cardNumber.dropLast().reversed()
        var digitSum = 0
        for (index, character) in characters.enumerated() {
            let value = Int(String(character)) ?? 0
            if index % 2 == 0 {
                let doubledVal = value * 2
                let product = doubledVal > 9 ? doubledVal - 9 : doubledVal
                digitSum = digitSum + product
            } else {
                digitSum = digitSum + value
            }
        }
        
        digitSum = digitSum * 9
        return originalCheckDigit == digitSum % 10
    }
    
    mutating func addHyphensToCreditCardNumberTo(_ oldText: String) {
        if text.count == 4 || text.count == 9 || text.count == 14 {
            if text.count > oldText.count {
                text.insert("-", at: text.endIndex)
            }
        }
    }
    
    func getFullCardNameForCardType() -> String {
        switch cardType {
        case .amex: return "American Express"
        case .discover: return "Discover"
        case .mastercard: return "MasterCard"
        case .visa: return "Visa"
        }
    }
    
    
}
