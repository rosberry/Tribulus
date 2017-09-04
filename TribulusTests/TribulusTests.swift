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
        
        let testParagraphStyle = NSMutableParagraphStyle()
        testParagraphStyle.lineBreakMode = NSLineBreakMode.byClipping
        testParagraphStyle.lineHeightMultiple = 2.5
        testParagraphStyle.paragraphSpacing = 12.6
        testParagraphStyle.paragraphSpacingBefore = 10.3
        testParagraphStyle.headIndent = 8.7
        testParagraphStyle.tailIndent = 7.8
        testParagraphStyle.firstLineHeadIndent = 6.4
        testParagraphStyle.minimumLineHeight = 19.5
        testParagraphStyle.maximumLineHeight = 16.2
        testParagraphStyle.hyphenationFactor = 3.4
        testParagraphStyle.allowsDefaultTighteningForTruncation = true
        
        rawAttributes[NSParagraphStyleAttributeName] = testParagraphStyle
        
        let attributes = Attributes(rawAttributes: rawAttributes)
        return attributes
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
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
}
