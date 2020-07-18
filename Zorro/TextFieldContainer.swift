//
//  TextFieldContainer.swift
//  Zorro
//
//  Created by Alex Jang on 7/6/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import SwiftUI

struct TextFieldContainer: UIViewRepresentable {
    var fieldText: Binding<String>
    let fieldType: FieldType
    let customTextProps: (() -> CustomTextProperties)?
    
    init(_ fieldText:Binding<String>,_ type: FieldType,_ customTextProps: (() -> CustomTextProperties)? = nil) {
        self.fieldType = type
        self.fieldText = fieldText
        self.customTextProps = customTextProps
    }

    func makeCoordinator() -> TextFieldContainer.Coordinator {
        return Coordinator(self, createTextFieldTypeFor(fieldType))
    }

    func makeUIView(context: UIViewRepresentableContext<TextFieldContainer>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.placeholder = setPlaceHolderFor(fieldType)
        textField.text = fieldText.wrappedValue
        textField.delegate = context.coordinator
        context.coordinator.setup(textField)

        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<TextFieldContainer>) {
        uiView.text = self.fieldText.wrappedValue
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        private let parent: TextFieldContainer
        private var fieldType: TextFieldType
        
        init(_ textFieldContainer: TextFieldContainer,_ fieldType: TextFieldType) {
            self.fieldType = fieldType
            self.parent = textFieldContainer
        }
        
        func setup(_ textField:UITextField) {
            textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }

        @objc func textFieldDidChange(_ textField: UITextField) {
            fieldType.setTextTo(textField.text ?? "")
            fieldType.formatText(parent.fieldText.wrappedValue)
            parent.fieldText.wrappedValue = fieldType.text
        }
    }
}

extension TextFieldContainer {
    func createTextFieldTypeFor(_ fieldType: FieldType) -> TextFieldType {
        switch fieldType {
        case .customText:
            return CustomText("", customTextProps?())
        case .creditCard(let cardType):
            return CreditCard(cardType, "")
        case .phoneNumber:
            return PhoneNumber()
        }
    }
    
    func setPlaceHolderFor(_ fieldType: FieldType) -> String {
        switch fieldType {
        case .customText:
            return "Custom Text Field"
        case .creditCard:
            return "Credit Card Field"
        case .phoneNumber:
            return "Phone Number Field"
        }
    }

}
