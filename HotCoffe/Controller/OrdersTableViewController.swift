//
//  OrdersTableViewController.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/23/20.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController, AddCoffeeOrderDelegate {
    
    let orderListViewModel = OrderListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrder()
    }
    
    private func populateOrder(){
        
        WebService().load(resource: Order.all) {[weak self] (result) in
            
            switch result {
            
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map({ (order) -> OrderViewModel in
                    return OrderViewModel.init(order: order)
                })
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

extension OrdersTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  vc = segue.destination as? AddOrderViewController
        vc?.delegate = self
    }
    
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        
        let orderVm = OrderViewModel(order: order)
        self.orderListViewModel.ordersViewModel.append(orderVm)
        self.tableView.insertRows(at: [IndexPath.init(row: self.orderListViewModel.ordersViewModel.count - 1, section: 0)], with: .none)
    }
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        
    }
}

