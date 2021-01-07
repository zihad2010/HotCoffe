//
//  BindingTextField.swift
//  HotCoffe
//
//  Created by Asraful Alam on 6/1/21.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = {_ in}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func bind(callBack: @escaping(String) -> ()) {
        self.textChangeClosure = callBack
    }
    
    private func commonInit(){
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        if let text = textField.text{
            self.textChangeClosure(text)
        }
    }
}
