//
//  Order.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/25/20.
//

import Foundation

enum CoffeeType:String,Codable,CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}
enum CoffeeSize:String,Codable,CaseIterable {
    case small
    case medium
    case large
}

struct Order:Codable {
    let name: String?
    let email: String?
    let type: CoffeeType?
    let size:CoffeeSize?
}

extension Order{
    
    init?(_ vm : AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else{
            return nil
        }
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
    
}

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let coffeeOrderUrl = URL.url else {
            fatalError("URl was incorrect")
        }
        return Resource<[Order]>(url: coffeeOrderUrl)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel)-> Resource<Order?>{
        
        let order = Order(vm)
        
        guard let coffeeOrderUrl = URL.url else {
            fatalError("URl was incorrect")
        }
        
        guard let data = try? JSONEncoder().encode(order) else { fatalError("Error encoding Order!") }
        var resource = Resource<Order?>(url: coffeeOrderUrl)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}
