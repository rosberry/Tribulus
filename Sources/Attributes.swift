//
//  Attributes.swift
//  Tribulus
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
    
    public var backgroundColor: UIColor?
    public var baselineOffset: Float?
    public var color: UIColor?
    public var direction: GlyphDirection?
    public var expansion: Float?
    public var font: UIFont?
    public var kern: Float?
    public var ligature: Bool?
    public var obliqueness: Float?
    public var strikethroughStyle: NSUnderlineStyle?
    public var strikethroughColor: UIColor?
    public var strokeWidth: Float?
    public var strokeColor: UIColor?
    public var textEffect: TextEffect?
    public var underlineStyle: NSUnderlineStyle?
    public var underlineColor: UIColor?
    public var URL: URL?
    
    // Paragraph properties
    
    /// The text alignment of the receiver.
    ///
    /// Natural text alignment is realized as left or right alignment depending on the line sweep direction of the first script contained in the paragraph.
    public var alignment: NSTextAlignment?
    
    /// When this property is set to true, the label tightens intercharacter spacing of its text before allowing any truncation to occur. The label determines the maximum amount of tightening automatically based on the font, current line width, line break mode, and other relevant information.
    /// - Default: `false`.
    /// - Availability: iOS (9.0 and later), macOS (10.11 and later), tvOS (9.0 and later), watchOS (2.0 and later)
    public var allowsTighteningForTruncation: Bool?
    
    /// The indentation of the first line of the receiver.
    ///
    /// This property contains the distance (in points) from the leading margin of a text container to the beginning of the paragraph’s first line. This value is always nonnegative.
    public var firstLineHeadIndent: Float?
    
    /// The indentation of the receiver’s lines other than the first.
    ///
    /// This property contains the distance (in points) from the leading margin of a text container to the beginning of lines other than the first. This value is always nonnegative.
    public var headIndent: Float?
    
    /// The paragraph’s threshold for hyphenation.
    ///
    /// Hyphenation is attempted when the ratio of the text width (as broken without hyphenation) to the width of the line fragment is less than the hyphenation factor. When the paragraph’s hyphenation factor is 0.0, the layout manager’s hyphenation factor is used instead. When both are 0.0, hyphenation is disabled. This property detects the user-selected language by examining the first item in preferredLanguages.
    public var hyphenationFactor: Float?
    
    /// The distance in points between the bottom of one line fragment and the top of the next.
    ///
    /// This value is always nonnegative. This value is included in the line fragment heights in the layout manager.
    public var lineSpacing: Float?
    
    /// The mode that should be used to break lines in the receiver.
    ///
    /// This property contains the line break mode to be used laying out the paragraph’s text.
    public var lineBreakMode: NSLineBreakMode?
    
    /// The line height multiplier.
    ///
    /// The natural line height of the receiver is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. The default value of this property is 0.0.
    public var lineHeightMultiplier: Float?
    
    /// The receiver’s maximum line height.
    ///
    /// This property contains the maximum height in points that any line in the receiver will occupy, regardless of the font size or size of any attached graphic. This value is always nonnegative. The default value is 0.
    ///
    /// Glyphs and graphics exceeding this height will overlap neighboring lines; however, a maximum height of 0 implies no line height limit. Although this limit applies to the line itself, line spacing adds extra space between adjacent lines.
    public var maximumLineHeight: Float?
    
    /// The receiver’s minimum height.
    ///
    /// This property contains the minimum height in points that any line in the receiver will occupy, regardless of the font size or size of any attached graphic. This value is always nonnegative
    public var minimumLineHeight: Float?
    
    /// The space after the end of the paragraph.
    ///
    /// This property contains the space (measured in points) added at the end of the paragraph to separate it from the following paragraph. This value is always nonnegative. The space between paragraphs is determined by adding the previous paragraph’s paragraphSpacing and the current paragraph’s paragraphSpacingBefore.
    public var paragraphSpacingAfter: Float?
    
    /// The distance between the paragraph’s top and the beginning of its text content.
    ///
    /// This property contains the space (measured in points) between the paragraph’s top and the beginning of its text content. The default value of this property is 0.0.
    public var paragraphSpacingBefore: Float?
    
    /// The trailing indentation of the receiver.
    ///
    /// If positive, this value is the distance from the leading margin (for example, the left margin in left-to-right text). If 0 or negative, it’s the distance from the trailing margin.
    ///
    /// For example, a paragraph style designed to fit exactly in a 2-inch wide container has a head indent of 0.0 and a tail indent of 0.0. One designed to fit with a quarter-inch margin has a head indent of 0.25 and a tail indent of –0.25.
    public var tailIndent: Float?
}


// MARK: Convenience methods
extension Attributes {
    
    /// The receiver’s point size, or the effective vertical point size for a font with a nonstandard matrix.
    public var fontSize: CGFloat? {
        set {
            if let newValue = newValue {
                self.font = currentFont.withSize(newValue)
            }
            else {
                self.font = currentFont.withSize(Attributes.defaultFontSize)
            }
        }
        get {
            return currentFont.pointSize
        }
    }
    
    /// The font’s typestyle is boldface.
    public var bold: Bool {
        set { setSymbolicTraits(.traitBold, enabled: newValue) }
        get { return currentFont.fontDescriptor.symbolicTraits.contains(.traitBold) }
    }
    
    /// The font’s typestyle is italic.
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
        if let newDescriptor = descriptor.withSymbolicTraits(currentTraits) {
            self.font = UIFont(descriptor: newDescriptor, size: font.pointSize)
        }
    }
    
    private static let defaultFontSize: CGFloat = 12
    private static let defaultFont = UIFont.systemFont(ofSize: defaultFontSize)
    private var currentFont: UIFont {
        return self.font ?? Attributes.defaultFont
    }
}
