//
//  OrdersTableViewCell.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/25/20.
//
import Foundation
import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var viewModel:OrderViewModel? {
        
        didSet{
            self.nameLabel.text = viewModel?.name
            self.emailLabel.text = viewModel?.email
        }
        
    }
}
