//
//  CoffeTypesCell.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/25/20.
//

import Foundation
import UIKit

class CoffeTypesCell: UITableViewCell {
    
    @IBOutlet weak var coffeeTypeLabel: UILabel!
    
    var coffeeType: String?{
        didSet{
            coffeeTypeLabel.text = coffeeType
        }
    }
    
    
}
