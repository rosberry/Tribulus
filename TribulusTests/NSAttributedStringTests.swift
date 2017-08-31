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

func XCTAssertEqualAndNotNil<T: Equatable>(_ lhs: T, _ rhs: T) {
    XCTAssertNotNil(lhs)
    XCTAssertNotNil(rhs)
    XCTAssert(lhs == rhs)
}

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
        attributes.URL = NSURL(string: "test.com")
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
    
//    public var alignment: NSTextAlignment?
//    public var backgroundColor: UIColor?
//    public var baseline: Float?
//    public var color: UIColor?
//    public var direction: GlyphDirection?
//    public var expansion: Float?
//    public var font: UIFont?
//    public var kern: Float?
//    public var lineSpacing: Float?
//    public var ligature: Bool?
//    public var obliqueness: Float?
//    public var strikethroughStyle: NSUnderlineStyle?
//    public var strikethroughColor: UIColor?
//    public var strokeWidth: CGFloat?
//    public var strokeColor: UIColor?
//    public var textEffect: TextEffect?
//    public var underlineStyle: NSUnderlineStyle?
//    public var underlineColor: UIColor?
//    public var URL: NSURL?
//    
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
    
    func testThatBeingInitializedCorrectly() throws {
        let testString = "Hello"
        
        var testAttributes: [String : Any] = [:]
        testAttributes[NSBackgroundColorAttributeName] = defaultAttributes.backgroundColor
        testAttributes[NSBaselineOffsetAttributeName] = defaultAttributes.baselineOffset
        testAttributes[NSForegroundColorAttributeName] = defaultAttributes.color
        testAttributes[NSVerticalGlyphFormAttributeName] = defaultAttributes.direction?.rawValue
        testAttributes[NSExpansionAttributeName] = defaultAttributes.expansion
        testAttributes[NSFontAttributeName] = defaultAttributes.font
        testAttributes[NSKernAttributeName] = defaultAttributes.kern
        testAttributes[NSLigatureAttributeName] = 1
        testAttributes[NSStrikethroughStyleAttributeName] = defaultAttributes.strikethroughStyle?.rawValue
        testAttributes[NSStrikethroughColorAttributeName] = defaultAttributes.strikethroughColor
        testAttributes[NSStrokeWidthAttributeName] = defaultAttributes.strokeWidth
        testAttributes[NSStrokeColorAttributeName] = defaultAttributes.strokeColor
        testAttributes[NSObliquenessAttributeName] = defaultAttributes.obliqueness
        testAttributes[NSTextEffectAttributeName] = defaultAttributes.textEffect?.rawValue
        testAttributes[NSUnderlineStyleAttributeName] = defaultAttributes.underlineStyle?.rawValue
        testAttributes[NSUnderlineColorAttributeName] = defaultAttributes.underlineColor
        testAttributes[NSLinkAttributeName] = defaultAttributes.URL
        
//        testAttributes[NSParagraphStyleAttributeName] = paragraphStyle
        
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
            $0.URL = NSURL(string: "test.com")
        }
        XCTAssertEqual(testString, attributedString.string)
        if let existingAttributes = attributedString.existingAttributes {
            existingAttributes.forEach { (key: String, value: Any) in
                XCTAssertEqualAndNotNil(value, testAttributes[key])
            }
        }
        else {
            XCTAssertNotNil(attributedString.existingAttributes)
        }
    }
}
