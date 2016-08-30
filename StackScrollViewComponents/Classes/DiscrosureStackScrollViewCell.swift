// DiscrosureStackScrollViewCell.swift
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

public class DiscrosureStackViewCell: UIView, StackScrollViewCellType {
    
    public var tap: () -> Void = { _ in }
    public let titleLabel = UILabel()
    public let valueLabel = UILabel()
    public let accessoryImageView = UIImageView()
    
    public init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.whiteColor()
        
        tapView.addSubview(titleLabel)
        tapView.addSubview(valueLabel)
        tapView.addSubview(accessoryImageView)
        addSubview(tapView)
        
        titleLabel <- [
            Left(16),
            CenterY(),
        ]
        
        valueLabel <- [
            Right(8).to(accessoryImageView, .Left),
            CenterY(),
        ]
        
        accessoryImageView <- [
            Right(16),
            CenterY(),
        ]
        
        tapView <- [
            Edges()
        ]
        
        tapView.addTarget(self, action: #selector(tapLabelContainerView), forControlEvents: .TouchUpInside)
        
        valueLabel.textColor = UIColor.darkGrayColor()
        
        accessoryImageView.contentMode = .Center
    }
    
    public override func intrinsicContentSize() -> CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 50)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tapView = TapHighlightView()
    
    @objc
    private func tapLabelContainerView() {
        tap()
    }
}
