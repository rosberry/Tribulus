//
//  ViewController.swift
//  TribulusExample
//
//  Created by Dmitry Frishbuter on 31/08/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit
import Tribulus

class ViewController: UIViewController {
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Hello") { attributes in
            attributes.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightRegular)
            attributes.backgroundColor = .cyan
            attributes.color = .blue
        }
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let attributedString = helloLabel.attributedText {
            let mutableAttributedString = attributedString.mutableCopy() as! NSMutableAttributedString
            mutableAttributedString.append(string: " World!") { attributes in
                attributes.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightBold)
                attributes.backgroundColor = .cyan
                attributes.color = .red
            }
            mutableAttributedString.insert(image: #imageLiteral(resourceName: "globe"), bounds: CGRect(x: 0, y: -8, width: 36, height: 36), at: 0)
            mutableAttributedString.resolveAttributes(in: NSRange(location: mutableAttributedString.length-1, length: 1)) { attributes in
                attributes.fontSize = 30
            }
            helloLabel.attributedText = mutableAttributedString
        }
        
        view.addSubview(helloLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = helloLabel.sizeThatFits(view.bounds.size)
        helloLabel.bounds.size = size
        helloLabel.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
    }
}
