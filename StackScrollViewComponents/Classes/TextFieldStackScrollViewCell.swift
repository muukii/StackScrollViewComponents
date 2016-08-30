// TextFieldStackScrollViewCell.swift
//
// Copyright (c) 2016 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

import EasyPeasy
import StackScrollView

public class TextFieldStackViewCell: UIView, StackScrollViewCellType {
    
    public var valueChanged: (String) -> Void = { _ in }
    public let textField = UITextField()
    
    public init(placeholder: String = "") {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.whiteColor()
        
        addSubview(textField)
        
        textField <- [
            Left(16),
            Right(16),
            Top(8),
            Bottom(8),
        ]
        
        textField.placeholder = placeholder
        textField.addTarget(self, action: #selector(textChanged), forControlEvents: .EditingChanged)
    }
    
    public override func intrinsicContentSize() -> CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 50)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func textChanged() {
        
        valueChanged(textField.text ?? "")
    }
}
