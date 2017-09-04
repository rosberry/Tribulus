//
//  NSParagraphStyle+Compare.swift
//  Tribulus
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.NSParagraphStyle

extension NSParagraphStyle {
    
    func mapAttribute<U: Equatable>(descriptor: (NSParagraphStyle) -> U) -> U? {
        let x = descriptor(self)
        let y = descriptor(NSParagraphStyle.default)
        return (x == y) ? nil : x
    }
}
