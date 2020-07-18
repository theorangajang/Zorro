//
//  TextFieldValidator.swift
//  Zorro
//
//  Created by Alex Jang on 6/18/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation
import Combine

class TextFieldValidator: ObservableObject {
    @Published var text: String = "" {
        didSet {
            print("didSet current text is \(text)")
            print("oldValue: \(oldValue)")
            if text.count == 4  && oldValue.count > text.count {
                text.remove(at: text.index(text.startIndex, offsetBy: 3))
            } else if text.count == 4 && oldValue.count < text.count {
                text.insert("-", at: text.index(text.startIndex, offsetBy: 4))
            }
        }
    }
    
    let characterLimit = 10
    
    var fieldTypeValidator: AnyPublisher<Bool, Never> {
        $text.map { _ in 
            return false
        }
        .eraseToAnyPublisher()
    }
    
    private var fieldType: TextFieldType
    
    init(fieldType: FieldType,_ properties: (() -> CustomTextProperties)? = nil) {
        let createField: (_ type: FieldType) -> TextFieldType = { type in
            switch type {
            case .customText:
                return CustomText("", properties?())
            case .creditCard(let cardType):
                return CreditCard(cardType, "")
            case .phoneNumber:
                return PhoneNumber()
            }
        }
        
        self.fieldType = createField(fieldType)
    }
}
