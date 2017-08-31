//
//  NSAttributedString+Attributes.swift
//  Sherift
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.NSAttributedString

public typealias AttributeResolver = (inout Attributes) -> Void

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
    
    public convenience init(string: String, resolver: AttributeResolver? = nil) {
        var attributes = Attributes()
        resolver?(&attributes)
        self.init(string: string, attributes: attributes.rawAttributes)
    }
}


public extension NSMutableAttributedString {
    
    @discardableResult
    public func add(string: String, resolver: AttributeResolver? = nil) -> NSMutableAttributedString {
        var attributes = existingOrNewAttributes
        resolver?(&attributes)
        return add(string: string, with: attributes)
    }
    
    func add(string: String, with attributes: Attributes) -> NSMutableAttributedString {
        let attributedString = NSAttributedString(string: string, attributes: attributes.rawAttributes)
        append(attributedString)
        return self
    }
    
    public func resolveAttributes(inRange range: NSRange, resolver: AttributeResolver) {
        var attributes = existingOrNewAttributes
        resolver(&attributes)
        addAttributes(attributes.rawAttributes, range: range)
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
