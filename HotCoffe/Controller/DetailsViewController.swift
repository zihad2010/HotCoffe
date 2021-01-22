//
//  DetailsViewController.swift
//  HotCoffe
//
//  Created by Asraful Alam on 7/1/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var orderViewModel: OrderDetailsVm?
    
    @IBOutlet weak var  nameLabel: UILabel!
    @IBOutlet weak var  emailLabel: UILabel!
    @IBOutlet weak var  typeLabel: UILabel!
    @IBOutlet weak var  sizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinding()
    }
    
    private func setUpBinding(){
        
        if let orderViewModel = orderViewModel{
            orderViewModel.name.bind{ self.nameLabel.text = $0}
            orderViewModel.email.bind{ self.emailLabel.text = $0}
            orderViewModel.type.bind{ self.typeLabel.text = $0}
            orderViewModel.size.bind{ self.sizeLabel.text = $0}
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.orderViewModel?.name.value = "Asraful"
        }
    }
    
}
