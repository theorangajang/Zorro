//
//  StringProtocolEX.swift
//  Zorro
//
//  Created by Alex Jang on 6/24/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import Foundation

extension StringProtocol  {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}
