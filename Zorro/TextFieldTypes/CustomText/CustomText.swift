//
//  CustomTextField.swift
//  Zorro
//
//  Created by Alex Jang on 6/26/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation

struct CustomText: TextFieldType {
    mutating func formatText(_ oldText: String) {
        print(oldText)
    }
    
    var fieldType: FieldType { return .customText }
    internal var text: String
    private var minimumLength: Int = 12
    private var invalidChars: String?
    private var specialCharsAmt: Int = 0
    private var numbersAmt: Int = 0
    
    init(_ text: String,_ properties: CustomTextProperties? = nil) {
        self.text = text
        self.minimumLength = properties?.minimumLength ?? 12
        self.invalidChars = properties?.invalidChars ?? ""
        self.numbersAmt = properties?.numberAmt ?? 0
        self.specialCharsAmt = properties?.specialCharsAmt ?? 0
    }
    
    func isValid(_ text: String) -> Bool {
        return true
    }
    
    func validLength() -> Bool {
        return text.count >= minimumLength
    }
}
