//
//  OrderDetailsViewModel.swift
//  HotCoffe
//
//  Created by Asraful Alam on 22/1/21.
//

import Foundation

struct OrderDetailsVm {
    
    let name: Dynamic<String>
    let email: Dynamic<String>
    let size: Dynamic<String>
    let type: Dynamic<String>
    
    init(orderVm: OrderViewModel) {
        self.name = Dynamic(orderVm.name)
        self.email = Dynamic(orderVm.email)
        self.size = Dynamic(orderVm.size)
        self.type = Dynamic(orderVm.type)
    }
}

