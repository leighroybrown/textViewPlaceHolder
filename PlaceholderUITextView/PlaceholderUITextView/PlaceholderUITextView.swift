//
//  PlaceholderUITextView.swift
//  PlaceholderUITextView
//
//  Created by leighroy on 07/11/2017.
//  Copyright © 2017 leighroy. All rights reserved.
//

import UIKit

class PlaceholderUITextView: UITextView {

    /// String for placeholder text
    @IBInspectable var placeHolder: String?

    /// Localized string key for placeholder text
    @IBInspectable var placeHolderTextKey: String?

    /// Text color for the placeholder text
    @IBInspectable var placeHolderTextColor: UIColor = UIColor.lightGray

    /// Font for the placeholder text
    @IBInspectable var placeHolderFont: UIFont? = UIFont(name: "Arial", size: 20)

    /// The UILabel for the placeholder
    fileprivate var placeHolderLabel: UILabel?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        delegate = self
        var labelText: String?

        if let text = placeHolder {
            labelText = text
        } else if let text = placeHolderTextKey {
            labelText = text.localizedCapitalized
        } else {
            return
        }

        placeHolderLabel                = UILabel(frame: CGRect(x: 5, y: textContainerInset.top, width: 0, height: 0))
        placeHolderLabel?.text          = labelText
        placeHolderLabel?.textColor     = placeHolderTextColor
        placeHolderLabel?.font          = placeHolderFont
        placeHolderLabel?.textAlignment = .left
        placeHolderLabel?.numberOfLines = 0
        placeHolderLabel?.sizeToFit()

        guard let label = placeHolderLabel else {
            return
        }
        addSubview(label)
        print(label.frame)
    }
}

extension PlaceholderUITextView: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        placeHolderLabel?.isHidden = !textView.text.isEmpty
    }
}
