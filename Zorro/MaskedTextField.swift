//
//  MaskedTextField.swift
//  Zorro
//
//  Created by Alex Jang on 6/18/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import SwiftUI

struct MaskedTextField: View {
    @State var fieldText = ""
    private var fieldTypeTitle: String
    private let fieldType: FieldType
    private let customTextProps: (() -> CustomTextProperties)?
    
    init(_ type: FieldType,_ customTextProps: (() -> CustomTextProperties)? = nil) {
        self.fieldType = type
        let fieldTypeTitle: (FieldType) -> String = { type in
            switch type {
            case .customText:
                return "Custom Text Field"
            case .creditCard:
                return "Credit Card Field"
            case .phoneNumber:
                return "Phone Number Field"
            }
        }
        self.fieldTypeTitle = fieldTypeTitle(type)
        self.customTextProps = customTextProps
    }
    
    var body: some View {
        VStack {
            TextFieldContainer($fieldText, fieldType, customTextProps)
                .fixedSize(horizontal: false, vertical: true)
            Text(fieldText)
                .background(Color.green)
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        .navigationBarTitle(Text(fieldTypeTitle), displayMode: .inline)
    }
}

struct MaskedTextField_Previews: PreviewProvider {
    static var previews: some View {
        MaskedTextField(.creditCard(.visa))
    }
}
