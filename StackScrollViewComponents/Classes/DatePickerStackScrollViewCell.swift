// DatePickerStackViewCell.swift
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

import UIKit

import EasyPeasy
import StackScrollView

public class DateLabelPickerStackViewCell: UIView, StackScrollViewCellType {
    
    public let datePicker = UIDatePicker()
    public let dateLabel = UILabel()
    public var editing: Bool = false
    
    public init() {
        super.init(frame: .zero)
        
        datePickerContainerView.clipsToBounds = true
        datePickerContainerView.addSubview(datePicker)
        dateLabelContainerView.addSubview(dateLabel)
        
        addSubview(dateLabelContainerView)
        addSubview(datePickerContainerView)
        
        datePicker <- [
            Edges().with(.LowPriority),
            CenterY().with(.MediumPriority),
        ]
        
        dateLabel <- [
            Edges(8),
        ]
        
        dateLabelContainerView <- [
            Top(),
            Right(),
            Left(),
            Height(50),
            Bottom().to(datePickerContainerView, .Top),
        ]
        
        datePickerContainerView <- [
            Right(0),
            Left(),
            Bottom(),
            Height(0),
        ]
        
        dateLabel.text = dateFormatter.stringFromDate(datePicker.date)
        
        datePicker.addTarget(self, action: #selector(dateValueChanged), forControlEvents: .ValueChanged)
        dateLabelContainerView.addTarget(self, action: #selector(tapLabelContainerView), forControlEvents: .TouchUpInside)
    }
    
    public override func intrinsicContentSize() -> CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: UIViewNoIntrinsicMetric)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let datePickerContainerView = UIView()
    private let dateLabelContainerView = TapHighlightView()
    private let dateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .FullStyle
        dateFormatter.timeStyle = .FullStyle
        return dateFormatter
    }()
    
    @objc
    private func dateValueChanged() {
        
        dateLabel.text = dateFormatter.stringFromDate(datePicker.date)
    }
    
    @objc
    private func tapLabelContainerView() {
        
        editing = !editing
        
        UIView.animateWithDuration(0.3, delay: 0, options: [.BeginFromCurrentState], animations: { 
            
            if self.editing {
                NSLayoutConstraint.deactivateConstraints(
                    self.datePickerContainerView <- [
                        Height(),
                    ]
                )
            } else {
                self.datePickerContainerView <- [
                    Height(0),
                ]
            }
            
            self.stackScrollView.layoutIfNeeded()
            
        }) { (finish) in
            
        }
    }
}
