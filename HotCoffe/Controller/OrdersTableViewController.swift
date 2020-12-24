//
//  OrdersTableViewController.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/23/20.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    let orderListViewModel = OrderListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrder()
    }
    
    private func populateOrder(){
        
        guard let coffeeOrderUrl = URL.url else {
            fatalError("URl was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrderUrl)
        
        WebService().load(resource: resource) {[weak self] (result) in
            
            switch result {
            
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension OrdersTableViewController  {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell", for: indexPath) as! OrdersTableViewCell
        cell.viewModel = orderListViewModel.orderViewModel(at: indexPath.row)
        return cell
    }
    
}
