//
//  PhoneNumber.swift
//  Zorro
//
//  Created by Alex Jang on 6/26/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation

struct PhoneNumber: TextFieldType {
    mutating func formatText(_ oldText: String) {
        print(oldText)
    }
    
    var fieldType: FieldType { return .phoneNumber }
    internal var text: String = ""
    
    func isValid(_ text: String) -> Bool {
        return true
    }
    
    func validLength() -> Bool {
        return true
    }
}
