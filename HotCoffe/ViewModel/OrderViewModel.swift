//
//  OrderViewModel.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/25/20.
//

import Foundation

class OrderListViewModel {
    
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel{
    
    var numberOfRows: Int{
        return ordersViewModel.count
    }
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
    
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel{
    
    var name: String {
        return order.name ?? ""
    }
    
    var email: String{
        return order.email ?? ""
    }
}
