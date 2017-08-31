//
//  ViewController.swift
//  Sherift
//
//  Created by Dmitry Frishbuter on 30/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributedString = NSMutableAttributedString(string: "Hello") { attributes in
            
        }
        attributedString.resolveAttributes(inRange: NSRange(location: 0, length: 0)) { attributes in
            attributes.alignment = .left
        }
    }
}

