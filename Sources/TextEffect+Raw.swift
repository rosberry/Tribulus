//
//  TextEffect+Raw.swift
//  Tribulus
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.NSText

extension Attributes.TextEffect {
    
    public init?(rawValue: Attributes.TextEffect.RawValue) {
        switch rawValue {
        case NSTextEffectLetterpressStyle:
            self = .letterpress
        default:
            return nil
        }
    }
    
    public var rawValue: String {
        switch self {
        case .letterpress:
            return NSTextEffectLetterpressStyle
        }
    }
}
