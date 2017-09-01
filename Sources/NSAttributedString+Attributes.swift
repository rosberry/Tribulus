//
//  NSAttributedString+Attributes.swift
//  Sherift
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.NSAttributedString

public typealias AttributeResolver = (Attributes) -> Void

extension NSAttributedString {
    
    var existingAttributes: RawAttributes? {
        guard length > 0 else {
            return nil
        }
        return attributes(at: length - 1, effectiveRange: nil)
    }
    
    var existingOrNewAttributes: Attributes {
        if let existingAttributes = self.existingAttributes {
            return Attributes(rawAttributes: existingAttributes)
        } else {
            return Attributes()
        }
    }
    
    var fullRange: NSRange {
        return NSRange(location: 0, length: length)
    }
    
    public convenience init(string: String, resolver: AttributeResolver) {
        let attributes = Attributes()
        resolver(attributes)
        self.init(string: string, attributes: attributes.rawAttributes)
    }
}


public extension NSMutableAttributedString {
    
    @discardableResult
    public func append(string: String, resolver: AttributeResolver) -> NSMutableAttributedString {
        let attributes = existingOrNewAttributes
        resolver(attributes)
        return append(string: string, with: attributes)
    }
    
    func append(string: String, with attributes: Attributes) -> NSMutableAttributedString {
        let attributedString = NSAttributedString(string: string, attributes: attributes.rawAttributes)
        append(attributedString)
        return self
    }
    
    @discardableResult
    public func resolveAttributes(in range: NSRange, resolver: AttributeResolver) -> NSMutableAttributedString {
        let attributes = existingOrNewAttributes
        resolver(attributes)
        addAttributes(attributes.rawAttributes, range: range)
        return self
    }
    
    @discardableResult
    public func append(image: UIImage, bounds: CGRect = .zero, resolver: AttributeResolver? = nil) -> NSMutableAttributedString {
        let attributes = existingOrNewAttributes
        resolver?(attributes)
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = bounds
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(attachment: attachment))
        attributedString.addAttributes(attributes.rawAttributes, range: attributedString.fullRange)
        append(attributedString)
        return self
    }
}
