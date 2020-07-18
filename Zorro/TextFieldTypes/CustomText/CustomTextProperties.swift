//
//  CustomTextProperties.swift
//  Zorro
//
//  Created by Alex Jang on 6/30/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation

public struct CustomTextProperties: TextProperties {
    public var invalidChars: String?
    public var minimumLength: Int = 0
    public var numberAmt: Int = 0
    public var specialCharsAmt: Int = 0
}

protocol TextProperties {
    var invalidChars: String? { get set }
    var minimumLength: Int { get set }
    var numberAmt: Int { get set }
    var specialCharsAmt: Int { get set }
}
