//
//  Attributes+Paragraph.swift
//  Sherift
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.NSText

extension Attributes {
    
    private var paragraphAttributes: [Any?] {
        return [lineSpacing,
                alignment,
                lineBreakMode,
                lineHeightMultiplier,
                paragraphSpacingAfter,
                paragraphSpacingBefore,
                headIndent,
                tailIndent,
                firstLineHeadIndent,
                minimumLineHeight,
                maximumLineHeight,
                hyphenationFactor,
                allowsTighteningForTruncation]
    }
    
    var paragraphStyle: NSParagraphStyle? {
        guard !paragraphAttributes.flatMap({ $0 }).isEmpty else {
            return nil
        }
        let paragraphStyle = NSMutableParagraphStyle()
        
        if let lineSpacing = lineSpacing {
            paragraphStyle.lineSpacing = CGFloat(lineSpacing)
        }
        if let alignment = alignment {
            paragraphStyle.alignment = alignment
        }
        if let lineBreakMode = lineBreakMode {
            paragraphStyle.lineBreakMode = lineBreakMode
        }
        if let lineHeightMultiplier = lineHeightMultiplier {
            paragraphStyle.lineHeightMultiple = CGFloat(lineHeightMultiplier)
        }
        if let paragraphSpacingAfter = paragraphSpacingAfter {
            paragraphStyle.paragraphSpacing = CGFloat(paragraphSpacingAfter)
        }
        if let paragraphSpacingBefore = paragraphSpacingBefore {
            paragraphStyle.paragraphSpacingBefore = CGFloat(paragraphSpacingBefore)
        }
        if let headIndent = headIndent {
            paragraphStyle.headIndent = CGFloat(headIndent)
        }
        if let tailIndent = tailIndent {
            paragraphStyle.tailIndent = CGFloat(tailIndent)
        }
        if let firstLineHeadIndent = firstLineHeadIndent {
            paragraphStyle.firstLineHeadIndent = CGFloat(firstLineHeadIndent)
        }
        if let minimumLineHeight = minimumLineHeight {
            paragraphStyle.minimumLineHeight = CGFloat(minimumLineHeight)
        }
        if let maximumLineHeight = maximumLineHeight {
            paragraphStyle.maximumLineHeight = CGFloat(maximumLineHeight)
        }
        if let hyphenationFactor = hyphenationFactor {
            paragraphStyle.hyphenationFactor = hyphenationFactor
        }
        if #available(iOS 9.0, *) {
            if let allowsTighteningForTruncation = allowsTighteningForTruncation {
                paragraphStyle.allowsDefaultTighteningForTruncation = allowsTighteningForTruncation
            }
        }
        return paragraphStyle
    }
}
