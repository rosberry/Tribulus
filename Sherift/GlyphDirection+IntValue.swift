//
//  GlyphDirection+IntValue.swift
//  Sherift
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import Foundation

extension Attributes.GlyphDirection {
    init?(intValue: Int) {
        switch intValue {
        case 0:  self = .horizontal
        case 1:  self = .vertical
        default: return nil
        }
    }
    
    var intValue: Int {
        switch self {
        case .horizontal: return 0
        case .vertical:   return 1
        }
    }
}
