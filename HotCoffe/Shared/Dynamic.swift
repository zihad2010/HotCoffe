//
//  Dynamic.swift
//  HotCoffe
//
//  Created by Asraful Alam on 23/1/21.
//

import Foundation

// type Eraser

class Dynamic<T> {
    
    typealias  Listener = (T) -> ()
    var listener: Listener?
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
}
