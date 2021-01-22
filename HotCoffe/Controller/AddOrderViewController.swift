//
//  AddOrderViewController.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/23/20.
//

import Foundation
import UIKit

protocol AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
}

class AddOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var addCoffeeOrderViewModel = AddCoffeeOrderViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: BindingTextField!{
        didSet{
            nameTextField.bind{self.addCoffeeOrderViewModel.name = $0}
        }
    }
    @IBOutlet weak var emailTextField: BindingTextField!{
        didSet{
            emailTextField.bind{self.addCoffeeOrderViewModel.email = $0}
        }
    }
    
    
    private var coffeeSegmentedControll: UISegmentedControl!
    var delegate: AddCoffeeOrderDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        setupUI()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addCoffeeOrderViewModel.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeTypesCell", for: indexPath) as! CoffeTypesCell
        cell.coffeeType = addCoffeeOrderViewModel.types[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    
    private func setupUI(){
        
        self.coffeeSegmentedControll = UISegmentedControl(items: self.addCoffeeOrderViewModel.sizes)
        self.coffeeSegmentedControll.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.coffeeSegmentedControll)
        self.coffeeSegmentedControll.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        self.coffeeSegmentedControll.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    @IBAction func save(){
        
        let selsctedSize = self.coffeeSegmentedControll.titleForSegment(at: self.coffeeSegmentedControll.selectedSegmentIndex)
        guard let indexPath = self.tableView.indexPathForSelectedRow else { fatalError("Error in selecting coffee!")  }
    
        self.addCoffeeOrderViewModel.selectedSize = selsctedSize
        self.addCoffeeOrderViewModel.selectedType = self.addCoffeeOrderViewModel.types[indexPath.row]
        
        WebService().load(resource: Order.create(vm: self.addCoffeeOrderViewModel)) { (result) in
            
            switch result{
            case .success(let order):
                if let order = order,let delegate = self.delegate  {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                        delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
                    }
                }
                print(order!)
            case .failure(let error):
                print(error)
            }
        }
    }
}
