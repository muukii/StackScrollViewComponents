//
//  TapHighlightView.swift
//  Pods
//
//  Created by muukii on 8/30/16.
//
//

import Foundation

public class TapHighlightView: UIControl {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var highlighted: Bool {
        get {
            
            return super.highlighted
        }
        set {
            
            super.highlighted = newValue
            
            UIView.animateWithDuration(0.2, delay: 0, options: [.BeginFromCurrentState, .AllowUserInteraction], animations: { 
                
                if newValue {
                    
                    self.backgroundColor = UIColor(white: 0, alpha: 0.1)
                } else {
                    
                    self.backgroundColor = UIColor(white: 0, alpha: 0)
                }
            }) { (finish) in
                    
            }
        }
    }
}