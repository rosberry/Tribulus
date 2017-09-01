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
    
    public convenience init(string: String, resolver: AttributeResolver) {
        var attributes = Attributes()
        resolver(&attributes)
        self.init(string: string, attributes: attributes.rawAttributes)
    }
}


public extension NSMutableAttributedString {
    
    @discardableResult
    public func append(string: String, resolver: AttributeResolver) -> NSMutableAttributedString {
        var attributes = existingOrNewAttributes
        resolver(&attributes)
        return append(string: string, with: attributes)
    }
    
    @discardableResult
    func insert(string: String, at location: Int, resolver: AttributeResolver) -> NSMutableAttributedString {
        var attributes = existingOrNewAttributes
        resolver(&attributes)
        return insert(string: string, with: attributes, at: location)
    }
    
    @discardableResult
    public func resolveAttributes(in range: NSRange, resolver: AttributeResolver) -> NSMutableAttributedString {
        var attributes = existingOrNewAttributes
        resolver(&attributes)
        addAttributes(attributes.rawAttributes, range: range)
        return self
    }
    
    @discardableResult
    public func append(image: UIImage, bounds: CGRect = .zero) -> NSMutableAttributedString {
        return add(image:image, bounds: bounds)
    }
    
    @discardableResult
    public func insert(image: UIImage, bounds: CGRect = .zero, at location: Int) -> NSMutableAttributedString {
        return add(image:image, bounds: bounds, at: location)
    }
    
    func append(string: String, with attributes: Attributes) -> NSMutableAttributedString {
        let attributedString = NSAttributedString(string: string, attributes: attributes.rawAttributes)
        append(attributedString)
        return self
    }
    
    func insert(string: String, with attributes: Attributes, at location: Int) -> NSMutableAttributedString {
        let attributedString = NSAttributedString(string: string, attributes: attributes.rawAttributes)
        insert(attributedString, at: location)
        return self
    }
    
    func add(image: UIImage, bounds: CGRect = .zero, at location: Int? = nil) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = bounds
        let attributedString = NSAttributedString(attributedString: NSAttributedString(attachment: attachment))
        if let location = location {
            insert(attributedString, at: location)
        }
        else {
            append(attributedString)
        }
        return self
    }
}
