//
//  WrappedTextAroundImageVC.swift
//  WrappedTextAroundImage
//
//  Created by PRANOTI KULKARNI on 9/15/21.
//
// Taken this approach of using UITextView instead of UILabel, since creating a floating text around image using
// exclusionPaths is only applicable in textContainer on UITextView.

import UIKit

class WrappedTextAroundImageVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        
        //scrolling and selectable disabled for textView.
        textView.textColor = .blue
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        
        textView.textContainer.lineBreakMode = .byTruncatingTail
        
        let font = UIFont.systemFont(ofSize: 26)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.orange
        ]
        
        let attributedString = NSMutableAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", attributes: attributes)
        
        imageView.image = UIImage(named: "iOSImg")
        let path = UIBezierPath(rect: imageView.frame)
        textView.textContainer.exclusionPaths = [path]
        textView.addSubview(imageView)
        
        textView.attributedText = attributedString
    }

}
