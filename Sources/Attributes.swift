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
    
    /// Attribute for specifying a text effect, such as `letterpress` (aka `NSTextEffectLetterpressStyle`)
    public enum TextEffect: String {
        case letterpress
    }
    
    /// The enum that specifies text direction in attributed string.
    public enum GlyphDirection: Int {
        case horizontal
        case vertical
    }
    
    /// The value of this attribute is a `UIColor` object. Use this attribute to specify the color of the background area behind the text. If you do not specify this attribute, no background color is drawn.
    public var backgroundColor: UIColor?
    
    /// The value of this attribute is a floating point value indicating the character’s offset from the baseline, in points. The default value is `0`.
    public var baselineOffset: Float?
    
    /// The value of this attribute is a `UIColor` object. Use this attribute to specify the color of the text during rendering. If you do not specify this attribute, the text is rendered in black.
    public var color: UIColor?
    
    /// The value of this attribute is a `GlyphDirection` enum case. The value `horizontal` indicates horizontal text. The value `vertical` indicates vertical text. In iOS, horizontal text is always used and specifying a different value is undefined.
    public var direction: GlyphDirection?
    
    /// The value of this attribute is a floating point value indicating the log of the expansion factor to be applied to glyphs. The default value is `0`, indicating no expansion.
    public var expansion: Float?
    
    /// The value of this attribute is a `UIFont` object. Use this attribute to change the font for a range of text. If you do not specify this attribute, the string uses a 12-point System font by default.
    public var font: UIFont?
    
    /// The value of this attribute is a floating-point value. This value specifies the number of points by which to adjust kern-pair characters. Kerning prevents unwanted space from occurring between specific characters and depends on the font. The value `nil` or `0` means kerning is disabled. The default value for this attribute is `nil`.
    public var kern: Float?
    
    /// The value of this attribute is a `Bool`. Ligatures cause specific character combinations to be rendered using a single custom glyph that corresponds to those characters. The value `false` indicates no ligatures. The value `true` indicates the use of the default ligatures.
    public var ligature: Bool?
    
    /// The value of this attribute is a floating point value indicating skew to be applied to glyphs. The default value is `0`, indicating no skew.
    public var obliqueness: Float?
    
    /// The value of this attribute is `NSUnderlineStyle` enum case. This value indicates whether the text has a line through it and corresponds to one of the constants described in `NSUnderlineStyle`. The default value for this attribute is `nil` indicating no strikethrough.
    public var strikethroughStyle: NSUnderlineStyle?
    
    /// The value of this attribute is a UIColor object. The default value is `nil`, indicating same as value of `color` attribute.
    public var strikethroughColor: UIColor?
    
    /// The value of this attribute is a floating-point value. This value represents the amount to change the stroke width and is specified as a percentage of the font point size. Specify `0` (the default) for no additional changes. Specify positive values to change the stroke width alone. Specify negative values to stroke and fill the text. For example, a typical value for outlined text would be `3.0`.
    public var strokeWidth: Float?
    
    /// The value of this parameter is a `UIColor` object. If it is not defined (which is the case by default), it is assumed to be the same as the value of `color` attribute; otherwise, it describes the outline color. For more details, see Drawing attributed strings that are both filled and stroked.
    public var strokeColor: UIColor?
    
    /// The value of this attribute is an `TextEffect` enum case. Use this attribute to specify a text effect, such as `letterpress` (aka `NSTextEffectLetterpressStyle`). The default value of this property is `nil`, indicating no text effect.
    public var textEffect: TextEffect?
    
    /// TThe value of this attribute is `NSUnderlineStyle` enum case. This value indicates whether the text is underlined and corresponds to one of the constants described in `NSUnderlineStyle`. The default value for this attribute is `nil` indicating no underline.
    public var underlineStyle: NSUnderlineStyle?
    
    /// The value of this attribute is a `UIColor` object. The default value is `nil`, indicating same as value of `color` attribute.
    public var underlineColor: UIColor?
    
    /// The value of this attribute is an URL object. The default value of this property is `nil`, indicating no link.
    public var URL: URL?
    
    
    // Paragraph properties
    
    /// The text alignment of the receiver.
    ///
    /// Natural text alignment is realized as left or right alignment depending on the line sweep direction of the first script contained in the paragraph.
    public var alignment: NSTextAlignment?
    
    /// When this property is set to `true`, the label tightens intercharacter spacing of its text before allowing any truncation to occur. The label determines the maximum amount of tightening automatically based on the font, current line width, line break mode, and other relevant information.
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
    /// Hyphenation is attempted when the ratio of the text width (as broken without hyphenation) to the width of the line fragment is less than the hyphenation factor. When the paragraph’s hyphenation factor is `0.0`, the layout manager’s hyphenation factor is used instead. When both are `0.0`, hyphenation is disabled. This property detects the user-selected language by examining the first item in preferredLanguages.
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
    /// The natural line height of the receiver is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. The default value of this property is `0.0`.
    public var lineHeightMultiplier: Float?
    
    /// The receiver’s maximum line height.
    ///
    /// This property contains the maximum height in points that any line in the receiver will occupy, regardless of the font size or size of any attached graphic. This value is always nonnegative. The default value is `0`.
    ///
    /// Glyphs and graphics exceeding this height will overlap neighboring lines; however, a maximum height of `0` implies no line height limit. Although this limit applies to the line itself, line spacing adds extra space between adjacent lines.
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
    /// This property contains the space (measured in points) between the paragraph’s top and the beginning of its text content. The default value of this property is `0.0`.
    public var paragraphSpacingBefore: Float?
    
    /// The trailing indentation of the receiver.
    ///
    /// If positive, this value is the distance from the leading margin (for example, the left margin in left-to-right text). If 0 or negative, it’s the distance from the trailing margin.
    ///
    /// For example, a paragraph style designed to fit exactly in a 2-inch wide container has a head indent of `0.0` and a tail indent of `0.0`. One designed to fit with a quarter-inch margin has a head indent of `0.25` and a tail indent of `–0.25`.
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
