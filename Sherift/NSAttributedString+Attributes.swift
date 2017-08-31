//
//  NSAttributedString+Attributes.swift
//  Sherift
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.NSAttributedString

extension NSAttributedString {
    var existingAttributes: RawAttributes? {
        guard length > 0 else {
            return nil
        }
        return attributes(at: length - 1, effectiveRange: nil)
    }
    
    var fullRange: NSRange {
        return NSRange(location: 0, length: length)
    }
}

public extension NSMutableAttributedString {
    public typealias AttributeResolver = (inout Attributes) -> Void
    
    var existingOrNewAttributes: Attributes {
        if let existingAttributes = self.existingAttributes {
            return Attributes(rawAttributes: existingAttributes)
        } else {
            return Attributes()
        }
    }
    
    @discardableResult
    public func add(string: String, resolver: AttributeResolver? = nil) -> NSMutableAttributedString {
        var attributes = existingOrNewAttributes
        resolver?(&attributes)
        return add(string: string, with: attributes)
    }
    
    @discardableResult
    public func add(string: String, with attributes: Attributes) -> NSMutableAttributedString {
        let attributedString = NSAttributedString(string: string, attributes: attributes.rawAttributes)
        append(attributedString)
        return self
    }
    
    public func add(attributes: Attributes, range: NSRange) {
        addAttributes(attributes.rawAttributes, range: fullRange)
    }
    
    @discardableResult
    public func add(image: UIImage, bounds: CGRect = .zero, resolver: AttributeResolver? = nil) -> NSMutableAttributedString {
        var attributes = existingOrNewAttributes
        resolver?(&attributes)
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = bounds
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(attachment: attachment))
        attributedString.addAttributes(attributes.rawAttributes, range: attributedString.fullRange)
        append(attributedString)
        return self
    }
}
