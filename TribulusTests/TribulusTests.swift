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
        let attributes = Attributes(
            backgroundColor: .red,
            baselineOffset: 10.1,
            color: .green,
            direction: .vertical,
            expansion: 11.2, font:
            .systemFont(ofSize: 10, weight: UIFontWeightBold),
            kern: 0.8,
            ligature: true,
            obliqueness: 14.5,
            strikethroughStyle: .patternDashDot,
            strikethroughColor: .brown,
            strokeWidth: 2.1,
            strokeColor: .cyan,
            textEffect: .letterpress,
            underlineStyle: .patternSolid,
            underlineColor: .magenta,
            URL: URL(string: "test.com"),
            alignment: .center,
            allowsTighteningForTruncation: true,
            firstLineHeadIndent: 6.4,
            headIndent: 8.7,
            hyphenationFactor: 3.4,
            lineSpacing: 4.6,
            lineBreakMode: .byClipping,
            lineHeightMultiplier: 2.5,
            maximumLineHeight: 19.5,
            minimumLineHeight: 16.2,
            paragraphSpacingAfter: 12.6,
            paragraphSpacingBefore: 10.3,
            tailIndent: 7.8)
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
        let attributedString = NSMutableAttributedString(string: testString)
        let expectedAttributes = [NSForegroundColorAttributeName: defaultAttributes.color!]
        attributedString.append(string: stringToAppend) { (attributes: inout Attributes) in
            attributes.color = defaultAttributes.color
        }
        XCTAssertEqual(attributedString.string, expectedString)
        XCTAssertEqual(attributedString.existingAttributes![NSForegroundColorAttributeName] as? UIColor, expectedAttributes[NSForegroundColorAttributeName])
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
    
//    func testThatCorrectlyAppendsImage() {
//        let testString = "Foo"
//        let attributedString = NSMutableAttributedString(string: testString)
//        let testImage = UIImage()
//        let testBounds = CGRect(x: 10, y: 20, width: 30, height: 40)
//        attributedString.append(image: testImage, bounds: testBounds)
//        let testStringRange = (attributedString.string as NSString).range(of: testString)
//        let imageLocation = testStringRange.location + testStringRange.length
//        let attachment = attributedString.attribute(NSAttachmentAttributeName, at: imageLocation, effectiveRange: nil) as! NSTextAttachment
//        XCTAssertEqual(attachment.image, testImage)
//        XCTAssertEqual(attachment.bounds, testBounds)
//    }
//    
//    func testThatCorrectlyInsertsString() {
//        let testString = "Bar"
//        let stringToInsert = "Foo "
//        let expectedString = "Foo Bar"
//        let attributedString = NSMutableAttributedString(string: testString)
////        let expectedAttributes = [NSForegroundColorAttributeName: defaultAttributes.color!]
//        attributedString.insert(string: stringToInsert, at: 0) { attributes in
//            attributes.color = defaultAttributes.color
//        }
//        XCTAssertEqual(attributedString.string, expectedString)
////        XCTAssertNotEqual(attributedString.existingAttributes![NSForegroundColorAttributeName] as? UIColor, expectedAttributes[NSForegroundColorAttributeName])
//    }
//    
//    func testThatCorrectlyInsertsImage() {
//        let testString = "Foo"
//        let attributedString = NSMutableAttributedString(string: testString)
//        let testImage = UIImage()
//        let testBounds = CGRect(x: 10, y: 20, width: 30, height: 40)
//        let imageLocation = 0
//        attributedString.insert(image: testImage, bounds: testBounds, at: imageLocation)
//        let attachment = attributedString.attribute(NSAttachmentAttributeName, at: imageLocation, effectiveRange: nil) as! NSTextAttachment
//        XCTAssertEqual(attachment.image, testImage)
//        XCTAssertEqual(attachment.bounds, testBounds)
//    }
}
