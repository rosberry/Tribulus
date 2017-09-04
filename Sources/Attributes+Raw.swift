//
//  Attributes+Raw.swift
//  Tribulus
//
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.NSText

extension Attributes {
    
    var rawAttributes: RawAttributes {
        var result: RawAttributes = [:]
        result[NSBackgroundColorAttributeName] = backgroundColor
        result[NSBaselineOffsetAttributeName] = baselineOffset
        result[NSForegroundColorAttributeName] = color
        result[NSVerticalGlyphFormAttributeName] = direction?.rawValue
        result[NSExpansionAttributeName] = expansion
        result[NSFontAttributeName] = font
        result[NSKernAttributeName] = kern
        if let ligature = ligature {
            result[NSLigatureAttributeName] = ligature ? 1 : 0
        }
        if let paragraphStyle = paragraphStyle {
            result[NSParagraphStyleAttributeName] = paragraphStyle
        }
        result[NSStrikethroughStyleAttributeName] = strikethroughStyle?.rawValue
        result[NSStrikethroughColorAttributeName] = strikethroughColor
        result[NSStrokeWidthAttributeName] = strokeWidth
        result[NSStrokeColorAttributeName] = strokeColor
        result[NSObliquenessAttributeName] = obliqueness
        result[NSTextEffectAttributeName] = textEffect?.rawValue
        result[NSUnderlineStyleAttributeName] = underlineStyle?.rawValue
        result[NSUnderlineColorAttributeName] = underlineColor
        result[NSLinkAttributeName] = URL
        
        return result
    }
    
    convenience init(rawAttributes attributes: RawAttributes) {
        self.init()
        
        backgroundColor = attributes[NSBackgroundColorAttributeName] as? UIColor
        baselineOffset = attributes[NSBaselineOffsetAttributeName] as? Float
        color = attributes[NSForegroundColorAttributeName] as? UIColor
        if let direction = attributes[NSVerticalGlyphFormAttributeName] as? Int {
            self.direction = GlyphDirection(rawValue: direction)
        }
        expansion = attributes[NSExpansionAttributeName] as? Float
        font = attributes[NSFontAttributeName] as? UIFont
        kern = attributes[NSKernAttributeName] as? Float
        if let ligature = attributes[NSLigatureAttributeName] as? Int {
            self.ligature = (ligature == 1)
        }
        obliqueness = attributes[NSObliquenessAttributeName] as? Float
        if let strikethroughStyle = attributes[NSStrikethroughStyleAttributeName] as? Int {
            self.strikethroughStyle = NSUnderlineStyle(rawValue: strikethroughStyle)
        }
        strikethroughColor = attributes[NSStrikethroughColorAttributeName] as? UIColor
        strokeWidth = attributes[NSStrokeWidthAttributeName] as? Float
        strokeColor = attributes[NSStrokeColorAttributeName] as? UIColor
        if let textEffect = attributes[NSTextEffectAttributeName] as? String {
            self.textEffect = TextEffect(rawValue: textEffect)
        }
        if let underlineStyle = attributes[NSUnderlineStyleAttributeName] as? Int {
            self.underlineStyle = NSUnderlineStyle(rawValue: underlineStyle)
        }
        underlineColor = attributes[NSUnderlineColorAttributeName] as? UIColor
        URL = attributes[NSLinkAttributeName] as? URL
        
        if let paragraph = attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle {
            alignment = paragraph.mapAttribute { $0.alignment }
            lineSpacing = paragraph.mapAttribute { Float($0.lineSpacing) }
            lineHeightMultiplier = paragraph.mapAttribute { Float($0.lineHeightMultiple) }
            paragraphSpacingBefore = paragraph.mapAttribute { Float($0.paragraphSpacingBefore) }
            paragraphSpacingAfter = paragraph.mapAttribute { Float($0.paragraphSpacing) }
            headIndent = paragraph.mapAttribute { Float($0.headIndent) }
            tailIndent = paragraph.mapAttribute { Float($0.tailIndent) }
            firstLineHeadIndent = paragraph.mapAttribute { Float($0.firstLineHeadIndent) }
            minimumLineHeight = paragraph.mapAttribute { Float($0.minimumLineHeight) }
            maximumLineHeight = paragraph.mapAttribute { Float($0.maximumLineHeight) }
            hyphenationFactor = paragraph.mapAttribute { Float($0.hyphenationFactor) }
            lineBreakMode = paragraph.mapAttribute { $0.lineBreakMode }
            if #available(iOS 9.0, *) {
                allowsTighteningForTruncation = paragraph.mapAttribute { $0.allowsDefaultTighteningForTruncation }
            }
        }
    }
}
