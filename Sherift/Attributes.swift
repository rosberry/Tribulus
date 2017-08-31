//
//  Attributes.swift
//  Sherift
//
//  Created by Dmitry Frishbuter on 30/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.NSText

public typealias RawAttributes = [String: Any]

public class Attributes {
    
    public enum TextEffect: String {
        case letterpress
    }
    
    public enum GlyphDirection: Int {
        case vertical
        case horizontal
    }
    
    public var alignment: NSTextAlignment?
    public var backgroundColor: UIColor?
    public var baseline: Float?
    public var color: UIColor?
    public var direction: GlyphDirection?
    public var expansion: Float?
    public var font: UIFont?
    public var kern: Float?
    public var lineSpacing: Float?
    public var ligature: Bool?
    public var obliqueness: Float?
    public var strikethroughStyle: NSUnderlineStyle?
    public var strikethroughColor: UIColor?
    public var strokeWidth: CGFloat?
    public var strokeColor: UIColor?
    public var textEffect: TextEffect?
    public var underlineStyle: NSUnderlineStyle?
    public var underlineColor: UIColor?
    public var URL: NSURL?
    
    // Paragraph properties
    public var lineBreakMode: NSLineBreakMode?
    public var lineHeightMultiplier: Float?
    public var paragraphSpacingAfter: Float?
    public var paragraphSpacingBefore: Float?
    public var headIndent: Float?
    public var tailIndent: Float?
    public var firstLineHeadIndent: Float?
    public var minimumLineHeight: Float?
    public var maximumLineHeight: Float?
    public var hyphenationFactor: Float?
    public var allowsTighteningForTruncation: Bool?
    
    init() {}
}


// MARK: Convenience methods
extension Attributes {
    public var fontSize: CGFloat? {
        set {
            guard let newValue = newValue else {
                self.font = nil
                return
            }
            self.font = currentFont.withSize(newValue)
        }
        get {
            return currentFont.pointSize
        }
    }
    
    public var bold: Bool {
        set { setSymbolicTraits(.traitBold, enabled: newValue) }
        get { return currentFont.fontDescriptor.symbolicTraits.contains(.traitBold) }
    }
    
    public var italic: Bool {
        set { setSymbolicTraits(.traitItalic, enabled: newValue) }
        get { return currentFont.fontDescriptor.symbolicTraits.contains(.traitItalic) }
    }
    
    private func setSymbolicTraits(_ traits: UIFontDescriptorSymbolicTraits, enabled: Bool) {
        let font = currentFont
        let descriptor = font.fontDescriptor
        var currentTraits = descriptor.symbolicTraits
        if enabled {
            currentTraits.insert(traits)
        }
        else {
            currentTraits.remove(traits)
        }
        if let newDescriptor = descriptor.withSymbolicTraits(traits) {
            self.font = UIFont(descriptor: newDescriptor, size: font.pointSize)
        }
    }
    
    private static let defaultFont = UIFont.systemFont(ofSize: 12)
    private var currentFont: UIFont {
        return self.font ?? Attributes.defaultFont
    }
}