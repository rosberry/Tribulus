//
//  NSAttributedString+Attributes.swift
//  Tribulus
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
    
    /// Returns an NSAttributedString object initialized with a given string and attribute resolver.
    ///
    /// - Parameters:
    ///   - string: The string for the new attributed string.
    ///   - resolver: Closure, that allows to configure attributes for the new attributed string.
    public convenience init(string: String, resolver: AttributeResolver) {
        let attributes = Attributes()
        resolver(attributes)
        self.init(string: string, attributes: attributes.rawAttributes)
    }
}


public extension NSMutableAttributedString {
    
    /// Adds the characters and attributes, configured by means of resolver, to the end of the receiver.
    ///
    /// - Parameters:
    ///   - string: The string whose characters and attributes are added.
    ///   - resolver: Closure, that allows to configure attributes for appended string.
    @discardableResult
    public func append(string: String, resolver: AttributeResolver) -> NSMutableAttributedString {
        let attributes = Attributes()
        resolver(attributes)
        let attributedString = NSAttributedString(string: string, attributes: attributes.rawAttributes)
        append(attributedString)
        return self
    }
    
    /// Inserts the characters of the given string configured with `AttributeResolver` into the receiver at the given index.
    ///
    /// - Parameters:
    ///   - string: The string whose characters are inserted.
    ///   - resolver: Closure, that allows to configure attributes for inserted string.
    @discardableResult
    public func insert(string: String, at location: Int, resolver: AttributeResolver) -> NSMutableAttributedString {
        let attributes = Attributes()
        resolver(attributes)
        let attributedString = NSAttributedString(string: string, attributes: attributes.rawAttributes)
        insert(attributedString, at: location)
        return self
    }
    
    /// Adds passed image to the end of the receiver.
    ///
    /// - Parameters:
    ///   - image: Image representing the text attachment contents.
    ///   - bounds: The bounds rectangle origin is at the current glyph location on the text baseline. The default value is CGRectZero.
    @discardableResult
    public func append(image: UIImage, bounds: CGRect = .zero) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = bounds
        append(NSAttributedString(attachment: attachment))
        return self
    }
    
    /// Inserts passed image into the receiver at the given index.
    ///
    /// - Parameters:
    ///   - image: Image representing the text attachment contents.
    ///   - bounds: The bounds rectangle origin is at the current glyph location on the text baseline. The default value is CGRectZero.
    ///   - location: The index at which the image is inserted.
    @discardableResult
    public func insert(image: UIImage, bounds: CGRect = .zero, at location: Int) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = bounds
        insert(NSAttributedString(attachment: attachment), at: location)
        return self
    }
    
    /// Adds the attributes configured with `AttributeResolver` to the characters in the specified range.
    ///
    /// - Parameters:
    ///   - range: The range of characters to which the specified attributes apply.
    ///   - resolver: Closure, that allows to configure attributes for specified range of characters.
    @discardableResult
    public func resolveAttributes(in range: NSRange, resolver: AttributeResolver) -> NSMutableAttributedString {
        let attributes = Attributes()
        resolver(attributes)
        addAttributes(attributes.rawAttributes, range: range)
        return self
    }
}
