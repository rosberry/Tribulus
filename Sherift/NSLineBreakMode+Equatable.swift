//
//  NSLineBreakMode+Equatable.swift
//  Sherift
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.NSParagraphStyle

extension NSLineBreakMode: Equatable {
    
    public static func ==(lhs: NSLineBreakMode, rhs: NSLineBreakMode) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
