//
//  ViewController.swift
//  StackScrollView
//
//  Created by muukii on 08/29/2016.
//  Copyright (c) 2016 muukii. All rights reserved.
//

import UIKit

import StackScrollView
import StackScrollViewComponents
import EasyPeasy

import Then

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let eventTitleTextFieldCell = TextFieldStackViewCell(placeholder: "Title").then { cell in
            cell.valueChanged = { string in
                
            }
        }
        
        let locationTextFieldCell = TextFieldStackViewCell(placeholder: "Location").then { cell in
            cell.valueChanged = { string in
                
            }
        }
        
        let startTimeCell = DateLabelPickerStackViewCell()
        let endTimeCell = DateLabelPickerStackViewCell()
        
        let repeatCell = DiscrosureStackViewCell().then { cell in
            cell.titleLabel.text = "Repeat"
            cell.valueLabel.text = "Never"
            cell.accessoryImageView.image = UIImage(named: "next")
            cell.accessoryImageView.tintColor = UIColor(white: 0.8, alpha: 1)
            cell.tap = {
                print("tap Repeat")
            }
        }
        
        let travelTime = DiscrosureStackViewCell().then { cell in
            cell.titleLabel.text = "Travel Time"
            cell.valueLabel.text = "None"
            cell.accessoryImageView.image = UIImage(named: "next")
            cell.accessoryImageView.tintColor = UIColor(white: 0.8, alpha: 1)
            cell.tap = {
                print("tap Travel")
            }
        }
        
        let switchCell = SwitchStackViewCell().then { cell in
            cell.titleLabel.text = "All-day"
            cell.valueChanged = { [unowned travelTime] on in
                
                travelTime.setHidden(on, animated: true)
            }
        }
        
        stackScrollView.backgroundColor = UIColor(white: 0.95, alpha: 1)
                        
        stackScrollView.append(
            views: [
                SpaceStackViewCell(space: 64),
                SeparatorStackViewCell(),
                eventTitleTextFieldCell,
                SeparatorStackViewCell(leftMargin: 16),
                locationTextFieldCell,
                SeparatorStackViewCell(),
                SpaceStackViewCell(space: 36),
                SeparatorStackViewCell(),
                switchCell,
                SeparatorStackViewCell(leftMargin: 16),
                startTimeCell,
                SeparatorStackViewCell(leftMargin: 16),
                endTimeCell,
                SeparatorStackViewCell(leftMargin: 16),
                repeatCell,
                SeparatorStackViewCell(leftMargin: 16),
                travelTime,
                SeparatorStackViewCell(),
            ],
            animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var stackScrollView: StackScrollView!
}
