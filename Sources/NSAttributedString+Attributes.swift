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
        let attributes = Attributes()
        resolver(attributes)
        let attributedString = NSAttributedString(string: string, attributes: attributes.rawAttributes)
        append(attributedString)
        return self
    }
    
    @discardableResult
    func insert(string: String, at location: Int, resolver: AttributeResolver) -> NSMutableAttributedString {
        let attributes = Attributes()
        resolver(attributes)
        let attributedString = NSAttributedString(string: string, attributes: attributes.rawAttributes)
        insert(attributedString, at: location)
        return self
    }
    
    @discardableResult
    public func append(image: UIImage, bounds: CGRect = .zero) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = bounds
        append(NSAttributedString(attachment: attachment))
        return self
    }
    
    @discardableResult
    public func insert(image: UIImage, bounds: CGRect = .zero, at location: Int) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = bounds
        insert(NSAttributedString(attachment: attachment), at: location)
        return self
    }
    
    @discardableResult
    public func resolveAttributes(in range: NSRange, resolver: AttributeResolver) -> NSMutableAttributedString {
        let attributes = Attributes()
        resolver(attributes)
        addAttributes(attributes.rawAttributes, range: range)
        return self
    }
}
