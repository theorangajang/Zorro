//
//  SequenceEX.swift
//  Zorro
//
//  Created by Alex Jang on 6/24/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element {
        return reduce(.zero, +)
    }
}
