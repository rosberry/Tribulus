//
//  TribulusTests.swift
//  TribulusTests
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import XCTest
@testable import Tribulus

extension NSRange: Hashable {
    public var hashValue: Int {
        return self.location ^ self.length
    }
}

extension NSRange: Equatable {
    static public func ==(lhs: NSRange, rhs: NSRange) -> Bool {
        return lhs.location == rhs.location && lhs.length == rhs.length
    }
}

class TribulusTests: XCTestCase {
    
    var defaultAttributes: Attributes {
        
        var rawAttributes: RawAttributes = [:]
        rawAttributes[NSBackgroundColorAttributeName] = UIColor.red
        rawAttributes[NSBaselineOffsetAttributeName] = NSNumber(floatLiteral: 10.1)
        rawAttributes[NSForegroundColorAttributeName] = UIColor.green
        rawAttributes[NSVerticalGlyphFormAttributeName] = 1
        rawAttributes[NSExpansionAttributeName] = NSNumber(floatLiteral: 11.1)
        rawAttributes[NSFontAttributeName] = UIFont.systemFont(ofSize: 10, weight: UIFontWeightBold)
        rawAttributes[NSKernAttributeName] = NSNumber(floatLiteral: 0.8)
        rawAttributes[NSLigatureAttributeName] = 1
        rawAttributes[NSStrikethroughStyleAttributeName] = NSUnderlineStyle.patternDashDot.rawValue
        rawAttributes[NSStrikethroughColorAttributeName] = UIColor.cyan
        rawAttributes[NSStrokeWidthAttributeName] = NSNumber(floatLiteral: 2.1)
        rawAttributes[NSStrokeColorAttributeName] = UIColor.blue
        rawAttributes[NSObliquenessAttributeName] = NSNumber(floatLiteral: 14.5)
        rawAttributes[NSTextEffectAttributeName] = NSTextEffectLetterpressStyle
        rawAttributes[NSUnderlineStyleAttributeName] = NSUnderlineStyle.patternSolid.rawValue
        rawAttributes[NSUnderlineColorAttributeName] = UIColor.brown
        rawAttributes[NSLinkAttributeName] = URL(string: "test.com")
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10.2
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = NSLineBreakMode.byClipping
        paragraphStyle.lineHeightMultiple = 2.5
        paragraphStyle.paragraphSpacing = 12.6
        paragraphStyle.paragraphSpacingBefore = 10.3
        paragraphStyle.headIndent = 8.7
        paragraphStyle.tailIndent = 7.8
        paragraphStyle.firstLineHeadIndent = 6.4
        paragraphStyle.minimumLineHeight = 19.5
        paragraphStyle.maximumLineHeight = 16.2
        paragraphStyle.hyphenationFactor = 3.4
        paragraphStyle.allowsDefaultTighteningForTruncation = true
        
        rawAttributes[NSParagraphStyleAttributeName] = paragraphStyle
        
        let attributes = Attributes(rawAttributes: rawAttributes)
        return attributes
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - NSAttributedString Attributes
    
    func testThatBeingInitializedCorrectly() {
        let testString = "Foo"
        
        var expectedAttributes: RawAttributes = [:]
        expectedAttributes[NSBackgroundColorAttributeName] = defaultAttributes.backgroundColor
        expectedAttributes[NSBaselineOffsetAttributeName] = defaultAttributes.baselineOffset
        expectedAttributes[NSForegroundColorAttributeName] = defaultAttributes.color
        expectedAttributes[NSVerticalGlyphFormAttributeName] = defaultAttributes.direction!.rawValue
        expectedAttributes[NSExpansionAttributeName] = defaultAttributes.expansion
        expectedAttributes[NSFontAttributeName] = defaultAttributes.font
        expectedAttributes[NSKernAttributeName] = defaultAttributes.kern
        expectedAttributes[NSLigatureAttributeName] = defaultAttributes.ligature! ? 1 : 0
        expectedAttributes[NSStrikethroughStyleAttributeName] = defaultAttributes.strikethroughStyle!.rawValue
        expectedAttributes[NSStrikethroughColorAttributeName] = defaultAttributes.strikethroughColor
        expectedAttributes[NSStrokeWidthAttributeName] = defaultAttributes.strokeWidth
        expectedAttributes[NSStrokeColorAttributeName] = defaultAttributes.strokeColor
        expectedAttributes[NSObliquenessAttributeName] = defaultAttributes.obliqueness
        expectedAttributes[NSTextEffectAttributeName] = defaultAttributes.textEffect!.rawValue
        expectedAttributes[NSUnderlineStyleAttributeName] = defaultAttributes.underlineStyle!.rawValue
        expectedAttributes[NSUnderlineColorAttributeName] = defaultAttributes.underlineColor
        expectedAttributes[NSLinkAttributeName] = defaultAttributes.URL
        
        let testParagraphStyle = NSMutableParagraphStyle()
        testParagraphStyle.lineSpacing = CGFloat(defaultAttributes.lineSpacing!)
        testParagraphStyle.alignment = defaultAttributes.alignment!
        testParagraphStyle.lineBreakMode = defaultAttributes.lineBreakMode!
        testParagraphStyle.lineHeightMultiple = CGFloat(defaultAttributes.lineHeightMultiplier!)
        testParagraphStyle.paragraphSpacing = CGFloat(defaultAttributes.paragraphSpacingAfter!)
        testParagraphStyle.paragraphSpacingBefore = CGFloat(defaultAttributes.paragraphSpacingBefore!)
        testParagraphStyle.headIndent = CGFloat(defaultAttributes.headIndent!)
        testParagraphStyle.tailIndent = CGFloat(defaultAttributes.tailIndent!)
        testParagraphStyle.firstLineHeadIndent = CGFloat(defaultAttributes.firstLineHeadIndent!)
        testParagraphStyle.minimumLineHeight = CGFloat(defaultAttributes.minimumLineHeight!)
        testParagraphStyle.maximumLineHeight = CGFloat(defaultAttributes.maximumLineHeight!)
        testParagraphStyle.hyphenationFactor = defaultAttributes.hyphenationFactor!
        testParagraphStyle.allowsDefaultTighteningForTruncation = defaultAttributes.allowsTighteningForTruncation!
        
        expectedAttributes[NSParagraphStyleAttributeName] = testParagraphStyle
        
        let attributedString = NSAttributedString(string: testString) {
            $0.backgroundColor = defaultAttributes.backgroundColor
            $0.baselineOffset = defaultAttributes.baselineOffset
            $0.color = defaultAttributes.color
            $0.direction = defaultAttributes.direction
            $0.expansion = defaultAttributes.expansion
            $0.font = defaultAttributes.font
            $0.kern = defaultAttributes.kern
            $0.ligature = defaultAttributes.ligature
            $0.strikethroughStyle = defaultAttributes.strikethroughStyle
            $0.strikethroughColor = defaultAttributes.strikethroughColor
            $0.strokeWidth = defaultAttributes.strokeWidth
            $0.strokeColor = defaultAttributes.strokeColor
            $0.obliqueness = defaultAttributes.obliqueness
            $0.textEffect = defaultAttributes.textEffect
            $0.underlineStyle = defaultAttributes.underlineStyle
            $0.underlineColor = defaultAttributes.underlineColor
            $0.URL = defaultAttributes.URL
            
            $0.lineSpacing = defaultAttributes.lineSpacing
            $0.alignment = defaultAttributes.alignment
            $0.lineBreakMode = defaultAttributes.lineBreakMode
            $0.lineHeightMultiplier = defaultAttributes.lineHeightMultiplier
            $0.paragraphSpacingAfter = defaultAttributes.paragraphSpacingAfter
            $0.paragraphSpacingBefore = defaultAttributes.paragraphSpacingBefore
            $0.headIndent = defaultAttributes.headIndent
            $0.tailIndent = defaultAttributes.tailIndent
            $0.firstLineHeadIndent = defaultAttributes.firstLineHeadIndent
            $0.minimumLineHeight = defaultAttributes.minimumLineHeight
            $0.maximumLineHeight = defaultAttributes.maximumLineHeight
            $0.hyphenationFactor = defaultAttributes.hyphenationFactor
            $0.allowsTighteningForTruncation = defaultAttributes.allowsTighteningForTruncation
        }
        XCTAssertEqual(testString, attributedString.string)
        
        if let existingAttributes = attributedString.existingAttributes {
            XCTAssertEqual(existingAttributes[NSBackgroundColorAttributeName] as! UIColor, expectedAttributes[NSBackgroundColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSBaselineOffsetAttributeName] as! Float, expectedAttributes[NSBaselineOffsetAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSForegroundColorAttributeName] as! UIColor, expectedAttributes[NSForegroundColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSVerticalGlyphFormAttributeName] as! Int, expectedAttributes[NSVerticalGlyphFormAttributeName] as! Int)
            XCTAssertEqual(existingAttributes[NSExpansionAttributeName] as! Float, expectedAttributes[NSExpansionAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSFontAttributeName] as! UIFont, expectedAttributes[NSFontAttributeName] as! UIFont)
            XCTAssertEqual(existingAttributes[NSKernAttributeName] as! Float, expectedAttributes[NSKernAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSLigatureAttributeName] as! Int, expectedAttributes[NSLigatureAttributeName] as! Int)
            XCTAssertEqual(existingAttributes[NSStrikethroughStyleAttributeName] as! Int, expectedAttributes[NSStrikethroughStyleAttributeName] as! Int)
            XCTAssertEqual(existingAttributes[NSStrikethroughColorAttributeName] as! UIColor, expectedAttributes[NSStrikethroughColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSStrokeWidthAttributeName] as! Float, expectedAttributes[NSStrokeWidthAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSStrokeColorAttributeName] as! UIColor, expectedAttributes[NSStrokeColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSObliquenessAttributeName] as! Float, expectedAttributes[NSObliquenessAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSTextEffectAttributeName] as! String, expectedAttributes[NSTextEffectAttributeName] as! String)
            XCTAssertEqual(existingAttributes[NSUnderlineStyleAttributeName] as! Int, expectedAttributes[NSUnderlineStyleAttributeName] as! Int)
            XCTAssertEqual(existingAttributes[NSUnderlineColorAttributeName] as! UIColor, expectedAttributes[NSUnderlineColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSLinkAttributeName] as! URL, expectedAttributes[NSLinkAttributeName] as! URL)
            XCTAssertEqual(existingAttributes[NSParagraphStyleAttributeName] as! NSParagraphStyle, expectedAttributes[NSParagraphStyleAttributeName] as! NSParagraphStyle)
        }
        else {
            XCTAssertNotNil(attributedString.existingAttributes)
        }
    }
    
    func testThatCorrectlyAppendsString() {
        let testString = "Foo"
        let stringToAppend = " Bar"
        let expectedString = "Foo Bar"
        let attributedString = NSMutableAttributedString(string: testString) {
                $0.color = .red
            }
            .append(string: stringToAppend) {
                $0.color = .green
            }
        XCTAssertEqual(attributedString.string, expectedString)
        let firstColor = attributedString.attribute(NSForegroundColorAttributeName, at: 0, effectiveRange: nil) as? UIColor
        let secondColor = attributedString.attribute(NSForegroundColorAttributeName, at: 3, effectiveRange: nil) as? UIColor
        XCTAssertEqual(firstColor, UIColor.red)
        XCTAssertEqual(secondColor, UIColor.green)
    }
    
    func testThatCorrectlyInsertsString() {
        let testString = "Foo  Baz"
        let stringToAppend = "Bar"
        let expectedString = "Foo Bar Baz"
        let attributedString = NSMutableAttributedString(string: testString) {
                $0.color = .red
            }
            .insert(string: stringToAppend, at: 4) {
                $0.color = .green
            }
        XCTAssertEqual(attributedString.string, expectedString)
        let firstColor = attributedString.attribute(NSForegroundColorAttributeName, at: 0, effectiveRange: nil) as? UIColor
        let secondColor = attributedString.attribute(NSForegroundColorAttributeName, at: 4, effectiveRange: nil) as? UIColor
        let thirdColor = attributedString.attribute(NSForegroundColorAttributeName, at: 7, effectiveRange: nil) as? UIColor
        XCTAssertEqual(firstColor, UIColor.red)
        XCTAssertEqual(secondColor, UIColor.green)
        XCTAssertEqual(thirdColor, UIColor.red)
    }
    
    
    func testThatCorrectlyAppendsImage() {
        let testString = "Foo"
        let attributedString = NSMutableAttributedString(string: testString)
        let testImage = UIImage()
        let testBounds = CGRect(x: 10, y: 20, width: 30, height: 40)
        attributedString.append(image: testImage, bounds: testBounds)
        let testStringRange = (attributedString.string as NSString).range(of: testString)
        let imageLocation = testStringRange.location + testStringRange.length
        let attachment = attributedString.attribute(NSAttachmentAttributeName, at: imageLocation, effectiveRange: nil) as! NSTextAttachment
        XCTAssertEqual(attachment.image, testImage)
        XCTAssertEqual(attachment.bounds, testBounds)
    }
    
    func testThatCorrectlyInsertsImage() {
        let testString = "Foo"
        let attributedString = NSMutableAttributedString(string: testString)
        let testImage = UIImage()
        let testBounds = CGRect(x: 10, y: 20, width: 30, height: 40)
        let imageLocation = 0
        attributedString.insert(image: testImage, bounds: testBounds, at: imageLocation)
        let attachment = attributedString.attribute(NSAttachmentAttributeName, at: imageLocation, effectiveRange: nil) as! NSTextAttachment
        XCTAssertEqual(attachment.image, testImage)
        XCTAssertEqual(attachment.bounds, testBounds)
    }
    
    func testThatCorrectlyResolvesAttributes() {
        let attributedString = NSMutableAttributedString(string: "Foo")
        let colors: [NSRange: UIColor] = [NSRange(location: 0, length: 1): .red,
                                          NSRange(location: 1, length: 1): .green,
                                          NSRange(location: 2, length: 1): .blue]
        colors.forEach { (range, color) in
            attributedString.resolveAttributes(in: range) { $0.color = color }
        }
        attributedString.enumerateAttribute(NSForegroundColorAttributeName,
                                            in: attributedString.fullRange,
                                            options: []) { (value, range, stop) in
                                                XCTAssertEqual(value as? UIColor, colors[range])
        }
    }
    
    func testThatEmptyStringHasNoAttributes() {
        let attributedString = NSMutableAttributedString(string: "")
        attributedString.resolveAttributes(in: attributedString.fullRange) {
            $0.alignment = .center
        }
        XCTAssertNil(attributedString.existingAttributes)
    }
    
    func testThatTextEffectIsBeingInitializedIncorrectly() {
        let textEffect = Attributes.TextEffect(rawValue: NSTextEffectLetterpressStyle)
        let nilTextEffect = Attributes.TextEffect(rawValue: "Foo")
        XCTAssertEqual(textEffect, .letterpress)
        XCTAssertNil(nilTextEffect)
    }
    
    // MARK: - UIFontDescriptorSymbolicTraits Convenience
    
    func testThatCorrectlySetsFontSize() {
        let attributes = Attributes()
        attributes.fontSize = 16
        XCTAssertEqual(attributes.fontSize, 16)
        attributes.fontSize = nil
        XCTAssertEqual(attributes.fontSize, 12)
    }
    
    func testThatCorrectlySetsBold() {
        let attributes = Attributes()
        attributes.bold = true
        XCTAssertTrue(attributes.bold)
        attributes.bold = false
        XCTAssertFalse(attributes.bold)
    }
    
    func testThatCorrectlySetsItalic() {
        let attributes = Attributes()
        attributes.italic = true
        XCTAssertTrue(attributes.italic)
        attributes.italic = false
        XCTAssertFalse(attributes.italic)
    }
    
    // MARK: - NSParagraphStyle Mapping
    
    func testThatCorrectlyMapsParagraphAttributes() {
        let mutableParagraphStyle = NSMutableParagraphStyle()
        mutableParagraphStyle.lineSpacing = 10.2
        mutableParagraphStyle.alignment = .center
        mutableParagraphStyle.lineBreakMode = .byClipping
        mutableParagraphStyle.lineHeightMultiple = 2.5
        mutableParagraphStyle.paragraphSpacing = 12.6
        mutableParagraphStyle.paragraphSpacingBefore = 10.3
        mutableParagraphStyle.headIndent = 8.7
        mutableParagraphStyle.tailIndent = 7.8
        mutableParagraphStyle.firstLineHeadIndent = 6.4
        mutableParagraphStyle.minimumLineHeight = 19.5
        mutableParagraphStyle.maximumLineHeight = 16.2
        mutableParagraphStyle.hyphenationFactor = 3.4
        mutableParagraphStyle.allowsDefaultTighteningForTruncation = true
        
        let lineSpacing = mutableParagraphStyle.mapAttribute { Float($0.lineSpacing) }
        let alignment = mutableParagraphStyle.mapAttribute { $0.alignment }
        let lineHeightMultiplier = mutableParagraphStyle.mapAttribute { Float($0.lineHeightMultiple) }
        let paragraphSpacingBefore = mutableParagraphStyle.mapAttribute { Float($0.paragraphSpacingBefore) }
        let paragraphSpacingAfter = mutableParagraphStyle.mapAttribute { Float($0.paragraphSpacing) }
        let headIndent = mutableParagraphStyle.mapAttribute { Float($0.headIndent) }
        let tailIndent = mutableParagraphStyle.mapAttribute { Float($0.tailIndent) }
        let firstLineHeadIndent = mutableParagraphStyle.mapAttribute { Float($0.firstLineHeadIndent) }
        let minimumLineHeight = mutableParagraphStyle.mapAttribute { Float($0.minimumLineHeight) }
        let maximumLineHeight = mutableParagraphStyle.mapAttribute { Float($0.maximumLineHeight) }
        let hyphenationFactor = mutableParagraphStyle.mapAttribute { Float($0.hyphenationFactor) }
        let lineBreakMode = mutableParagraphStyle.mapAttribute { $0.lineBreakMode }
        let allowsTighteningForTruncation = mutableParagraphStyle.mapAttribute { $0.allowsDefaultTighteningForTruncation }
        
        XCTAssertEqual(lineSpacing, 10.2)
        XCTAssertEqual(alignment, .center)
        XCTAssertEqual(lineBreakMode, .byClipping)
        XCTAssertEqual(lineHeightMultiplier, 2.5)
        XCTAssertEqual(paragraphSpacingAfter, 12.6)
        XCTAssertEqual(paragraphSpacingBefore, 10.3)
        XCTAssertEqual(headIndent, 8.7)
        XCTAssertEqual(tailIndent, 7.8)
        XCTAssertEqual(firstLineHeadIndent, 6.4)
        XCTAssertEqual(minimumLineHeight, 19.5)
        XCTAssertEqual(maximumLineHeight, 16.2)
        XCTAssertEqual(hyphenationFactor, 3.4)
        XCTAssertEqual(allowsTighteningForTruncation, true)
        
        mutableParagraphStyle.hyphenationFactor = 0.0
        let nilHyphenationFactor = mutableParagraphStyle.mapAttribute { $0.hyphenationFactor }
        XCTAssertNil(nilHyphenationFactor)
    }
}
