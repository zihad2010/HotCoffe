//
//  AddCoffeeOrderViewModel.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/25/20.
//

import Foundation

struct AddCoffeeOrderViewModel {
    
    var name: String?
    var email: String?
    
    var selectedSize: String?
    var selectedType: String?
    
    
    
    var types: [String] {
        return CoffeeType.allCases.map({$0.rawValue.capitalized})
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map({$0.rawValue.capitalized})
    }
}
