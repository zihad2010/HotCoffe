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

    func modelAt(indexPath:IndexPath) -> OrderViewModel {
        return self.ordersViewModel[indexPath.row]
    }
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        return order.name ?? ""
    }
    
    var email: String {
        return order.email ?? ""
    }
    
    var type: String {
        return order.type ?? ""
    }
    
    var size: String {
        return order.size ?? ""
    }
}
