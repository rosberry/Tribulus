//
//  NSAttributedStringTests.swift
//  Tribulus
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import XCTest
@testable import Tribulus

enum TestCaseError: Error {
    case unexpectedNil
}

//    // Paragraph properties
//    public var lineBreakMode: NSLineBreakMode?
//    public var lineHeightMultiplier: Float?
//    public var paragraphSpacingAfter: Float?
//    public var paragraphSpacingBefore: Float?
//    public var headIndent: Float?
//    public var tailIndent: Float?
//    public var firstLineHeadIndent: Float?
//    public var minimumLineHeight: Float?
//    public var maximumLineHeight: Float?
//    public var hyphenationFactor: Float?
//    public var allowsTighteningForTruncation: Bool?

class NSAttributedStringTests: XCTestCase {
    
    var defaultAttributes: Attributes {
        let attributes = Attributes()
        attributes.backgroundColor = .red
        attributes.baselineOffset = 10.1
        attributes.color = .green
        attributes.direction = .vertical
        attributes.expansion = 11.2
        attributes.font = .systemFont(ofSize: 10, weight: UIFontWeightBold)
        attributes.kern = 0.8
        attributes.ligature = true
        attributes.strikethroughStyle = .patternDashDot
        attributes.strikethroughColor = .blue
        attributes.strokeWidth = 2.1
        attributes.strokeColor = .cyan
        attributes.obliqueness = 14.5
        attributes.textEffect = .letterpress
        attributes.underlineStyle = .patternSolid
        attributes.underlineColor = .brown
        attributes.URL = URL(string: "test.com")
        
        attributes.lineBreakMode = .byClipping
        attributes.lineHeightMultiplier = 2.5
        attributes.paragraphSpacingAfter = 12.6
        attributes.paragraphSpacingBefore = 10.3
        attributes.headIndent = 8.7
        attributes.tailIndent = 7.8
        attributes.firstLineHeadIndent = 6.4
        attributes.minimumLineHeight = 19.5
        attributes.maximumLineHeight = 16.2
        attributes.hyphenationFactor = 3.4
        attributes.allowsTighteningForTruncation = true
        
        return attributes
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testThatBeingInitializedCorrectly() {
        let testString = "Hello"
        
        var testAttributes: RawAttributes = [:]
        testAttributes[NSBackgroundColorAttributeName] = defaultAttributes.backgroundColor
        testAttributes[NSBaselineOffsetAttributeName] = defaultAttributes.baselineOffset
        testAttributes[NSForegroundColorAttributeName] = defaultAttributes.color
        testAttributes[NSVerticalGlyphFormAttributeName] = defaultAttributes.direction!.rawValue
        testAttributes[NSExpansionAttributeName] = defaultAttributes.expansion
        testAttributes[NSFontAttributeName] = defaultAttributes.font
        testAttributes[NSKernAttributeName] = defaultAttributes.kern
        testAttributes[NSLigatureAttributeName] = defaultAttributes.ligature! ? 1 : 0
        testAttributes[NSStrikethroughStyleAttributeName] = defaultAttributes.strikethroughStyle!.rawValue
        testAttributes[NSStrikethroughColorAttributeName] = defaultAttributes.strikethroughColor
        testAttributes[NSStrokeWidthAttributeName] = defaultAttributes.strokeWidth
        testAttributes[NSStrokeColorAttributeName] = defaultAttributes.strokeColor
        testAttributes[NSObliquenessAttributeName] = defaultAttributes.obliqueness
        testAttributes[NSTextEffectAttributeName] = defaultAttributes.textEffect!.rawValue
        testAttributes[NSUnderlineStyleAttributeName] = defaultAttributes.underlineStyle!.rawValue
        testAttributes[NSUnderlineColorAttributeName] = defaultAttributes.underlineColor
        testAttributes[NSLinkAttributeName] = defaultAttributes.URL
        
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
        
        testAttributes[NSParagraphStyleAttributeName] = testParagraphStyle
        
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
            XCTAssertEqual(existingAttributes[NSBackgroundColorAttributeName] as! UIColor, testAttributes[NSBackgroundColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSBaselineOffsetAttributeName] as! Float, testAttributes[NSBaselineOffsetAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSForegroundColorAttributeName] as! UIColor, testAttributes[NSForegroundColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSVerticalGlyphFormAttributeName] as! Int, testAttributes[NSVerticalGlyphFormAttributeName] as! Int)
            XCTAssertEqual(existingAttributes[NSExpansionAttributeName] as! Float, testAttributes[NSExpansionAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSFontAttributeName] as! UIFont, testAttributes[NSFontAttributeName] as! UIFont)
            XCTAssertEqual(existingAttributes[NSKernAttributeName] as! Float, testAttributes[NSKernAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSLigatureAttributeName] as! Int, testAttributes[NSLigatureAttributeName] as! Int)
            XCTAssertEqual(existingAttributes[NSStrikethroughStyleAttributeName] as! Int, testAttributes[NSStrikethroughStyleAttributeName] as! Int)
            XCTAssertEqual(existingAttributes[NSStrikethroughColorAttributeName] as! UIColor, testAttributes[NSStrikethroughColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSStrokeWidthAttributeName] as! Float, testAttributes[NSStrokeWidthAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSStrokeColorAttributeName] as! UIColor, testAttributes[NSStrokeColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSObliquenessAttributeName] as! Float, testAttributes[NSObliquenessAttributeName] as! Float)
            XCTAssertEqual(existingAttributes[NSTextEffectAttributeName] as! String, testAttributes[NSTextEffectAttributeName] as! String)
            XCTAssertEqual(existingAttributes[NSUnderlineStyleAttributeName] as! Int, testAttributes[NSUnderlineStyleAttributeName] as! Int)
            XCTAssertEqual(existingAttributes[NSUnderlineColorAttributeName] as! UIColor, testAttributes[NSUnderlineColorAttributeName] as! UIColor)
            XCTAssertEqual(existingAttributes[NSLinkAttributeName] as! URL, testAttributes[NSLinkAttributeName] as! URL)
            
            XCTAssertEqual(existingAttributes[NSParagraphStyleAttributeName] as! NSParagraphStyle, testAttributes[NSParagraphStyleAttributeName] as! NSParagraphStyle)
        }
        else {
            XCTAssertNotNil(attributedString.existingAttributes)
        }
    }
}
